@TestOn('browser')
library;

import 'dart:js_interop';

import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/src/internal/web/canvas_compositor.dart';
import 'package:web/web.dart' as web;

import 'frame_probe.dart';

const _kEncodeWidth = 320;
const _kEncodeHeight = 180;

/// A canvas filled with an unmistakable colour, so a frame showing the
/// compositor's black background instead of the source is detectable.
web.HTMLCanvasElement _filledCanvas(int width, int height) {
  final canvas = web.document.createElement('canvas') as web.HTMLCanvasElement
    ..width = width
    ..height = height;
  final ctx = canvas.getContext('2d') as web.CanvasRenderingContext2D;
  ctx.fillStyle = '#ff00ff'.toJS;
  ctx.fillRect(0, 0, width, height);
  return canvas;
}

void main() {
  late CanvasCompositor compositor;

  setUp(() {
    compositor = CanvasCompositor(width: _kEncodeWidth, height: _kEncodeHeight);
  });
  tearDown(() => compositor.dispose());

  test('a composited frame is not blank', () async {
    compositor.source = _filledCanvas(_kEncodeWidth, _kEncodeHeight);

    final frame = compositor.composite(1000)!;
    addTearDown(() => frame.close());

    expect(frame.displayWidth, _kEncodeWidth);
    expect(frame.displayHeight, _kEncodeHeight);
    expect(frame.timestamp, 1000);

    final rgba = await readRgba(frame);
    expectNotBlank(probeGrid(rgba, _kEncodeWidth, _kEncodeHeight));
  });

  test('a taller source is letterboxed, not stretched', () async {
    // 1:1 into 16:9 -> bars down both sides, content down the middle.
    compositor.source = _filledCanvas(_kEncodeHeight, _kEncodeHeight);

    final frame = compositor.composite(2000)!;
    addTearDown(() => frame.close());
    final rgba = await readRgba(frame);

    final centre = pixelAt(
      rgba,
      _kEncodeWidth,
      _kEncodeWidth ~/ 2,
      _kEncodeHeight ~/ 2,
    );
    expect(centre.$1, greaterThan(0), reason: 'content missing: $centre');

    for (final x in [2, _kEncodeWidth - 3]) {
      final bar = pixelAt(rgba, _kEncodeWidth, x, _kEncodeHeight ~/ 2);
      expect(
        (bar.$1, bar.$2, bar.$3),
        (0, 0, 0),
        reason: 'letterbox bar at x=$x is not black: $bar',
      );
    }
  });

  test(
    'a shrunken source does not leave the previous frame in the margin',
    () async {
      compositor.source = _filledCanvas(_kEncodeWidth, _kEncodeHeight);
      compositor.composite(1000)!.close();

      // Same compositor, narrower source: the margin it now leaves must be
      // repainted rather than still showing the full-bleed frame before it.
      compositor.source = _filledCanvas(_kEncodeHeight, _kEncodeHeight);
      final frame = compositor.composite(2000)!;
      addTearDown(() => frame.close());

      final rgba = await readRgba(frame);
      final bar = pixelAt(rgba, _kEncodeWidth, 2, _kEncodeHeight ~/ 2);
      expect((bar.$1, bar.$2, bar.$3), (0, 0, 0), reason: 'stale margin: $bar');
    },
  );

  test('there is nothing to composite without a source', () {
    expect(compositor.composite(1000), isNull);
  });

  test('there is nothing to composite from a zero-sized source', () {
    compositor.source = _filledCanvas(0, 0);
    expect(compositor.composite(1000), isNull);
  });
}
