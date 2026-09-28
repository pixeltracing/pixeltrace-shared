import '../config.dart';
import '../connection.dart';
import '../errors.dart';
import 'webcodecs_connection.dart';
import 'webrtc_connection.dart';

/// Builds the connection for the configured ingest path.
///
/// The two paths land side by side rather than one replacing the other, so
/// they can be measured against each other before either is removed. The
/// server is expected to get a say in the choice eventually — the `BeginUpload`
/// response is the natural place for it — so nothing here assumes the config
/// is the last word.
PixeltraceConnection createConnection(
  PixeltraceServiceConfig config,
  PixeltraceErrorSink sink,
) => switch (config.transport) {
  PixeltraceTransport.webrtc => WebrtcConnection(config, sink),
  PixeltraceTransport.webcodecs => WebcodecsConnection(config, sink),
};
