import 'package:meta/meta.dart';

import 'config.dart';
import 'connection_state.dart';
import 'errors.dart';
import '../video_source.dart';
import 'stub/stub_connection.dart'
    if (dart.library.js_interop) 'web/connection_factory.dart'
    as impl;

export 'connection_state.dart' show PixeltraceConnectionState;

typedef PixeltraceConnectionCallback =
    void Function(PixeltraceConnectionState state);

/// A connection to the Pixeltrace ingest API carrying a single video source.
abstract class PixeltraceConnection {
  /// The established session's id, or null if nothing is established.
  String? get sessionId;

  /// Whether the established session has gone without sending media long
  /// enough that the relay has likely discarded its track. [reestablish]
  /// recovers from this.
  bool get stalled;

  /// Performs handshake with the ingest server, required before attempting to
  /// [establish].
  Future<void> prepare();

  /// Establishes the connection, streaming from [source]. Requires [prepare] to
  /// have completed successfully.
  Future<void> establish(PixeltraceVideoSource source);

  /// Replaces the outgoing media of an already-[establish]ed connection with
  /// [source]'s, without renegotiating. No-op if nothing was established.
  Future<void> swap(PixeltraceVideoSource source);

  /// Rebuilds the connection of a dropped session around [source] and resumes it
  /// server-side, so the recording continues instead of starting over. No-op if
  /// nothing was established.
  Future<void> reestablish(PixeltraceVideoSource source);

  /// Tears down the established session. The connection can be [establish]ed
  /// again afterwards. No-op if nothing was established.
  Future<void> close();

  /// Tears down the local media path but leaves the session open server-side,
  /// so [reestablish] can rejoin the recording rather than start a new one.
  /// This is what separates it from [close], which finalizes.
  Future<void> pause();

  /// Tears down any established session and releases the connection. The
  /// connection should not be used after this.
  Future<void> dispose();

  /// Best-effort, unload-safe finalization of the established session, for use
  /// while the page is being torn down.
  void beaconClose();

  /// Adds the given callback as a listener, notified when the connection state
  /// changes.
  void addListener(PixeltraceConnectionCallback cb);

  /// Removes the previously-added callback as a listener.
  void removeListener(PixeltraceConnectionCallback cb);
}

/// Creates the platform-appropriate [PixeltraceConnection].
PixeltraceConnection createConnection(
  PixeltraceServiceConfig config,
  PixeltraceErrorSink sink,
) => (debugConnectionFactory ?? impl.createConnection)(config, sink);

/// Supplies the connection [createConnection] hands back, in place of the
/// platform one. Null in production.
@visibleForTesting
PixeltraceConnection Function(
  PixeltraceServiceConfig config,
  PixeltraceErrorSink sink,
)?
debugConnectionFactory;
