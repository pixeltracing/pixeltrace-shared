import 'dart:async';
import 'dart:collection';

import 'package:pixeltrace_flutter/src/internal/connection.dart';
import 'package:pixeltrace_flutter/src/internal/errors.dart';
import 'package:pixeltrace_flutter/src/internal/stub/stub_video_source.dart';
import 'package:pixeltrace_flutter/src/video_source.dart';

/// Records the rpcs a [MediaLink] issues, so tests can assert on the sequence
class FakeConnection implements PixeltraceConnection {
  final _listeners = <PixeltraceConnectionCallback>[];
  final _calls = <String>[];
  bool _live = false;
  PixeltraceVideoSource? _source;

  /// When non-null, `establish` awaits this before completing.
  Completer<void>? establishGate;

  /// When non-null, `reestablish` throws this instead of rejoining the session.
  /// Clear it between attempts to make a retry succeed.
  Object? reestablishError;

  /// When non-null, `pause` throws this after tearing the media path down.
  Object? pauseError;

  /// When non-null, `swap` throws this instead of installing the source.
  Object? swapError;

  /// The rpcs issued so far, in order.
  List<String> get calls => UnmodifiableListView(_calls);

  /// Whether a session is currently established.
  bool get live => _live;

  /// The most recent source installed.
  PixeltraceVideoSource? get source => _source;

  /// The rate the currently installed source was captured at.
  int? get fps => (_source as StubVideoSource?)?.fps;

  /// Whether anything is subscribed to state changes.
  bool get hasListeners => _listeners.isNotEmpty;

  /// Reports [state] to the subscribers, the way the real transport does when
  /// the peer connection changes underneath it.
  void emit(PixeltraceConnectionState state) {
    for (final cb in [..._listeners]) {
      cb(state);
    }
  }

  @override
  String? get sessionId => _live ? 'fake-session' : null;

  @override
  bool stalled = false;

  @override
  Future<void> prepare() async {
    _calls.add('prepare');
  }

  @override
  Future<void> establish(PixeltraceVideoSource source) async {
    _calls.add('establish');
    _source = source;
    final gate = establishGate;
    if (gate != null) {
      await gate.future;
    }
    _live = true;
  }

  @override
  Future<void> reestablish(PixeltraceVideoSource source) async {
    _calls.add('reestablish');
    final error = reestablishError;
    if (error != null) {
      throw error;
    }
    _source = source;
    _live = true;
    stalled = false;
  }

  @override
  Future<void> swap(PixeltraceVideoSource source) async {
    _calls.add('swap');
    final error = swapError;
    if (error != null) {
      throw error;
    }
    _source = source;
  }

  @override
  Future<void> close() async {
    _calls.add('close');
    _live = false;
  }

  @override
  Future<void> pause() async {
    _calls.add('pause');
    _live = false;
    final error = pauseError;
    if (error != null) {
      throw error;
    }
  }

  @override
  Future<void> dispose() async {
    _calls.add('dispose');
    _live = false;
  }

  @override
  void beaconClose() {
    if (_live) {
      _calls.add('beaconClose');
    }
  }

  @override
  void addListener(PixeltraceConnectionCallback cb) => _listeners.add(cb);

  @override
  void removeListener(PixeltraceConnectionCallback cb) => _listeners.remove(cb);
}

class ThrowingConnection extends FakeConnection {
  /// Defaults to the transient failure a real connection raises; pass an
  /// [Error] to exercise the programmer-error path instead.
  final Object error;

  ThrowingConnection([
    this.error = const PixeltraceServiceException(message: 'establish failed'),
  ]);

  @override
  Future<void> establish(PixeltraceVideoSource source) async {
    _calls.add('establish');
    throw error;
  }
}

/// Routes every connection the SDK builds to [conn] for the rest of the test.
void useFakeConnection(FakeConnection conn) =>
    debugConnectionFactory = (_, _) => conn;

/// Restores real connection construction. Call from `tearDown`.
void resetFakeConnection() => debugConnectionFactory = null;
