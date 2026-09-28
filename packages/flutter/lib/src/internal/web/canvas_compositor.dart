import 'dart:js_interop';

import 'package:web/web.dart' as web;

import '../errors.dart';
import '../fit.dart';

/// Draws whatever canvas it is pointed at onto a fixed-size surface, and hands
/// back the result as a [web.VideoFrame] for the encoder.
///
/// The encode size never changes for the life of a session. A surface swap or
/// a browser resize only changes the fit ([letterboxFit]), which is what makes
/// swaps free on this path.
///
/// Everything here stays on the GPU: the 2D context is deliberately created
/// *without* `willReadFrequently`, and no pixel is ever read back. `drawImage`
/// is then a GPU-to-GPU copy, measured at a p95 of 0.02-0.10 ms on Chromium.
class CanvasCompositor {
  /// Encode surface dimensions, in pixels.
  final int width;
  final int height;

  /// The canvas being composited. Reassignable: a surface swap is a field
  /// write, and cannot fail the session.
  web.HTMLCanvasElement? source;

  final web.OffscreenCanvas _canvas;
  final web.OffscreenCanvasRenderingContext2D _ctx;

  bool _disposed = false;

  /// Builds a compositor over a fresh [width] x [height] encode surface.
  factory CanvasCompositor({required int width, required int height}) {
    final canvas = web.OffscreenCanvas(width, height);
    // No `willReadFrequently`: this surface is written and encoded, never read
    // back, and asking for a readable one moves the whole thing off the GPU.
    final ctx = canvas.getContext('2d');
    if (ctx == null) {
      throw PixeltraceCaptureException(
        message: 'no 2d context on the encode surface',
      );
    }
    return CanvasCompositor._(
      width,
      height,
      canvas,
      ctx as web.OffscreenCanvasRenderingContext2D,
    );
  }

  CanvasCompositor._(this.width, this.height, this._canvas, this._ctx);

  /// Composites the current [source] and returns the frame, or null if there is
  /// nothing to draw.
  ///
  /// [timestampMicros] is the frame's presentation timestamp, in microseconds.
  ///
  /// The caller owns the returned frame and must transfer or close it.
  web.VideoFrame? composite(int timestampMicros) {
    assert(!_disposed, 'composite after dispose');
    final canvas = source;
    if (canvas == null) {
      return null;
    }

    final fit = letterboxFit(
      srcWidth: canvas.width,
      srcHeight: canvas.height,
      dstWidth: width,
      dstHeight: height,
    );
    if (fit.isEmpty) {
      return null;
    }

    // Repaint the letterbox bars every frame. The source can shrink between
    // composites, and leaving the previous frame's pixels showing through the
    // margin would be both wrong and, once redaction exists, a leak.
    _ctx.fillStyle = 'black'.toJS;
    _ctx.fillRect(0, 0, width, height);
    _ctx.drawImage(canvas, fit.left, fit.top, fit.width, fit.height);

    // The redaction fill goes here, between the draw and the frame
    // construction, and takes the rectangle snapshot the pump captured in the
    // post-frame callback for this same rasterized frame. See FramePump for
    // why the two have to be checked against each other.

    return web.VideoFrame(
      _canvas,
      web.VideoFrameInit(timestamp: timestampMicros, alpha: 'discard'),
    );
  }

  void dispose() {
    if (_disposed) {
      assert(false, 'duplicate dispose');
      return;
    }
    _disposed = true;
    source = null;
  }
}
