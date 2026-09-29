import 'dart:async';
import 'dart:js_interop';

import 'package:connectrpc/connect.dart' show Code, ConnectException;
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart';
import 'package:connectrpc/web.dart';
import 'package:pixeltrace_proto/pixeltrace/coord/v1/session.connect.client.dart';
import 'package:pixeltrace_proto/pixeltrace/coord/v1/session.pb.dart';
import 'package:pixeltrace_proto/pixeltrace/types/v1/types.pb.dart';
import 'package:pixeltrace_rtc/web.dart';
import 'package:web/web.dart' as web;

import '../../video_source.dart';
import '../config.dart';
import '../connection.dart';
import '../errors.dart';
import '../stall_detector.dart';
import 'sender_stats.dart';
import 'web_video_source.dart';

/// Maps a browser `RTCPeerConnection.connectionState` into
/// [PixeltraceConnectionState]
PixeltraceConnectionState _mapRtcConnState(String pcState) => switch (pcState) {
  'new' => PixeltraceConnectionState.idle,
  'connecting' => PixeltraceConnectionState.connecting,
  'connected' => PixeltraceConnectionState.connected,
  'disconnected' => PixeltraceConnectionState.disconnected,
  'failed' => PixeltraceConnectionState.failed,
  'closed' => PixeltraceConnectionState.closed,
  _ => throw StateError('unhandled rtc pc state $pcState'),
};

/// Upper bound on the video encoder's bitrate, in bits per second. A ceiling,
/// not a target — the encoder spends less on simple frames. Chosen high enough
/// that detailed app content stays crisp at typical capture resolutions.
const _kMaxBitrate = 8 * _kMBits;
const _kMBits = 1000000;

/// How often the sender's frame count is sampled for stalls.
const _kStallPollInterval = Duration(seconds: 1);

class WebrtcConnection implements PixeltraceConnection {
  final Transport _transport;
  final _listeners = <PixeltraceConnectionCallback>{};
  late final _rpc = SessionServiceClient(_transport);
  final _unloadListeners = <_UnloadBinding>[];

  /// The absolute URL of the unload-safe /beacon/close endpoint
  late final String _beaconCloseUrl =
      '${config.endpoint.replaceFirst(RegExp(r'/+$'), '')}/beacon/close';

  bool _disposed = false;
  List<IceServer> _iceServers = const [];
  _Session? _connected;

  /// The session [beaconClose] has already beaconed, so an unload seen on more
  /// than one channel sends one Close rather than several.
  String? _beaconedSessionId;

  final PixeltraceServiceConfig config;

  final PixeltraceErrorSink sink;

  /// The server-side identifier of the current session.
  @override
  String? get sessionId => _connected?.sessionId.id;

  @override
  bool get stalled =>
      _connected?.stallDetector?.isStalled(DateTime.now()) ?? false;

  WebrtcConnection(this.config, this.sink)
    : _transport = Transport(
        baseUrl: config.endpoint,
        codec: const ProtoCodec(),
        httpClient: createHttpClient(),
      );

  @override
  Future<void> prepare() async {
    final PrepareResponse response;
    try {
      response = await _rpc.prepare(
        PrepareRequest(siteKey: SiteKey(key: config.projectKey)),
      );
    } catch (e) {
      throw PixeltraceServiceException(message: 'prepare failed: $e');
    }
    _iceServers = response.iceServers;
  }

  /// establish() is the main chunk of work to actually start sending frames to
  /// the Pixeltrace ingest service. The phases are:
  ///
  /// - Capture canvas stream and init peer connection
  /// - Set up video track and connect to the Pixeltrace ingest service
  /// - Tell Pixeltrace to start recording the frames it's now receiving.
  ///
  /// On error, each phase is responsible for cleaning up its own resources and
  /// the resources allocated by previous phases. If this function returns
  /// successfully (i.e. does not throw), then frames are being sent to
  /// Pixeltrace and recorded.
  @override
  Future<void> establish(PixeltraceVideoSource source) async {
    // At this point we're connected, but have not requested recording to start.
    // If start recording fails, we can easily retry with the same session.
    final session = await _openSession(source);
    _connected = session;
    _listenForUnload();

    try {
      await _startRecording(session.sessionId);
    } catch (_) {
      await close();
      rethrow;
    }

    _watchForStall(session);
    log.fine('recording ingest session ${session.sessionId.id}');
  }

