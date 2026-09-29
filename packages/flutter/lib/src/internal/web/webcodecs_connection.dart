import 'dart:js_interop';

import 'package:pixeltrace_proto/pixeltrace/types/v1/types.pb.dart';
import 'package:web/web.dart' as web;

import '../../video_source.dart';
import '../config.dart';
import '../connection.dart';
import '../errors.dart';
import 'canvas_compositor.dart';
import 'frame_pump.dart';
import 'session_rpc.dart';
import 'web_video_source.dart';

/// The single codec this path encodes with.
///
/// H.264 constrained baseline, level 3.1 — deliberately the most permissive
/// profile that covers the encode size, because the probe is a support check
/// and not a negotiation. There is no codec ladder and no container switching:
/// a browser that cannot do this is one the WebCodecs path does not run on.
const _kCodec = 'avc1.42001f';

/// A connection that encodes, muxes, and uploads from the client.
///
/// This is the second of the two ingest paths, selected by
/// [PixeltraceTransport]. It currently composites and then drops frames: the
/// worker that encodes them arrives with the capture-worker package, and the
/// upload socket with it.
///
/// **What counts as a failure here is not what counts as one on the WebRTC
/// path.** There, a broken connection means lost frames, so `failed` is right
/// and rebuilding the media path is the right response. Here an upload stall
/// loses nothing once the on-disk buffer exists, and rebuilding would force a
/// needless keyframe. So [PixeltraceConnectionState.failed] is reserved for
/// the genuinely unrecoverable — the worker dying, an encoder that cannot be
/// configured, a session the server rejected — and a dropped socket or a
/// failed fragment upload belongs to internal retry instead. Until the on-disk
/// buffer lands, an exhausted upload-retry budget really does lose frames and
/// so belongs on the unrecoverable list; that is the one entry to delete when
/// the buffer arrives.
///
/// Nothing asynchronous reports `failed` yet, because nothing here can fail
/// asynchronously until the worker exists. A failure while establishing is
/// thrown rather than signalled, the same as on the WebRTC path.
class WebcodecsConnection implements PixeltraceConnection {
  final PixeltraceServiceConfig config;
  final PixeltraceErrorSink sink;

  final _listeners = <PixeltraceConnectionCallback>{};
  late final SessionRpc _rpc = SessionRpc(config);

  bool _prepared = false;
  bool _disposed = false;

  CanvasCompositor? _compositor;
  FramePump? _pump;
  SessionId? _sessionId;

  /// Frames composited since [establish], for the progress log below.
  int _frameCount = 0;
  double _lastLogMs = 0;

  @override
  String? get sessionId => _sessionId?.id;

  // No relay track on this path to expire.
  @override
  bool get stalled => false;

  WebcodecsConnection(this.config, this.sink);

  /// Checks that the browser can encode what we are about to hand it.
  ///
  /// Unlike the WebRTC path's `Prepare`, this talks to no server: there is
  /// nothing to negotiate before the upload socket opens. A browser without
  /// H.264 encode support fails here rather than silently recording nothing,
  /// and the failure is reported as well as thrown so it is measurable — the
  /// automatic fall back to WebRTC comes later.
  @override
  Future<void> prepare() async {
    final web.VideoEncoderSupport support;
    try {
      support = await web.VideoEncoder.isConfigSupported(
        web.VideoEncoderConfig(
          codec: _kCodec,
          width: kDefaultEncodeWidth,
          height: kDefaultEncodeHeight,
        ),
      ).toDart;
    } catch (e, s) {
      sink.report(e, s);
      throw PixeltraceCaptureException(message: 'codec probe failed: $e');
    }

    if (!support.supported) {
      final e = PixeltraceCaptureException(
        message:
            'browser cannot encode $_kCodec at '
            '${kDefaultEncodeWidth}x$kDefaultEncodeHeight',
      );
      sink.report(e, StackTrace.current);
      throw e;
    }

    _prepared = true;
  }

  @override
  Future<void> establish(PixeltraceVideoSource source) async {
    assert(!_disposed, 'establish after dispose');
    if (!_prepared) {
      throw PixeltraceCaptureException(message: 'establish before prepare');
    }

    _notifyConnectionChange(PixeltraceConnectionState.connecting);

    final response = await _rpc.beginUpload();
    _sessionId = response.sessionId;

    try {
      _startPump(source);
    } catch (_) {
      // The session exists server-side but has no media path, so finalize it
      // rather than leave it for the idle timeout.
      await close();
      rethrow;
    }

    log.fine('uploading ingest session ${response.sessionId.id}');
    _notifyConnectionChange(PixeltraceConnectionState.connected);
  }

