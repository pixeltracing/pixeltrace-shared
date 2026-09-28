@TestOn('browser')
library;

import 'dart:js_interop';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:web/web.dart' as web;

/// One probed pixel, as RGBA bytes.
typedef Rgba = (int r, int g, int b, int a);

/// Copies [frame] out as RGBA and returns its pixels.
///
/// A readback is exactly what the compositor must never do in production, and
/// exactly what a test has to do: the failure this guards against reports
/// success and emits transparent pixels, so nothing short of looking at them
/// catches it.
Future<Uint8List> readRgba(web.VideoFrame frame) async {
  final options = web.VideoFrameCopyToOptions(format: 'RGBA');
  final buffer = Uint8List(frame.allocationSize(options));
  await frame.copyTo(buffer.toJS, options).toDart;
  return buffer;
}

/// Reads the pixel at ([x], [y]) out of an RGBA buffer [width] pixels wide.
Rgba pixelAt(Uint8List rgba, int width, int x, int y) {
  final i = (y * width + x) * 4;
  return (rgba[i], rgba[i + 1], rgba[i + 2], rgba[i + 3]);
}

/// The pixels on an [n] x [n] grid spanning [width] x [height], inset so no
/// sample lands on an edge.
List<Rgba> probeGrid(Uint8List rgba, int width, int height, {int n = 5}) => [
  for (var row = 0; row < n; row++)
    for (var col = 0; col < n; col++)
      pixelAt(
        rgba,
        width,
        ((col + 0.5) * width / n).floor(),
        ((row + 0.5) * height / n).floor(),
      ),
];

/// Fails unless some sampled pixel carries content.
///
/// "Blank" covers both shapes this fails in, neither of which raises: reading
/// the canvas outside an animation frame yields entirely transparent pixels,
/// and a `drawImage` that quietly draws nothing leaves the compositor's own
/// black background showing. So a frame counts as blank until some pixel is
/// both opaque and not pure black — which is why the source under test is
/// painted a colour the background cannot be mistaken for.
void expectNotBlank(List<Rgba> pixels, {String? reason}) {
  expect(
    pixels.any((p) => p.$4 > 0 && (p.$1 > 0 || p.$2 > 0 || p.$3 > 0)),
    isTrue,
    reason: reason ?? 'every sampled pixel was transparent or black: $pixels',
  );
}