  @override
  Future<void> reestablish(PixeltraceVideoSource source) async {
    final sess = _connected;
    if (sess == null) {
      return;
    }

    // Retire the dead media path first. Its remote session is deliberately left
    // open — rejoining it is the whole point — so this is not a close().
    sess.close();

    // If this throws, _connected still carries the session id, so the caller can
    // attempt another resume.
    _Session resumed;
    try {
      resumed = await _openSession(source, resume: sess.sessionId);
    } on _SessionEnded {
      // The server already finalized it (e.g. it sat idle past the timeout), so
      // there is nothing to rejoin: carry on as a new session instead.
      log.fine('ingest session ${sess.sessionId.id} ended; starting a new one');
      resumed = await _openSession(source);
    }
    _connected = resumed;

    try {
      await _startRecording(resumed.sessionId);
    } catch (_) {
      // Unlike a first connect, this must not close the session: it is the
      // recording being rejoined, and closing would finalize it. Drop the media
      // path and leave the session for another attempt, or the idle timeout.
      resumed.close();
      rethrow;
    }

    _watchForStall(resumed);
    log.fine('resumed ingest session ${resumed.sessionId.id}');
  }

  @override
  Future<void> swap(PixeltraceVideoSource source) async {
    final sess = _connected;
    if (sess == null) {
      return;
    }

    final web.MediaStream newStream;
    try {
      newStream = _captureStream(source);
    } catch (_) {
      // The caller asked to capture something else, so the old surface is no
      // longer wanted: end the session, remotely too.
      await close();
      rethrow;
    }

    // Attach the new track before stopping the old stream, so capture is not
    // interrupted.
    try {
      await sess.sender.replaceTrack(_getVideoTrack(newStream)).toDart;
    } catch (e, s) {
      _stopTracks(newStream);
      await close();
      Error.throwWithStackTrace(
        PixeltraceServiceException(message: 'swap failed: $e'),
        s,
      );
    }

    if (!identical(_connected, sess)) {
      // The session was retired or rebuilt while the swap was in flight, so its
      // sender no longer carries our media. Drop the stream we just captured
      // rather than leave it running.
      _stopTracks(newStream);
      return;
    }

    _stopTracks(sess.stream);
    sess.stream = newStream;
  }

  @override
  Future<void> close() async {
    final sess = _connected;
    if (sess == null) {
      return;
    }

    _connected = null;
    _removeJsListeners();
    log.fine('closing ingest session ${sess.sessionId.id}');
    try {
      sess.close();
      await _closeRemote(sess.sessionId);
    } catch (_) {
      // close is always best-effort
    }

    // Closing a peer connection does not seem to raise connectionstatechange,
    // by itself, so we emit the event ourselves.
    _notifyConnectionChange(PixeltraceConnectionState.closed);
  }

  @override
  Future<void> pause() async {
    final sess = _connected;
    if (sess == null) {
      return;
    }

    // Release media but do not close: the remote session is left open and can
    // be resumed via reestablish.
    log.fine('pausing ingest session ${sess.sessionId.id}');
    sess.close();
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

    // close() unbinds these as well, but it early-returns when nothing is
    // established. Nothing of ours may outlive dispose, so unbind again here.
    _removeJsListeners();
  }

  /// Sends a request for the live session to the `/beacon/close` endpoint as
  /// the page unloads (best effort).
  @override
  void beaconClose() {
    final sess = _connected;
    if (sess == null || _beaconedSessionId == sess.sessionId.id) {
      return;
    }

    _beaconedSessionId = sess.sessionId.id;

    try {
      final body =
          'session_id=${Uri.encodeQueryComponent(sess.sessionId.id)}'
          '&site_key=${Uri.encodeQueryComponent(config.projectKey)}';
      web.window.navigator.sendBeacon(_beaconCloseUrl, body.toJS);
    } catch (_) {
      // Best-effort; nothing more we can do as the page tears down.
    }
  }

  @override
  void addListener(PixeltraceConnectionCallback cb) => _listeners.add(cb);

  @override
  void removeListener(PixeltraceConnectionCallback cb) => _listeners.remove(cb);

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

