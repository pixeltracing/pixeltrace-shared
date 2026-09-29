import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/src/internal/config.dart';
import 'package:pixeltrace_flutter/src/internal/errors.dart';
import 'package:pixeltrace_flutter/src/widgets/pixeltrace_capture.dart';
import 'package:pixeltrace_flutter/src/widgets/pixeltrace_service.dart';

import 'fake_connection.dart';
import 'fake_sinks.dart';

const _kCapture = PixeltraceCaptureConfig(fps: 30, captureInDebugMode: true);

/// A tree with a service above the capture widget. Passing null for [service]
/// leaves the capture widget with no service in scope.
Widget _testRoot({
  PixeltraceServiceConfig? service = const PixeltraceServiceConfig(
    projectKey: 'test-key',
  ),
  PixeltraceErrorSink errorSink = const DefaultErrorSink(),
  PixeltraceCaptureConfig capture = _kCapture,
  Widget? child,
}) {
  Widget tree = child ?? PixeltraceCapture(config: capture);
  if (service != null) {
    tree = PixeltraceService(
      config: service,
      errorSink: errorSink,
      child: tree,
    );
  }
  return Directionality(textDirection: TextDirection.ltr, child: tree);
}

void main() {
  late FakeConnection conn;

  void install(FakeConnection connection) {
    conn = connection;
    useFakeConnection(connection);
  }

  setUp(() => install(FakeConnection()));
  tearDown(resetFakeConnection);

  testWidgets('connects once a service comes into scope', (tester) async {
    await tester.pumpWidget(_testRoot(service: null));
    await tester.pumpAndSettle();
    expect(conn.calls, isEmpty);

    await tester.pumpWidget(_testRoot());
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish']);
  });

  testWidgets('toggling captureEnabled starts and ends the recording', (
    tester,
  ) async {
    Widget build(bool enabled) => _testRoot(
      capture: PixeltraceCaptureConfig(
        fps: 30,
        captureEnabled: enabled,
        captureInDebugMode: true,
      ),
    );

    await tester.pumpWidget(build(false));
    await tester.pumpAndSettle();
    expect(conn.calls, isEmpty);

    await tester.pumpWidget(build(true));
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish']);

    await tester.pumpWidget(build(false));
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish', 'dispose']);
    expect(conn.live, isFalse);
  });

  testWidgets('changing fps rebinds the source without re-establishing', (
    tester,
  ) async {
    Widget build(int fps) => _testRoot(
      capture: PixeltraceCaptureConfig(fps: fps, captureInDebugMode: true),
    );

    await tester.pumpWidget(build(30));
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish']);
    expect(conn.fps, 30);

    // A new rate reuses the established connection rather than renegotiating.
    await tester.pumpWidget(build(60));
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish', 'swap']);
    expect(conn.fps, 60);
    expect(conn.live, isTrue);
  });

  testWidgets('an unchanged config does not re-capture', (tester) async {
    await tester.pumpWidget(_testRoot());
    await tester.pumpAndSettle();

    await tester.pumpWidget(_testRoot());
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish']);
  });

  testWidgets('flipping the transport starts a new recording', (tester) async {
    Widget build(PixeltraceTransport transport) => _testRoot(
      service: PixeltraceServiceConfig(
        projectKey: 'test-key',
        transport: transport,
      ),
    );

    await tester.pumpWidget(build(PixeltraceTransport.webrtc));
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish']);

    // The two paths are two different recordings, so the switch ends one and
    // starts the other rather than swapping underneath a live session. That
    // falls out of the config's value equality, which is why the transport
    // belongs in it.
    await tester.pumpWidget(build(PixeltraceTransport.webcodecs));
    await tester.pumpAndSettle();
    expect(conn.calls, [
      'prepare',
      'establish',
      'dispose',
      'prepare',
      'establish',
    ]);
    expect(conn.live, isTrue);
  });

  testWidgets('removing the widget from the tree ends the recording', (
    tester,
  ) async {
    await tester.pumpWidget(_testRoot());
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish']);

    await tester.pumpWidget(_testRoot(child: const SizedBox()));
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish', 'dispose']);
  });

  testWidgets('a teardown mid-establish is serialized behind it', (
    tester,
  ) async {
    // Hold establish open so the widget is disposed while it is negotiating.
    final gate = conn.establishGate = Completer<void>();

    await tester.pumpWidget(_testRoot());
    await tester.pump();
    await tester.pump();
    expect(conn.calls, ['prepare', 'establish']);

    // Dispose while establish is in flight. The queue runs the teardown after
    // the establish it is behind, so there is exactly one of it.
    await tester.pumpWidget(_testRoot(child: const SizedBox()));
    await tester.pump();

    gate.complete();
    await tester.pumpAndSettle();
    expect(conn.calls, ['prepare', 'establish', 'dispose']);
    expect(conn.live, isFalse);
  });

  testWidgets(
    'a config change after a failed establish starts no new session',
    (tester) async {
      install(ThrowingConnection());

      Widget build(int fps) => _testRoot(
        capture: PixeltraceCaptureConfig(fps: fps, captureInDebugMode: true),
      );

      await tester.pumpWidget(build(30));
      await tester.pumpAndSettle();
      expect(conn.calls, ['prepare', 'establish', 'dispose']);

      await tester.pumpWidget(build(60));
      await tester.pumpAndSettle();
      expect(conn.calls, ['prepare', 'establish', 'dispose']);
    },
  );

  group('errors', () {
    testWidgets('a transient capture failure stays out of FlutterError', (
      tester,
    ) async {
      install(ThrowingConnection());

      await tester.pumpWidget(_testRoot());
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets('errors reach FlutterError with no sink of the host\'s', (
      tester,
    ) async {
      install(ThrowingConnection(StateError('establish failed')));
      await tester.pumpWidget(_testRoot());
      await tester.pumpAndSettle();

      final error = tester.takeException();
      expect(error, isA<StateError>());
      expect((error as StateError).message, 'establish failed');
    });

    // A sink owns everything the SDK raises, not just our own error types
    for (final error in <Object>[
      const PixeltraceServiceException(message: 'establish failed'),
      StateError('establish failed'),
    ]) {
      testWidgets('a configured sink receives a ${error.runtimeType}', (
        tester,
      ) async {
        install(ThrowingConnection(error));

        final sink = RecordingSink();
        await tester.pumpWidget(_testRoot(errorSink: sink));
        await tester.pumpAndSettle();

        // The sink handles the error, so nothing leaks to FlutterError.
        expect(sink.errors, [same(error)]);
        expect(tester.takeException(), isNull);
      });
    }

    testWidgets('a recording keeps the sink it started with', (tester) async {
      final first = RecordingSink();
      final second = RecordingSink();

      await tester.pumpWidget(_testRoot(errorSink: first));
      await tester.pumpAndSettle();
      expect(conn.calls, ['prepare', 'establish']);

      // Same destination, so the session is not rebuilt. The rate change is what
      // provokes the failure.
      conn.swapError = const PixeltraceServiceException(message: 'swap failed');
      await tester.pumpWidget(
        _testRoot(
          errorSink: second,
          capture: const PixeltraceCaptureConfig(
            fps: 60,
            captureInDebugMode: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(conn.calls, ['prepare', 'establish', 'swap', 'dispose']);
      expect(first.errors, hasLength(1));
      expect(second.errors, isEmpty);
    });

    testWidgets('a new recording adopts the sink', (tester) async {
      final first = RecordingSink();
      final second = RecordingSink();

      await tester.pumpWidget(_testRoot(errorSink: first));
      await tester.pumpAndSettle();
      expect(first.errors, isEmpty);

      // Fail the new link's establish to see which sink hears about it.
      install(ThrowingConnection());
      await tester.pumpWidget(
        _testRoot(
          service: const PixeltraceServiceConfig(projectKey: 'other-key'),
          errorSink: second,
        ),
      );
      await tester.pumpAndSettle();
      expect(first.errors, isEmpty);
      expect(second.errors, hasLength(1));
    });
  });
}
