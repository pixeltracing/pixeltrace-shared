import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/src/internal/stub/stub_video_source.dart';
import 'package:pixeltrace_flutter/src/internal/surface_dispatcher.dart';
import 'package:pixeltrace_flutter/src/video_source.dart';

import 'fake_watchers.dart';

void main() {
  late FakeWatchers watchers;
  late List<PixeltraceVideoSource> reported;
  late SurfaceDispatcher dispatcher;
  late SurfaceSignals signals;

  setUp(() {
    watchers = FakeWatchers.install();
    reported = [];
    dispatcher = SurfaceDispatcher(sink: reported.add);
    signals = watchers.surface.signals;
  });

  tearDown(FakeWatchers.reset);

  test('the watched surface is whichever source is installed', () {
    expect(signals.watching, isNull);

    final first = StubVideoSource(fps: 30);
    dispatcher.source = first;
    expect(signals.watching, same(first));

    final second = StubVideoSource(fps: 60);
    dispatcher.source = second;
    expect(signals.watching, same(second));

    dispatcher.source = null;
    expect(signals.watching, isNull);
  });

  test('a replacement is handed to the sink', () {
    dispatcher.source = StubVideoSource(fps: 30);

    final replacement = StubVideoSource(fps: 30);
    signals.replaced(replacement);
    expect(reported, [same(replacement)]);
  });

  test('dispose stops the watcher', () {
    dispatcher.dispose();
    expect(watchers.surface.disposed, isTrue);
  });
}
