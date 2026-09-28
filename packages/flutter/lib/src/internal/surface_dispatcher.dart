import 'package:meta/meta.dart';

import '../video_source.dart';
import 'stub/stub_surface_watcher.dart'
    if (dart.library.js_interop) 'web/web_surface_watcher.dart'
    as impl;

typedef SurfaceSink = void Function(PixeltraceVideoSource replacement);

/// Watches the rendering surface a source captures and reports a replacement
/// source when the platform swaps that surface out from under it.
class SurfaceDispatcher {
  final SurfaceSink _sink;
  late final SurfaceWatcher _watcher;

  /// The source being captured, or null when nothing is. Assign whenever the
  /// captured source changes, so staleness is judged against the live one.
  PixeltraceVideoSource? source;

  /// Starts watching immediately. Nothing is reported while [source] is null.
  SurfaceDispatcher({required SurfaceSink sink}) : _sink = sink {
    _watcher = (debugSurfaceWatcherFactory ?? impl.createWatcher)(
      SurfaceSignals._(this),
    );
  }

  /// Stops watching. The sink is not called again.
  void dispose() => _watcher.dispose();
}

/// The interface of a [SurfaceDispatcher] that a [SurfaceWatcher] reports to.
/// Private encapsulation just to keep the public interface of
/// [SurfaceDispatcher] intuitive.
class SurfaceSignals {
  final SurfaceDispatcher _dispatcher;

  SurfaceSignals._(this._dispatcher);

  /// The source currently being captured, whose surface is the one to watch, or
  /// null when nothing is being captured.
  PixeltraceVideoSource? get watching => _dispatcher.source;

  /// The watched surface was replaced, and [replacement] captures the one that
  /// took its place.
  void replaced(PixeltraceVideoSource replacement) =>
      _dispatcher._sink(replacement);
}

/// Watches the platform's rendering surface and reports replacements as
/// [SurfaceSignals].
abstract class SurfaceWatcher {
  const SurfaceWatcher();

  /// Stops watching.
  void dispose();
}

@visibleForTesting
SurfaceWatcher Function(SurfaceSignals signals)? debugSurfaceWatcherFactory;
