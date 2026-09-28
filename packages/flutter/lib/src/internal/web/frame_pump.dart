import 'dart:js_interop';

import 'package:flutter/scheduler.dart';
import 'package:web/web.dart' as web;

import '../errors.dart';
import 'canvas_compositor.dart';

/// Composites and emits frames, driven by Flutter's frames and paced by
/// `requestAnimationFrame`.
///
/// Two signals, doing two different jobs:
///
/// - **Flutter's frame** says the screen changed. It is the activity signal, so
///   a static screen costs nothing: the pump does no work at all between
///   Flutter frames.
/// - **`requestAnimationFrame`** says when it is legal to read Flutter's
///   canvas. This is not a stylistic choice. Flutter paints through WebGL with
///   an ordinary `preserveDrawingBuffer: false` context, so the browser
///   discards the drawing buffer once it has composited, and both Chromium and
///   WebKit do. Reading at the start of an animation frame returns pixels on
///   every engine; reading from a later task returns a transparent rectangle on
///   WebKit — with no exception and no failed `VideoFrame`, just blank video.
///   A post-frame-callback pump therefore works on Chromium and silently
///   records nothing everywhere else, which is exactly what the spike found.
///
/// See `docs/spike-drawimage-findings.md`.
class FramePump {
  /// Ceiling on composites per second. Flutter can produce 60 or 120 frames a
  /// second during an animation; frames over the ceiling are skipped, which
  /// costs nothing because skipping means not compositing at all.
  ///
  /// Mutable, because the host can change its capture rate mid-session. Zero or
  /// less means no ceiling.
  int fps;

  final CanvasCompositor compositor;

  /// Receives each composited frame, and owns it from that moment: it must
  /// transfer the frame to the worker or close it.
  final void Function(web.VideoFrame frame) onFrame;

  final PixeltraceErrorSink sink;

  /// Whether the pump is doing work. The persistent frame callback below can
  /// never be unregistered, so this flag is what actually stops the pump.
  bool _running = false;

  bool _disposed = false;

  /// Whether the persistent frame callback has been registered. Flutter has no
  /// API to remove one, so it is registered once, lazily, and left in place for
  /// the life of the binding. It reads as a leak otherwise: it is not, because
  /// its body does nothing at all while [_running] is false.
  bool _frameCallbackRegistered = false;

  /// Whether Flutter has rasterized something we have not composited yet.
  bool _dirty = false;

  /// Handle of the animation-frame callback in flight, or null if none is.
  int? _rafHandle;

  /// `performance.now()` of the last composite, for the frame-rate ceiling.
  double _lastCompositeMs = double.negativeInfinity;

  FramePump({
    required this.compositor,
    required this.fps,
    required this.onFrame,
    required this.sink,
  });

  /// Minimum gap between composites, in milliseconds.
  double get _minGapMs => fps > 0 ? 1000 / fps : 0;

  /// Starts compositing. Idempotent.
  void start() {
    assert(!_disposed, 'start after dispose');
    if (_running) {
      return;
    }
    _running = true;
    _lastCompositeMs = double.negativeInfinity;

    if (!_frameCallbackRegistered) {
      _frameCallbackRegistered = true;
      SchedulerBinding.instance.addPersistentFrameCallback(_onFlutterFrame);
    }

    // Composite once up front rather than waiting on a Flutter frame that a
    // static screen may never produce.
    _dirty = true;
    _scheduleComposite();
  }

  /// Stops compositing, keeping the pump reusable. Idempotent.
  void stop() {
    if (!_running) {
      return;
    }
    _running = false;
    _dirty = false;
    final handle = _rafHandle;
    if (handle != null) {
      web.window.cancelAnimationFrame(handle);
      _rafHandle = null;
    }
  }

  void dispose() {
    if (_disposed) {
      assert(false, 'duplicate dispose');
      return;
    }
    _disposed = true;
    stop();
  }

  /// Flutter rasterized a frame. Note it and ask for an animation frame; the
  /// composite itself has to happen in that callback, not here.
  ///
  /// This runs on every Flutter frame for the life of the binding, so it stays
  /// as short as it looks.
  ///
  /// The redaction rectangles for the frame Flutter has just rasterized get
  /// snapshotted from here, in a post-frame callback. That splits the pixels
  /// and the rectangles across two callbacks, which is safe only as long as
  /// the composite checks that its snapshot is no older than the newest
  /// rasterized frame: on WebKit the post-frame callback lands *after* the
  /// painting animation frame, so an animation frame can arrive holding fresh
  /// pixels and stale rectangles, and that is a leak rather than a stale
  /// overlay.
  void _onFlutterFrame(Duration _) {
    if (!_running) {
      return;
    }
    _dirty = true;
    _scheduleComposite();
  }

  void _scheduleComposite() {
    if (_rafHandle != null) {
      return;
    }
    _rafHandle = web.window.requestAnimationFrame(_onAnimationFrame.toJS);
  }

  /// Composites the current canvas.
  ///
  /// **Every step below runs inside this callback body.** Not in a microtask it
  /// schedules, not after an `await`, not on a timer. Defer any part of it and
  /// WebKit reads a cleared drawing buffer and emits blank video.
  void _onAnimationFrame(double _) {
    _rafHandle = null;
    if (!_running || !_dirty) {
      // Nothing new to draw. The loop stops here and the next Flutter frame
      // restarts it, so a screen at rest costs nothing.
      return;
    }

    final nowMs = web.window.performance.now();
    if (nowMs - _lastCompositeMs < _minGapMs) {
      // Over the frame-rate ceiling. Stay dirty and try again next animation
      // frame; no composite happens, which is the whole point of skipping.
      _scheduleComposite();
      return;
    }

    _dirty = false;
    _lastCompositeMs = nowMs;

    final web.VideoFrame? frame;
    try {
      frame = compositor.composite((nowMs * 1000).round());
    } catch (e, s) {
      // A composite that throws must not take the pump down with it: the next
      // Flutter frame gets another attempt.
      sink.report(e, s);
      return;
    }
    if (frame == null) {
      return;
    }

    try {
      // onFrame owns the frame from here, including closing it.
      onFrame(frame);
    } catch (e, s) {
      // It threw before it could transfer or close, so the frame is ours again
      // and it holds a GPU allocation until something releases it.
      try {
        frame.close();
      } catch (_) {
        // Already transferred or closed; nothing left to release.
      }
      sink.report(e, s);
    }
  }
}
