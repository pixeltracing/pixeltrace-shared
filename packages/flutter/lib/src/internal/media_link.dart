import 'dart:async';

import '../video_source.dart';
import 'config.dart';
import 'connection.dart';
import 'errors.dart';
import 'event_work_queue.dart';
import 'page_state_dispatcher.dart';
import 'surface_dispatcher.dart';

class MediaLink extends EventWorkQueue<MediaLinkState, MediaLinkEvent> {
  late final PageStateDispatcher _pageState;
  late final SurfaceDispatcher _surface;

  bool _disposed = false;
  PixeltraceConnection? _connection;
  late final _retry = _Retry(() => send(Resume()));

  final PixeltraceServiceConfig config;

  MediaLink({
    required this.config,
    super.sink = const DefaultErrorSink(),
  }) : super(MediaLinkState.idle, debugName: 'media-link') {
    _pageState = PageStateDispatcher(sink: _onPageStateChanged);
    _surface = SurfaceDispatcher(sink: _onSurfaceReplaced);
  }

  void dispose() {
    assert(!_disposed);
    _disposed = true;
    _pageState.dispose();
    _surface.dispose();
    send(Dispose());
  }

  void connect(PixeltraceVideoSource source) {
    if (_disposed) {
      throw PixeltraceCaptureException(message: 'media link disposed');
    } else if (_connection != null) {
      throw PixeltraceCaptureException(message: 'media link already connected');
    }

    _connection = createConnection(config, sink);
    send(Connect(source: source));
    _connection!.addListener(_onConnectionChanged);
  }

  /// Points the established session at [source] in place of what it is
  /// currently capturing, keeping the recording going rather than starting a
  /// new one.
  void rebind(PixeltraceVideoSource source) {
    // The caller captures its source asynchronously, so a teardown can land
    // while one is in flight.
    if (_disposed) {
      return;
    }
    send(Rebind(source: source));
  }

  @override
  Future<MediaLinkState?> handle(
    MediaLinkState state,
    MediaLinkEvent event,
  ) async {
    switch ((state, event)) {
      // Disposal is a terminal state. Ordered first so it takes precedence in
      // any state.
      case ((MediaLinkState.disposed, _)):
      case ((_, Dispose())):
        _disconnect();
        return MediaLinkState.disposed;

      case ((MediaLinkState.idle, Connect c)):
        _surface.source = c.source;
        try {
          await _connection?.prepare();
          await _connection?.establish(c.source);
        } catch (e, s) {
          _disconnect();
          sink.report(e, s);
          return MediaLinkState.idle;
        }
        return MediaLinkState.connected;

      // Idle means nothing is established, so nothing applies to it but the
      // Connect and Dispose above.
      case ((MediaLinkState.idle, _)):
        return null;

      case ((MediaLinkState.connected || MediaLinkState.reconnecting, Pause())):
        // Pause is best-effort: the session survives it server-side either way,
        // so it's still resumable.
        try {
          await _connection?.pause();
        } catch (e, s) {
          sink.report(e, s);
        }
        _retry.cancel();
        return MediaLinkState.paused;

      // Fast browser tab switching could result in this, and it's harmless and
      // should be ignored.
      case ((MediaLinkState.paused, Pause())):
        return null;

      // The media path dropped, but the session is still live server-side, so
      // we can try resuming it.
      //
      // What reaches here differs by transport, and deliberately so. A WebRTC
      // peer connection that fails has lost frames, as has one whose track the
      // relay discarded after a long still stretch, so rebuilding is the right
      // response. The upload path reports failed only for the genuinely
      // unrecoverable, and handles a stalled socket by retrying inside itself;
      // rebuilding there would cost a keyframe and save nothing.
      case ((MediaLinkState.connected, Drop())):
        if (!_retry.schedule()) {
          _disconnect();
          return MediaLinkState.idle;
        }
        return MediaLinkState.reconnecting;

      // Already recovering - nothing more we can do.
      case ((MediaLinkState.reconnecting, Drop())):
        return null;

      // We tore the media path down ourselves, so its loss is expected.
      case ((MediaLinkState.paused, Drop())):
        return null;

      // A scheduled attempt that landed after we had already recovered, or a
      // wake that found the media path healthy - ignore
      case ((MediaLinkState.connected, Resume()))
          when !(_connection?.stalled ?? false):
        return null;

      // The one place a media path is rebuilt. A wake that finds the session
      // stalled also lands here: the stall watcher would force a rebuild once
      // frames resume anyway, but this gets it done before the user interacts
      // rather than after.
      case ((
        MediaLinkState.reconnecting ||
            MediaLinkState.paused ||
            MediaLinkState.connected,
        Resume(),
      )):
        _retry.cancel();
        final source = _surface.source;
        if (source == null) {
          // unreachable: all these states imply a Connect that set the source
          assert(false, 'resume with no source to recapture');
          return null;
        }
        try {
          await _connection?.reestablish(source);
        } catch (e, s) {
          final retrying = _retry.schedule();
          if (!retrying) {
            _disconnect();
          }
          sink.report(e, s);
          return retrying ? MediaLinkState.reconnecting : MediaLinkState.idle;
        }
        _retry.reset(); // success: reset retry counter
        return MediaLinkState.connected;

      // A new source for the live session: the platform swapped our surface
      // out, or the host changed capture config.
      //
      // Whether this can end the recording is the transport's call. On WebRTC
      // it replaces the outgoing track and a failure is fatal to the session.
      // On the upload path it only points the compositor at another canvas —
      // the encode size is fixed, so a differently sized replacement just gets
      // a different fit — and cannot fail at all.
      case ((MediaLinkState.connected, Rebind r)):
        _surface.source = r.source;
        try {
          await _connection?.swap(r.source);
        } catch (e, s) {
          _disconnect();
          sink.report(e, s);
          return MediaLinkState.idle;
        }
        return null;

      // Nothing to do in these states except record the source so that Resume
      // recaptures it.
      case ((MediaLinkState.reconnecting || MediaLinkState.paused, Rebind r)):
        _surface.source = r.source;
        return null;

      // Unreachable by design. Release builds ignore it rather than end the
      // session, since the worst outcome is a resource leak.
      default:
        assert(false, 'unhandled state transition ($state, $event)');
        log.fine('$debugName: ignoring unhandled ($state, $event)');
        return null;
    }
  }

