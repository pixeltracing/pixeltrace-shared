/// Lifecycle states of a [PixeltraceConnection], independent of the transport
/// carrying it.
enum PixeltraceConnectionState {
  idle,
  connecting,
  connected,
  disconnected,
  failed,
  closed,
}
