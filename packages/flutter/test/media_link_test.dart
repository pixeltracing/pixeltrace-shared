import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/src/internal/config.dart';
import 'package:pixeltrace_flutter/src/internal/connection.dart';
import 'package:pixeltrace_flutter/src/internal/errors.dart';
import 'package:pixeltrace_flutter/src/internal/media_link.dart';
import 'package:pixeltrace_flutter/src/internal/stub/stub_video_source.dart';

import 'fake_connection.dart';
import 'fake_watchers.dart';

/// (fake time) longer than the retries
const _kRecovery = Duration(minutes: 1);
const _kConfig = PixeltraceServiceConfig(projectKey: 'test-key');

StubVideoSource _source(int fps) => StubVideoSource(fps: fps);

void main() {
  late FakeConnection conn;
  late FakeWatchers watchers;

  /// How many times the link has tried to rejoin the session.
  int attempts() => conn.calls.where((c) => c == 'reestablish').length;

  setUp(() {
    conn = FakeConnection();
    useFakeConnection(conn);
    watchers = FakeWatchers.install();
  });

  tearDown(() {
    resetFakeConnection();
    FakeWatchers.reset();
  });

  test('rebind swaps the source on a connected link', () async {
    final link = MediaLink(config: _kConfig);
    addTearDown(link.dispose);

    link.connect(_source(30));
    await pumpEventQueue();

    link.rebind(_source(60));
    await pumpEventQueue();
    expect(conn.calls, ['prepare', 'establish', 'swap']);
    expect(conn.fps, 60);
    expect(link.state, MediaLinkState.connected);
  });

  test('rebinds are applied in order', () async {
    final link = MediaLink(config: _kConfig);
    addTearDown(link.dispose);

    // Queued back to back with no awaits between them: the work queue runs one
    // at a time, so the last one sent is the one left.
    link.connect(_source(30));
    link.rebind(_source(60));
    link.rebind(_source(24));

    await pumpEventQueue();
    expect(conn.calls, ['prepare', 'establish', 'swap', 'swap']);
    expect(conn.fps, 24);
  });

  test('rebind on an idle link is dropped', () async {
    final link = MediaLink(config: _kConfig);
    addTearDown(link.dispose);

    // Nothing has connected, so there is no session to point anywhere.
    link.rebind(_source(30));
    await pumpEventQueue();
    expect(conn.calls, isEmpty);
    expect(link.state, MediaLinkState.idle);
  });

  test('a link that lost its session cannot be revived by a rebind', () async {
    conn = ThrowingConnection();
    useFakeConnection(conn);

    final link = MediaLink(config: _kConfig);
    addTearDown(link.dispose);

    link.connect(_source(30));
    await pumpEventQueue();
    expect(conn.calls, ['prepare', 'establish', 'dispose']);

    link.rebind(_source(60));
    await pumpEventQueue();
    expect(conn.calls, ['prepare', 'establish', 'dispose']);
  });

  test('dispose during establish runs after it, not through it', () async {
    final gate = conn.establishGate = Completer<void>();
    final link = MediaLink(config: _kConfig);

    link.connect(_source(30));
    await pumpEventQueue();
    expect(conn.calls, ['prepare', 'establish']);

    // Queued behind the in-flight establish rather than interleaved with it,
    // so there is no half-established session to reconcile afterwards.
    link.dispose();
    await pumpEventQueue();
    expect(conn.calls, ['prepare', 'establish']);

    gate.complete();
    await pumpEventQueue();

    expect(conn.calls, ['prepare', 'establish', 'dispose']);
    expect(link.state, MediaLinkState.disposed);
  });

  test('rebind after dispose is a no-op rather than a throw', () async {
    final link = MediaLink(config: _kConfig);

    link.connect(_source(30));
    await pumpEventQueue();
    link.dispose();
    await pumpEventQueue();

    // Callers capture their source asynchronously, so one can land after
    // teardown through no fault of their own.
    expect(() => link.rebind(_source(60)), returnsNormally);
    await pumpEventQueue();
    expect(conn.calls, ['prepare', 'establish', 'dispose']);
  });

  group('reconnect', () {
    /// A link with an established session, ready for the drop
    MediaLink connected(FakeAsync time, {int fps = 30}) {
      final link = MediaLink(config: _kConfig)..connect(_source(fps));
      time.flushMicrotasks();
      expect(conn.calls, ['prepare', 'establish']);
      return link;
    }

    test('a dropped media path is rebuilt', () {
      fakeAsync((time) {
        final link = connected(time);
        addTearDown(link.dispose);

        conn.emit(PixeltraceConnectionState.failed);
        time.flushMicrotasks();

        // The session is still live server-side, so the link holds onto it
        // rather than giving it up and starting a new recording.
        expect(link.state, MediaLinkState.reconnecting);
        expect(attempts(), 0);

        time.elapse(_kRecovery);
        expect(link.state, MediaLinkState.connected);
        expect(conn.calls, contains('reestablish'));
        expect(conn.live, isTrue);
      });
    });

    test('the transient connection states are not drops', () {
      fakeAsync((time) {
        final link = connected(time);
        addTearDown(link.dispose);

        for (final state in [
          PixeltraceConnectionState.idle,
          PixeltraceConnectionState.connecting,
          PixeltraceConnectionState.connected,
          PixeltraceConnectionState.disconnected,
          PixeltraceConnectionState.closed,
        ]) {
          conn.emit(state);
        }
        time.elapse(_kRecovery);
        expect(link.state, MediaLinkState.connected);
        expect(attempts(), 0);
      });
    });

    test('a second drop does not start a second recovery', () {
      fakeAsync((time) {
        final link = connected(time);
        addTearDown(link.dispose);

        conn.emit(PixeltraceConnectionState.failed);
        conn.emit(PixeltraceConnectionState.failed);
        time.flushMicrotasks();
        expect(link.state, MediaLinkState.reconnecting);

        time.elapse(_kRecovery);
        expect(link.state, MediaLinkState.connected);
        expect(attempts(), 1);
      });
    });

    test('a recovery that never takes gives the session up for idle', () {
      fakeAsync((time) {
        final link = MediaLink(config: _kConfig)..connect(_source(30));
        time.flushMicrotasks();

        conn.reestablishError = const PixeltraceServiceException(
          message: 'reestablish failed',
        );
        conn.emit(PixeltraceConnectionState.failed);
        time.flushMicrotasks();
        expect(link.state, MediaLinkState.reconnecting);

        time.elapse(_kRecovery);
        expect(attempts(), greaterThan(1));
        expect(link.state, MediaLinkState.idle);
        expect(conn.calls, contains('dispose'));
        expect(conn.live, isFalse);
        expect(conn.hasListeners, isFalse);
      });
    });

    test('a resume with nothing to recover is ignored', () {
      fakeAsync((time) {
        final link = connected(time);
        addTearDown(link.dispose);

        watchers.page.signals.connectivityRestored();
        time.flushMicrotasks();
        expect(link.state, MediaLinkState.connected);
        expect(conn.calls, ['prepare', 'establish']);
      });
    });

    test('a freeze mid-recovery cancels the pending attempt', () {
      fakeAsync((time) {
        final link = connected(time);
        addTearDown(link.dispose);

        conn.emit(PixeltraceConnectionState.failed);
        time.flushMicrotasks();
        expect(link.state, MediaLinkState.reconnecting);

        watchers.page.signals.leaving(restorable: true);
        time.flushMicrotasks();
        expect(link.state, MediaLinkState.paused);
        expect(conn.calls, ['prepare', 'establish', 'pause']);

        // A frozen page is not running, so nothing may be rebuilt behind it.
        time.elapse(_kRecovery);
        expect(conn.calls, ['prepare', 'establish', 'pause']);
      });
    });

    for (final (state, leave, resume)
        in <(String, void Function(), void Function(FakeAsync))>[
          (
            'reconnecting',
            () => conn.emit(PixeltraceConnectionState.failed),
            (time) => time.elapse(_kRecovery),
          ),
          (
            'paused',
            () => watchers.page.signals.leaving(restorable: true),
            (time) => watchers.page.signals.restored(visible: true),
          ),
        ]) {
      test('a rebind while $state is applied on resume', () {
        fakeAsync((time) {
          final link = connected(time);
          addTearDown(link.dispose);

          leave();
          time.flushMicrotasks();
          final before = [...conn.calls];

          // There is no media path to swap on, so the new source is only
          // recorded, and the resume must carry it.
          link.rebind(_source(60));
          time.flushMicrotasks();
          expect(conn.calls, before);

          resume(time);
          time.flushMicrotasks();
          expect(conn.calls, [...before, 'reestablish']);
          expect(conn.fps, 60);
          expect(link.state, MediaLinkState.connected);
        });
      });
    }

    test('a connection that fails after disposal starts no recovery', () {
      fakeAsync((time) {
        final link = connected(time);
        link.dispose();
        time.flushMicrotasks();
        expect(conn.calls, ['prepare', 'establish', 'dispose']);

        conn.emit(PixeltraceConnectionState.failed);
        time.elapse(_kRecovery);
        expect(link.state, MediaLinkState.disposed);
        expect(conn.calls, ['prepare', 'establish', 'dispose']);
      });
    });
  });

  group('page lifecycle', () {
    /// A link with an established session, ready for the page signal
    Future<MediaLink> connected({int fps = 30}) async {
      final link = MediaLink(config: _kConfig)..connect(_source(fps));
      await pumpEventQueue();
      expect(conn.calls, ['prepare', 'establish']);
      return link;
    }

    test('a freeze pauses the session and a restore resumes it', () async {
      final link = await connected();
      addTearDown(link.dispose);

      watchers.page.signals.leaving(restorable: true);
      await pumpEventQueue();
      expect(link.state, MediaLinkState.paused);
      expect(conn.calls, ['prepare', 'establish', 'pause']);
      expect(conn.live, isFalse);

      // Resuming rejoins the recording rather than starting a second one, so
      // the session id survives the round trip.
      watchers.page.signals.restored(visible: true);
      await pumpEventQueue();
      expect(link.state, MediaLinkState.connected);
      expect(conn.calls, ['prepare', 'establish', 'pause', 'reestablish']);
      expect(conn.sessionId, 'fake-session');
    });

    test('a pause rpc that fails still leaves the link resumable', () async {
      final link = await connected();
      addTearDown(link.dispose);

      // Pause is best-effort: the session survives it server-side either way.
      conn.pauseError = const PixeltraceServiceException(
        message: 'pause failed',
      );
      watchers.page.signals.leaving(restorable: true);
      await pumpEventQueue();
      expect(link.state, MediaLinkState.paused);

      watchers.page.signals.restored(visible: true);
      await pumpEventQueue();
      expect(link.state, MediaLinkState.connected);
      expect(conn.calls, contains('reestablish'));
    });

    test('a wake finding the session stalled rebuilds it at once', () async {
      final link = await connected();
      addTearDown(link.dispose);

      watchers.page.signals.visibilityChanged(visible: false);
      conn.stalled = true;
      watchers.page.signals.visibilityChanged(visible: true);
      await pumpEventQueue();
      expect(conn.calls, ['prepare', 'establish', 'reestablish']);
      expect(link.state, MediaLinkState.connected);
      expect(conn.stalled, isFalse);
    });

    test('a wake with the session still sending leaves it alone', () async {
      final link = await connected();
      addTearDown(link.dispose);

      watchers.page.signals.visibilityChanged(visible: false);
      watchers.page.signals.visibilityChanged(visible: true);
      await pumpEventQueue();
      expect(conn.calls, ['prepare', 'establish']);
      expect(link.state, MediaLinkState.connected);
    });

    test(
      'restored connectivity finding the session stalled rebuilds it',
      () async {
        final link = await connected();
        addTearDown(link.dispose);

        conn.stalled = true;
        watchers.page.signals.connectivityRestored();
        await pumpEventQueue();
        expect(conn.calls, ['prepare', 'establish', 'reestablish']);
        expect(link.state, MediaLinkState.connected);
      },
    );

    test('a failed rebuild on wake falls back to the retries', () async {
      final link = await connected();
      addTearDown(link.dispose);

      conn.stalled = true;
      conn.reestablishError = const PixeltraceServiceException(
        message: 'reestablish failed',
      );
      watchers.page.signals.connectivityRestored();
      await pumpEventQueue();
      expect(link.state, MediaLinkState.reconnecting);
    });

    test('backgrounding a live page keeps it streaming', () async {
      final link = await connected();
      addTearDown(link.dispose);

      watchers.page.signals.visibilityChanged(visible: false);
      await pumpEventQueue();
      expect(link.state, MediaLinkState.connected);
      expect(conn.calls, ['prepare', 'establish']);
    });

    test('a re-freeze without an intervening resume is ignored', () async {
      final link = await connected();
      addTearDown(link.dispose);

      watchers.page.signals.leaving(restorable: true);
      await pumpEventQueue();

      // Restored into a background tab and gone again. Fast tab switching does
      // this.
      watchers.page.signals.restored(visible: false);
      watchers.page.signals.leaving(restorable: true);
      await pumpEventQueue();
      expect(link.state, MediaLinkState.paused);
      expect(conn.calls, ['prepare', 'establish', 'pause']);
    });

    test('a drop while paused is the media path we tore down', () async {
      final link = await connected();
      addTearDown(link.dispose);

      watchers.page.signals.leaving(restorable: true);
      await pumpEventQueue();

      conn.emit(PixeltraceConnectionState.failed);
      await pumpEventQueue();
      expect(link.state, MediaLinkState.paused);
      expect(conn.calls, ['prepare', 'establish', 'pause']);
    });

    test('an unload sends a close beacon and disposes the link', () async {
      final link = await connected();

      watchers.page.signals.leaving(restorable: false);
      await pumpEventQueue();
      expect(conn.calls, ['prepare', 'establish', 'beaconClose', 'dispose']);
      expect(link.state, MediaLinkState.disposed);
      expect(conn.hasListeners, isFalse);
    });

    test('disposing the link stops watching the platform', () async {
      final link = await connected();
      link.dispose();
      await pumpEventQueue();
      expect(watchers.page.disposed, isTrue);
      expect(watchers.surface.disposed, isTrue);
    });
  });

  group('surface', () {
    int? watchedFps() =>
        (watchers.surface.signals.watching as StubVideoSource?)?.fps;

    test('a replaced surface is swapped into the live session', () async {
      final link = MediaLink(config: _kConfig)..connect(_source(30));
      addTearDown(link.dispose);
      await pumpEventQueue();

      watchers.surface.signals.replaced(_source(60));
      await pumpEventQueue();
      expect(conn.calls, ['prepare', 'establish', 'swap']);
      expect(conn.fps, 60);
      expect(link.state, MediaLinkState.connected);
    });

    test('the watched source tracks the one the session carries', () async {
      final link = MediaLink(config: _kConfig);
      expect(watchedFps(), isNull);

      link.connect(_source(30));
      await pumpEventQueue();
      expect(watchedFps(), 30);

      link.rebind(_source(60));
      await pumpEventQueue();
      expect(watchedFps(), 60);

      link.dispose();
      await pumpEventQueue();
      expect(watchedFps(), isNull);
    });
  });
}