  @override
  Future<void> reestablish(PixeltraceVideoSource source) async {
    final session = _sessionId;
    if (session == null) {
      return;
    }

    _stopPump();

    // The URL is the whole credential and the old one may have expired, so a
    // resume asks for a fresh one against the same session id.
    // Unlike a first connect, a failure here must not finalize: it is the
    // recording being rejoined, and _sessionId still names it, so the caller
    // can attempt another resume.
    final response = await _rpc.beginUpload(resume: session);
    _sessionId = response.sessionId;

    _startPump(source);
    log.fine('resumed ingest session ${response.sessionId.id}');
    _notifyConnectionChange(PixeltraceConnectionState.connected);
  }

  /// Points the compositor at a different canvas.
  ///
  /// This is the whole of a surface swap on this path. The encode size is
  /// fixed, so a differently sized replacement only changes the fit; the
  /// encoder never learns a swap happened, and there is nothing here that can
  /// fail the session.
  @override
  Future<void> swap(PixeltraceVideoSource source) async {
    final compositor = _compositor;
    if (compositor == null) {
      return;
    }
    compositor.source = _canvasOf(source);
    // A capture-config change arrives as a swap too, so the ceiling rides along
    // with the canvas.
    _pump?.fps = _fpsOf(source);
  }

  @override
  Future<void> close() async {
    final session = _sessionId;
    if (session == null) {
      return;
    }

    _sessionId = null;
    log.fine('closing ingest session ${session.id}');
    _stopPump();
    await _rpc.finishUpload(session);
    _notifyConnectionChange(PixeltraceConnectionState.closed);
  }

  @override
  Future<void> pause() async {
    if (_sessionId == null) {
      return;
    }
    log.fine('pausing ingest session ${_sessionId!.id}');
    _stopPump();
  }

  @override
  Future<void> dispose() async {
    if (_disposed) {
      assert(false, 'duplicate dispose');
      return;
    }
    _disposed = true;
    _listeners.clear();
    await close();

    // close() stops the pump, but early-returns when nothing was established.
    // Nothing of ours may outlive dispose, so tear down unconditionally here.
    _pump?.dispose();
    _pump = null;
    _compositor?.dispose();
    _compositor = null;
  }

  /// No-op until the worker owns the upload socket: finalization then becomes
  /// an end frame on that socket, sent from the worker, and there is no beacon
  /// endpoint on this path to stand in for it meanwhile.
  @override
  void beaconClose() {}

  @override
  void addListener(PixeltraceConnectionCallback cb) => _listeners.add(cb);

  @override
  void removeListener(PixeltraceConnectionCallback cb) => _listeners.remove(cb);

  void _startPump(PixeltraceVideoSource source) {
    final compositor = _compositor ??= CanvasCompositor(
      width: kDefaultEncodeWidth,
      height: kDefaultEncodeHeight,
    );
    compositor.source = _canvasOf(source);

    _frameCount = 0;
    _lastLogMs = web.window.performance.now();
    final pump = _pump ??= FramePump(
      compositor: compositor,
      fps: _fpsOf(source),
      onFrame: _onFrame,
      sink: sink,
    );
    pump.start();
  }

  void _stopPump() {
    _pump?.stop();
    _compositor?.source = null;
  }

  /// Where the encoder goes.
  ///
  /// Until the capture worker lands there is nothing to transfer the frame to,
  /// so it is closed immediately — a frame not closed is a GPU allocation held
  /// forever. The rate is logged about once a second, which is what makes the
  /// pump observable in the example app.
  void _onFrame(web.VideoFrame frame) {
    frame.close();

    _frameCount++;
    final nowMs = web.window.performance.now();
    final elapsedMs = nowMs - _lastLogMs;
    if (elapsedMs >= 1000) {
      log.fine(
        'composited ${(_frameCount * 1000 / elapsedMs).toStringAsFixed(1)} fps',
      );
      _frameCount = 0;
      _lastLogMs = nowMs;
    }
  }

  void _notifyConnectionChange(PixeltraceConnectionState state) {
    log.fine('ingest connection -> $state');
    for (final f in _listeners.toList()) {
      try {
        f(state);
      } catch (e, s) {
        sink.report(e, s);
      }
    }
  }

  static web.HTMLCanvasElement _canvasOf(PixeltraceVideoSource source) {
    if (source is! WebVideoSource) {
      throw PixeltraceCaptureException(
        message: 'expected a web video source, got ${source.runtimeType}',
      );
    }
    return source.canvas;
  }

  static int _fpsOf(PixeltraceVideoSource source) =>
      source is WebVideoSource ? source.fps : 0;
}
