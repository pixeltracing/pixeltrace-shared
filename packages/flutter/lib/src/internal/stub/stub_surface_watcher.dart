import '../surface_dispatcher.dart';

SurfaceWatcher createWatcher(SurfaceSignals signals) =>
    const StubSurfaceWatcher();

class StubSurfaceWatcher extends SurfaceWatcher {
  const StubSurfaceWatcher();

  @override
  void dispose() {}
}