  /// Captures [source], builds a peer connection carrying it, and negotiates
  /// that media path with the ingest API, returning the session it belongs to.
  Future<_Session> _openSession(
    PixeltraceVideoSource source, {
    SessionId? resume,
  }) async {
    final stream = _captureStream(source);

    final web.RTCPeerConnection pc;
    try {
      pc = web.RTCPeerConnection(
        web.RTCConfiguration(iceServers: _toRtcIceServers(_iceServers)),
      );
    } catch (_) {
      _stopTracks(stream);
      rethrow;
    }

    // Subscribe to connection changes. We don't remove this listener because
    // closing the connection will drop the reference to the captured lambda.
    pc.addEventListener(
      'connectionstatechange',
      ((web.Event _) => _notifyConnectionChange(
        _mapRtcConnState(pc.connectionState),
      )).toJS,
    );

    try {
      final transceiver = _addVideoTransceiver(pc);
      final sender = transceiver.sender;
      await sender.replaceTrack(_getVideoTrack(stream)).toDart;
      final sessionId = await _negotiate(pc, resume: resume);
      return _Session(
        sessionId: sessionId,
        pc: pc,
        sender: sender,
        stream: stream,
      );
    } catch (_) {
      _stopTracks(stream);
      pc.close();
      rethrow;
    }
  }

  /// Negotiates the session with the ingest API and blocks until a working
  /// media path is found, returning the assigned session id or throwing if
  /// there was an error.
  Future<SessionId> _negotiate(
    web.RTCPeerConnection pc, {
    SessionId? resume,
  }) async {
    EstablishResponse response;
    try {
      final offerSdp = await buildOfferSdp(pc);
      response = await _rpc.establish(
        EstablishRequest(
          siteKey: SiteKey(key: config.projectKey),
          sdpOffer: SessionDescription(sdp: offerSdp),
          sessionId: resume,
          clientInfo: SessionPublisherInfo(referrer: web.document.referrer),
        ),
      );
    } on ConnectException catch (e) {
      if (resume != null && e.code == Code.notFound) {
        throw const _SessionEnded();
      }
      throw PixeltraceServiceException(message: 'establish failed: $e');
    } catch (e) {
      throw PixeltraceServiceException(message: 'establish failed: $e');
    }

    try {
      await pc
          .setRemoteDescription(
            web.RTCSessionDescriptionInit(
              type: 'answer',
              sdp: response.session.sdpAnswer.sdp,
            ),
          )
          .toDart;

      // SDP accepted only means the answer was valid; need to wait until ICE
      // actually finds a working media path (or fails / times out).
      final result = await waitForConnection(pc);
      if (result != RtcConnectResult.connected) {
        throw PixeltraceServiceException(
          message: 'establish failed: connection ${result.name}',
        );
      }

      return response.session.sessionId;
    } catch (_) {
      // Only release the session if it was a new one.
      if (resume == null) {
        await _closeRemote(response.session.sessionId);
      }
      rethrow;
    }
  }

  /// Fails [sess], so that it is rebuilt, when it starts sending frames again
  /// after a stall. The peer connection stays connected through a stall, so
  /// nothing else here should notice.
  void _watchForStall(_Session sess) {
    final detector = sess.stallDetector = StallDetector();
    bool polling = false;
    sess.stallPoll = Timer.periodic(_kStallPollInterval, (timer) async {
      if (polling) {
        return;
      }

      polling = true;
      try {
        final frames = await framesSent(sess.sender);
        if (!timer.isActive) {
          return;
        }

        final now = DateTime.now();
        final wasStalled = detector.isStalled(now);
        detector.record(frames ?? 0, now);
        if (!wasStalled || detector.isStalled(now)) {
          return;
        }

        timer.cancel();
        _notifyConnectionChange(PixeltraceConnectionState.failed);
      } catch (e) {
        log.fine('stall poll failed: $e');
      } finally {
        polling = false;
      }
    });
  }

  Future<void> _startRecording(SessionId sessionId) async {
    try {
      await _rpc.startRecording(
        StartRecordingRequest(
          sessionId: sessionId,
          siteKey: SiteKey(key: config.projectKey),
        ),
      );
    } catch (e) {
      throw PixeltraceServiceException(message: 'start recording failed: $e');
    }
  }

  Future<void> _closeRemote(SessionId sessionId) async {
    try {
      await _rpc.close(
        CloseRequest(
          sessionId: sessionId,
          siteKey: SiteKey(key: config.projectKey),
        ),
      );
    } catch (_) {
      // close is always best-effort
    }
  }

  void _listenForUnload() {
    if (_unloadListeners.isNotEmpty) {
      return;
    }
    _bindUnload('beforeunload', (_) => beaconClose());
    _bindUnload('pagehide', (e) {
      if (!(e as web.PageTransitionEvent).persisted) {
        beaconClose();
      }
    });
  }

  void _bindUnload(String type, void Function(web.Event) handler) {
    final listener = ((web.Event e) => handler(e)).toJS;
    web.window.addEventListener(type, listener);
    _unloadListeners.add(_UnloadBinding(type, listener));
  }

