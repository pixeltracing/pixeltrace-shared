@TestOn('browser')
@Skip(
  'Hangs under `flutter test --platform chrome`, for reasons not yet pinned '
  'down: an animation frame awaited inside runAsync resolves fine on its own, '
  'and so does pump.start() followed by two of them, but this file as a whole '
  'never completes. The regression these guard against — a composite that '
  'reports success and emits blank pixels — is covered meanwhile by '
  'canvas_compositor_test.dart, which does run.',
)
library;

import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/src/internal/web/canvas_compositor.dart';
import 'package:pixeltrace_flutter/src/internal/web/frame_pump.dart';
import 'package:web/web.dart' as web;

import '../fake_sinks.dart';
import 'frame_probe.dart';

const _kEncodeWidth = 320;
const _kEncodeHeight = 180;

web.HTMLCanvasElement _filledCanvas() {
  final canvas = web.document.createElement('canvas') as web.HTMLCanvasElement
    ..width = _kEncodeWidth
    ..height = _kEncodeHeight;
  final ctx = canvas.getContext('2d') as web.CanvasRenderingContext2D;
  ctx.fillStyle = '#ff00ff'.toJS;
  ctx.fillRect(0, 0, _kEncodeWidth, _kEncodeHeight);
  return canvas;
}

/// Waits out [count] real animation frames, so the pump's own callbacks have
/// somewhere to run. Only meaningful inside [WidgetTester.runAsync], since a
/// widget test's clock is fake and the browser's is not.
Future<void> settleAnimationFrames([int count = 4]) async {
  for (var i = 0; i < count; i++) {
    final done = Completer<void>();
    web.window.requestAnimationFrame(((double _) => done.complete()).toJS);
    await done.future;
  }
}

void main() {
  late CanvasCompositor compositor;
  late FramePump pump;
  late RecordingSink sink;
  late List<web.VideoFrame> frames;

  setUp(() {
    sink = RecordingSink();
    frames = [];
    compositor = CanvasCompositor(width: _kEncodeWidth, height: _kEncodeHeight)
      ..source = _filledCanvas();
    pump = FramePump(
      compositor: compositor,
      fps: 60,
      onFrame: frames.add,
      sink: sink,
    );
  });

  tearDown(() {
    for (final frame in frames) {
      frame.close();
    }
    pump.dispose();
    compositor.dispose();
  });

  testWidgets('the animation-frame loop emits frames with pixels in them', (
    tester,
  ) async {
    await tester.pumpWidget(const SizedBox());

    await tester.runAsync(() async {
      pump.start();
      await settleAnimationFrames();
    });

    expect(frames, isNotEmpty);
    expect(sink.errors, isEmpty);

    // The assertion this whole file exists for. Everything up to here passes
    // just as happily when the composite reads a cleared drawing buffer.
    await tester.runAsync(() async {
      final rgba = await readRgba(frames.first);
      expectNotBlank(probeGrid(rgba, _kEncodeWidth, _kEncodeHeight));
    });
  });

  testWidgets('a screen at rest costs nothing', (tester) async {
    await tester.pumpWidget(const SizedBox());

    await tester.runAsync(() async {
      pump.start();
      await settleAnimationFrames();
    });
    final afterStart = frames.length;
    expect(afterStart, greaterThan(0));

    // No Flutter frame, so no work: the loop stops rather than spinning.
    await tester.runAsync(settleAnimationFrames);
    expect(frames, hasLength(afterStart));
  });

  testWidgets('a Flutter frame restarts the loop', (tester) async {
    await tester.pumpWidget(const SizedBox());

    await tester.runAsync(() async {
      pump.start();
      await settleAnimationFrames();
    });
    final afterStart = frames.length;

    await tester.runAsync(settleAnimationFrames);
    expect(frames, hasLength(afterStart));

    // Flutter rasterized something, which is the whole change signal.
    await tester.pump();
    await tester.runAsync(settleAnimationFrames);
    expect(frames.length, greaterThan(afterStart));
  });

  testWidgets('a stopped pump composites nothing more', (tester) async {
    await tester.pumpWidget(const SizedBox());

    await tester.runAsync(() async {
      pump.start();
      await settleAnimationFrames();
    });
    pump.stop();
    final afterStop = frames.length;

    await tester.pump();
    await tester.runAsync(settleAnimationFrames);
    expect(frames, hasLength(afterStop));

    // ...and it is reusable afterwards.
    await tester.runAsync(() async {
      pump.start();
      await settleAnimationFrames();
    });
    expect(frames.length, greaterThan(afterStop));
  });

  testWidgets('the frame-rate ceiling skips composites', (tester) async {
    pump = FramePump(
      compositor: compositor,
      fps: 1,
      onFrame: frames.add,
      sink: sink,
    );
    await tester.pumpWidget(const SizedBox());

    await tester.runAsync(() async {
      pump.start();
      await settleAnimationFrames();
    });
    expect(frames, hasLength(1));

    // Well inside a one-second gap, so every Flutter frame here is skipped
    // rather than composited.
    for (var i = 0; i < 5; i++) {
      await tester.pump();
      await tester.runAsync(settleAnimationFrames);
    }
    expect(frames, hasLength(1));
  });
}
