import 'package:web/web.dart' as web;

import '../surface_dispatcher.dart';
import 'web_video_source.dart';

SurfaceWatcher createWatcher(SurfaceSignals signals) =>
    WebSurfaceWatcher(signals);

/// Reports when Flutter replaces the render `<canvas>` being captured, handing
/// back a source bound to the one that took its place.
class WebSurfaceWatcher extends SurfaceWatcher {
  final SurfaceSignals _signals;
  late final web.MutationObserver _observer;

  WebSurfaceWatcher(this._signals) {
    _observer = observeFlutterCanvas(_onMutation);
  }

  @override
  void dispose() => _observer.disconnect();

  void _onMutation() {
    // A canvas still in the document is still the one being rendered into, so
    // there is nothing to re-bind to. This is the common case: most mutations
    // have nothing to do with the canvas.
    final source = _signals.watching;
    if (source is! WebVideoSource || source.canvas.isConnected) {
      return;
    }

    final located = findFlutterCanvas();
    if (located == null || identical(located, source.canvas)) {
      return; // nothing better to bind to yet; try again on the next mutation
    }

    _signals.replaced(WebVideoSource(located, fps: source.fps));
  }
}
