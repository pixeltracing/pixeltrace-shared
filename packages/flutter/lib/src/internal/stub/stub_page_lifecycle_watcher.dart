import '../page_state_dispatcher.dart';

bool pageIsVisible() => true;

PageLifecycleWatcher createWatcher(PageSignals signals) =>
    const StubPageLifecycleWatcher();

class StubPageLifecycleWatcher extends PageLifecycleWatcher {
  const StubPageLifecycleWatcher();

  @override
  void dispose() {}
}