  /// Releases the connection and returns to the clean initial state.
  void _disconnect() {
    _retry.reset();
    _surface.source = null;
    _connection?.removeListener(_onConnectionChanged);
    unawaitedCatchErr(_connection?.dispose(), sink: sink);
    _connection = null;
  }

  /// Translates a page signal into the appropriate event. To avoid racy state
  /// changes, this function simply emits events for the regular work queue to
  /// handle.
  void _onPageStateChanged(PageState page) {
    switch (page) {
      case PageState.awake:
        send(Resume());
        break;

      case PageState.frozen:
        send(Pause());
        break;

      case PageState.unloaded:
        // Deliberately not folded into the Dispose arm, and deliberately not
        // the regular close rpc. We have really only this one chance to notify
        // the backend that the session is ending for good. So, waiting in line
        // in the work queue and needing a separate CORS preflight request are
        // both non-starters. The connection sends at most one beacon per
        // session, so this costs nothing when it already saw the unload itself.
        _connection?.beaconClose();
        send(Dispose());
        break;

      // Backgrounded but still running, so keep streaming.
      case PageState.dozing:
        break;
    }
  }

  void _onSurfaceReplaced(PixeltraceVideoSource source) =>
      send(Rebind(source: source));

  void _onConnectionChanged(PixeltraceConnectionState state) {
    switch (state) {
      case PixeltraceConnectionState.idle:
      case PixeltraceConnectionState.connecting:
      case PixeltraceConnectionState.connected:
        // Nothing to do.
        break;
      case PixeltraceConnectionState.disconnected:
        // Transient and often self-healing. Do nothing.
        break;
      case PixeltraceConnectionState.closed:
        // We issued the close, so we already did the necessary cleanup.
        break;
      case PixeltraceConnectionState.failed:
        // Unrecoverable, by whatever the transport's own definition of that
        // is. See the Drop arm above for why the two do not agree.
        send(Drop());
        break;
    }
  }
}

/// Small state object for a retry-able function.
class _Retry {
  static const _kMaxAttempts = 3;

  final void Function() _onDue;
  Timer? _timer;
  int _numAttempts = 0;

  _Retry(this._onDue);

  void reset() {
    cancel();
    _numAttempts = 0;
  }

  bool schedule() {
    if (_numAttempts >= _kMaxAttempts) {
      return false;
    }
    _numAttempts++;
    cancel();
    _timer = Timer(_backoff(_numAttempts), _onDue);
    return true;
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  /// Delays: 0.5s, 1s, 2s, 4s, ..., capped at 8s.
  static Duration _backoff(int attempt) =>
      Duration(milliseconds: (500 * (1 << (attempt - 1))).clamp(500, 8000));
}

enum MediaLinkState { idle, connected, reconnecting, paused, disposed }

sealed class MediaLinkEvent {}

class Connect extends MediaLinkEvent {
  final PixeltraceVideoSource source;
  Connect({required this.source});
}

class Rebind extends MediaLinkEvent {
  final PixeltraceVideoSource source;
  Rebind({required this.source});
}

class Pause extends MediaLinkEvent {}

class Resume extends MediaLinkEvent {}

class Drop extends MediaLinkEvent {}

class Dispose extends MediaLinkEvent {}