  void _removeJsListeners() {
    for (final b in _unloadListeners) {
      web.window.removeEventListener(b.type, b.listener);
    }
    _unloadListeners.clear();
  }

  static web.MediaStreamTrack _getVideoTrack(web.MediaStream stream) {
    final tracks = stream.getVideoTracks().toDart;
    if (tracks.isEmpty) {
      throw PixeltraceCaptureException(
        message: 'stream produced no video tracks',
      );
    }

    final track = tracks.first;

    // App UI is sharp and detail-heavy, so hint the encoder accordingly.
    track.contentHint = 'detail';
    return track;
  }

  static void _stopTracks(web.MediaStream stream) {
    for (final track in stream.getTracks().toDart) {
      track.stop();
    }
  }

  static JSArray<web.RTCIceServer> _toRtcIceServers(List<IceServer> servers) =>
      [
        for (final s in servers)
          web.RTCIceServer(
            urls: s.urls.map((u) => u.toJS).toList().toJS,
            username: s.username,
            credential: s.credential,
          ),
      ].toJS;

  static web.RTCRtpTransceiver _addVideoTransceiver(web.RTCPeerConnection pc) {
    final transceiver = pc.addTransceiver(
      'video'.toJS,
      web.RTCRtpTransceiverInit(
        direction: 'sendonly',
        sendEncodings: [
          web.RTCRtpEncodingParameters(
            maxBitrate: _kMaxBitrate,
            scaleResolutionDownBy: 1.0, // disallow downscaling
          ),
        ].toJS,
      ),
    );
    _preferH264(transceiver);
    return transceiver;
  }

  static void _preferH264(web.RTCRtpTransceiver transceiver) {
    final codecs =
        web.RTCRtpSender.getCapabilities('video')?.codecs.toDart ??
        const <web.RTCRtpCodec>[];

    if (!codecs.any((c) => _isH264(c.mimeType))) {
      throw PixeltraceCaptureException(
        message: 'browser has no H.264 video send support',
      );
    }

    // setCodecPreferences replaces the codec list entirely, so we keep H.264
    // plus any other types that carry loss/error recovery.
    final preferred = [
      ...codecs.where((c) => _isH264(c.mimeType)),
      ...codecs.where((c) => _isNecessaryCodec(c.mimeType)),
    ];
    transceiver.setCodecPreferences(preferred.toJS);
  }

  static bool _isH264(String mimeType) =>
      mimeType.toLowerCase() == 'video/h264';

  /// True if the codec is used for retransmission (loss recovery) and error
  /// correction.
  static bool _isNecessaryCodec(String mimeType) =>
      switch (mimeType.toLowerCase()) {
        'video/rtx' || 'video/red' || 'video/ulpfec' => true,
        'video/flexfec-03' || 'video/flexfec' => true,
        _ => false,
      };

  /// Starts capturing [source], which must be a [WebVideoSource].
  static web.MediaStream _captureStream(PixeltraceVideoSource source) {
    try {
      final webSource = source as WebVideoSource;
      return _captureCanvas(webSource.canvas, webSource.fps);
    } catch (e) {
      throw PixeltraceCaptureException(message: 'canvas capture failed: $e');
    }
  }

  static web.MediaStream _captureCanvas(web.HTMLCanvasElement canvas, int fps) {
    log.fine(
      'capturing canvas ${canvas.width}x${canvas.height} @ ${fps}fps '
      '(css ${canvas.clientWidth}x${canvas.clientHeight})',
    );
    return fps > 0 ? canvas.captureStream(fps) : canvas.captureStream();
  }
}

/// An active recording session.
///
/// [stream] changes when the caller swaps in new media. The id, connection, and
/// sender outlive that, since a swap does not renegotiate.
class _Session {
  final SessionId sessionId;
  final web.RTCPeerConnection pc;
  final web.RTCRtpSender sender;

  web.MediaStream stream;
  StallDetector? stallDetector;
  Timer? stallPoll;

  _Session({
    required this.sessionId,
    required this.pc,
    required this.sender,
    required this.stream,
  });

  /// Stops the media and closes the peer connection. The remote session is
  /// untouched.
  void close() {
    stallPoll?.cancel();
    WebrtcConnection._stopTracks(stream);
    pc.close();
  }
}

class _UnloadBinding {
  final String type;
  final JSFunction listener;
  _UnloadBinding(this.type, this.listener);
}

/// The session a resume named has already been finalized server-side.
class _SessionEnded implements Exception {
  const _SessionEnded();
}
