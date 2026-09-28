import 'package:flutter/foundation.dart';

const kDefaultEndpoint = 'https://ingest.pixeltrace.dev';

/// Encode dimensions the WebCodecs path composites and encodes at. Fixed for
/// the whole session, so a surface swap only changes the fit, never the
/// encoder. Moves onto [PixeltraceCaptureConfig] once encode configuration
/// lands.
const kDefaultEncodeWidth = 1280;
const kDefaultEncodeHeight = 720;

/// Which ingest path carries the captured video.
///
/// Both paths run from the same public API so they can be measured against
/// each other; one of them is expected to be removed once they have been.
enum PixeltraceTransport {
  /// The browser encodes and paces, and a peer connection carries the media.
  webrtc,

  /// The client encodes, muxes, and uploads fragmented MP4 itself.
  webcodecs,
}

/// Configuration for the service
class PixeltraceServiceConfig {
  /// The project's site key that will receive this traffic.
  final String projectKey;

  /// URL of the ingest service.
  final String endpoint;

  /// Which ingest path to use. Changing this at runtime ends the current
  /// recording and starts a new one, since the two are not the same session.
  final PixeltraceTransport transport;

  /// Overrides where the [PixeltraceTransport.webcodecs] path loads its capture
  /// worker from. Null serves the copy bundled with the package, which is what
  /// nearly every host wants; set it only when a content security policy
  /// requires the bundle to come from your own origin.
  final String? workerUrl;

  const PixeltraceServiceConfig({
    required this.projectKey,
    this.endpoint = kDefaultEndpoint,
    this.transport = PixeltraceTransport.webrtc,
    this.workerUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PixeltraceServiceConfig &&
          projectKey == other.projectKey &&
          endpoint == other.endpoint &&
          transport == other.transport &&
          workerUrl == other.workerUrl;

  @override
  int get hashCode => Object.hash(projectKey, endpoint, transport, workerUrl);
}

class PixeltraceCaptureConfig {
  /// Target (and maximum) frames per second to capture. This is best-effort,
  /// and the capture will automatically degrade in the presence of network
  /// congestion, dropping either frames or resolution as required.
  final int fps;

  /// When true (the default), Pixeltrace capture is enabled.
  final bool captureEnabled;

  /// When true, Pixeltrace capture is enabled even in [kDebugMode].
  final bool captureInDebugMode;

  /// Whether or not Pixeltrace is enabled.
  bool get enabled => captureEnabled && (!kDebugMode || captureInDebugMode);

  const PixeltraceCaptureConfig({
    required this.fps,
    this.captureEnabled = true,
    this.captureInDebugMode = false,
  });
}
