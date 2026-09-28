import 'dart:js_interop';

import 'package:web/web.dart' as web;

import '../page_state_dispatcher.dart';

bool pageIsVisible() => web.document.visibilityState != 'hidden';

PageLifecycleWatcher createWatcher(PageSignals signals) =>
    WebPageLifecycleWatcher(signals);

/// Reports the browser's page lifecycle events to a given destination.
class WebPageLifecycleWatcher extends PageLifecycleWatcher {
  final _bindings = <_Binding>[];
  final PageSignals _signals;

  WebPageLifecycleWatcher(this._signals) {
    _listen(
      web.document,
      'visibilitychange',
      (_) => _signals.visibilityChanged(visible: pageIsVisible()),
    );

    _listen(web.window, 'pagehide', (e) {
      final event = e as web.PageTransitionEvent;
      _signals.leaving(restorable: event.persisted);
    });

    _listen(web.window, 'pageshow', (e) {
      if ((e as web.PageTransitionEvent).persisted) {
        _signals.restored(visible: pageIsVisible());
      }
    });

    _listen(web.window, 'online', (_) => _signals.connectivityRestored());
  }

  @override
  void dispose() {
    for (final b in _bindings) {
      b.target.removeEventListener(b.type, b.listener);
    }
    _bindings.clear();
  }

  void _listen(
    web.EventTarget target,
    String type,
    void Function(web.Event) handler,
  ) {
    final js = ((web.Event e) => handler(e)).toJS;
    target.addEventListener(type, js);
    _bindings.add(_Binding(target, type, js));
  }
}

class _Binding {
  final web.EventTarget target;
  final String type;
  final JSFunction listener;
  _Binding(this.target, this.type, this.listener);
}
