import '../../video_source.dart';
import '../config.dart';
import '../connection.dart';
import '../errors.dart';

PixeltraceConnection createConnection(
  PixeltraceServiceConfig config,
  PixeltraceErrorSink sink,
) => StubConnection(config, sink);

/// A no-op connection used on platforms without a WebRTC ingest implementation.
class StubConnection implements PixeltraceConnection {
  @override
  String? get sessionId => null;

  @override
  bool get stalled => false;

  StubConnection(PixeltraceServiceConfig config, PixeltraceErrorSink sink);

  @override
  Future<void> prepare() async {}

  @override
  Future<void> establish(PixeltraceVideoSource source) async {}

  @override
  Future<void> swap(PixeltraceVideoSource source) async {}

  @override
  Future<void> reestablish(PixeltraceVideoSource source) async {}

  @override
  Future<void> close() async {}

  @override
  Future<void> pause() async {}

  @override
  Future<void> dispose() async {}

  @override
  void beaconClose() {}

  @override
  void addListener(PixeltraceConnectionCallback cb) {}

  @override
  void removeListener(PixeltraceConnectionCallback cb) {}
}
