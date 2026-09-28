import 'package:pixeltrace_flutter/src/internal/page_state_dispatcher.dart';
import 'package:pixeltrace_flutter/src/internal/surface_dispatcher.dart';

class FakePageWatcher extends PageLifecycleWatcher {
  final PageSignals signals;
  bool disposed = false;

  FakePageWatcher(this.signals);

  @override
  void dispose() => disposed = true;
}

class FakeSurfaceWatcher extends SurfaceWatcher {
  final SurfaceSignals signals;
  bool disposed = false;

  FakeSurfaceWatcher(this.signals);

  @override
  void dispose() => disposed = true;
}

class FakeWatchers {
  /// Every watcher built since installation, oldest first.
  final pages = <FakePageWatcher>[];
  final surfaces = <FakeSurfaceWatcher>[];

  /// The watcher belonging to the most recently built dispatcher
  FakePageWatcher get page => pages.last;
  FakeSurfaceWatcher get surface => surfaces.last;

  FakeWatchers.install() {
    debugPageLifecycleWatcherFactory = (signals) {
      final watcher = FakePageWatcher(signals);
      pages.add(watcher);
      return watcher;
    };
    debugSurfaceWatcherFactory = (signals) {
      final watcher = FakeSurfaceWatcher(signals);
      surfaces.add(watcher);
      return watcher;
    };
  }

  /// Restores real watcher construction. Call from `tearDown`.
  static void reset() {
    debugPageLifecycleWatcherFactory = null;
    debugSurfaceWatcherFactory = null;
  }
}
