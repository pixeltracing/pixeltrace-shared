import 'package:meta/meta.dart';

import 'stub/stub_page_lifecycle_watcher.dart'
    if (dart.library.js_interop) 'web/page_lifecycle_watcher.dart'
    as impl;

/// What the page is doing, as far as streaming is concerned.
enum PageState {
  /// Alive: visible and in the foreground.
  awake,

  /// Alive but backgrounded (not visible).
  dozing,

  /// Suspended in memory, not running (e.g. in the browser's bfcache).
  /// The page may be awoken again, or may not. An unloaded event might happen
  /// after this, or may not.
  frozen,

  /// Being discarded. No in-memory state survives after this, so a session
  /// should be finalized, and any further events require a new session.
  unloaded;

  /// Whether the page is running.
  bool get isAlive => this == awake || this == dozing;
}

/// Receives the [PageState] when it changes.
typedef PageStateSink = void Function(PageState);

/// Watches the host platform and reports [PageState] changes to a given
/// destination.
class PageStateDispatcher {
  final PageStateSink _sink;
  late final PageLifecycleWatcher _watcher;
  PageState _state;

  /// The current page state.
  PageState get state => _state;

  /// Starts watching immediately. [sink] is not called for the starting state.
  PageStateDispatcher({required PageStateSink sink})
    : _sink = sink,
      _state = impl.pageIsVisible() ? PageState.awake : PageState.dozing {
    _watcher = (debugPageLifecycleWatcherFactory ?? impl.createWatcher)(
      PageSignals._(this),
    );
  }

  /// Stops watching. The sink is not called again.
  void dispose() => _watcher.dispose();

  void _visibilityChanged({required bool visible}) {
    // Visibility means nothing once the page has left: a frozen page is not
    // running, and a discarded one is not coming back. Only a restore ends
    // either.
    if (!_state.isAlive) {
      return;
    }
    _enter(visible ? PageState.awake : PageState.dozing);
  }

  void _leaving({required bool restorable}) =>
      _enter(restorable ? PageState.frozen : PageState.unloaded);

  void _restored({required bool visible}) {
    // Only a page that left can come back. Platforms tend to announce a first
    // load and a restore over one channel, so a restore reported while still
    // live is really a load, and the starting state already covers it.
    if (_state.isAlive) {
      return;
    }
    _enter(visible ? PageState.awake : PageState.dozing);
  }

  void _connectivityRestored() {
    if (_state != PageState.awake) {
      return;
    }
    _enter(PageState.awake, force: true);
  }

  void _enter(PageState next, {bool force = false}) {
    if (next == _state && !force) {
      return;
    }
    _state = next;
    _sink(next);
  }
}

/// The interface of a [PageStateDispatcher] that a [PageLifecycleWatcher]
/// reports to. Private encapsulation just to keep the public interface of
/// [PageStateDispatcher] intuitive.
class PageSignals {
  final PageStateDispatcher _dispatcher;

  PageSignals._(this._dispatcher);

  /// The page became visible or hidden.
  void visibilityChanged({required bool visible}) =>
      _dispatcher._visibilityChanged(visible: visible);

  /// The page is leaving. [restorable] is true if the page is being
  /// cached/snapshotted or false if being torn down.
  void leaving({required bool restorable}) =>
      _dispatcher._leaving(restorable: restorable);

  /// The page was restored from the platform's cache. Takes [visible] because a
  /// restore can land in a background tab.
  void restored({required bool visible}) =>
      _dispatcher._restored(visible: visible);

  /// Network connectivity came back.
  void connectivityRestored() => _dispatcher._connectivityRestored();
}

/// Listens to the platform lifecycle events and reports them as [PageSignals].
abstract class PageLifecycleWatcher {
  const PageLifecycleWatcher();

  /// Stops listening.
  void dispose();
}

@visibleForTesting
PageLifecycleWatcher Function(PageSignals signals)?
debugPageLifecycleWatcherFactory;
