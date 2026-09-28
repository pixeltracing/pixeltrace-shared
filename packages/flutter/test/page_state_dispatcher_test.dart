import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/src/internal/page_state_dispatcher.dart';

import 'fake_watchers.dart';

void main() {
  late FakeWatchers watchers;
  late List<PageState> reported;
  late PageStateDispatcher dispatcher;
  late PageSignals signals;

  setUp(() {
    watchers = FakeWatchers.install();
    reported = [];
    dispatcher = PageStateDispatcher(sink: reported.add);
    signals = watchers.page.signals;
  });

  tearDown(FakeWatchers.reset);

  test('starts on the platform state without announcing it', () {
    // The stub platform reports a visible page.
    expect(dispatcher.state, PageState.awake);
    expect(reported, isEmpty);
  });

  test('hiding and showing a live page moves it in and out of dozing', () {
    signals.visibilityChanged(visible: false);
    expect(dispatcher.state, PageState.dozing);

    signals.visibilityChanged(visible: true);
    expect(dispatcher.state, PageState.awake);
    expect(reported, [PageState.dozing, PageState.awake]);
  });

  test('a signal that changes nothing is not announced', () {
    // Browsers fire visibilitychange for reasons that do not move the page.
    signals.visibilityChanged(visible: false);
    signals.visibilityChanged(visible: false);
    expect(reported, [PageState.dozing]);
  });

  test('a restorable exit freezes and a discard unloads', () {
    signals.leaving(restorable: true);
    expect(dispatcher.state, PageState.frozen);

    signals.leaving(restorable: false);
    expect(dispatcher.state, PageState.unloaded);
    expect(reported, [PageState.frozen, PageState.unloaded]);
  });

  test('visibility means nothing once the page has left', () {
    signals.leaving(restorable: true);
    reported.clear();

    signals.visibilityChanged(visible: false);
    signals.visibilityChanged(visible: true);
    expect(dispatcher.state, PageState.frozen);
    expect(reported, isEmpty);
  });

  test('a restore reported while the page never left is a load', () {
    signals.restored(visible: true);
    expect(dispatcher.state, PageState.awake);
    expect(reported, isEmpty);
  });

  test('a restore into a background tab comes back dozing', () {
    signals.leaving(restorable: true);
    signals.restored(visible: false);

    expect(dispatcher.state, PageState.dozing);
    expect(reported, [PageState.frozen, PageState.dozing]);
  });

  test('regained connectivity re-announces awakeness', () {
    signals.connectivityRestored();
    expect(dispatcher.state, PageState.awake);
    expect(reported, [PageState.awake]);
  });

  test('regained connectivity is dropped unless the page is awake', () {
    signals.visibilityChanged(visible: false);
    signals.connectivityRestored();
    expect(reported, [PageState.dozing]);

    signals.leaving(restorable: true);
    reported.clear();
    signals.connectivityRestored();
    expect(reported, isEmpty);
  });

  test('dispose stops the watcher', () {
    dispatcher.dispose();
    expect(watchers.page.disposed, isTrue);
  });
}
