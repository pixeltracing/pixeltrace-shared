import 'dart:math' as math;

/// Where a source image lands inside the encode surface, in encode pixels.
///
/// Deliberately free of `dart:ui` and `package:web` so the arithmetic — the
/// part that is easy to get wrong and impossible to eyeball in a browser — can
/// be tested on the VM.
class FitRect {
  final double left;
  final double top;
  final double width;
  final double height;

  const FitRect({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  /// Nothing to draw. Produced for a source or destination with no area.
  static const empty = FitRect(left: 0, top: 0, width: 0, height: 0);

  bool get isEmpty => width <= 0 || height <= 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FitRect &&
          left == other.left &&
          top == other.top &&
          width == other.width &&
          height == other.height;

  @override
  int get hashCode => Object.hash(left, top, width, height);

  @override
  String toString() => 'FitRect($left, $top, $width x $height)';
}

/// Fits a [srcWidth] x [srcHeight] image inside a [dstWidth] x [dstHeight]
/// surface, preserving aspect ratio and centering what is left over.
///
/// The encode size is fixed for a session while the captured canvas is not, so
/// this is what absorbs a surface swap or a browser resize: the source changes
/// size, the encoder never learns about it.
///
/// Upscaling is allowed. A canvas smaller than the encode surface still fills
/// it rather than sitting in the middle of a black field, which is what a host
/// watching the recording expects to see.
FitRect letterboxFit({
  required num srcWidth,
  required num srcHeight,
  required num dstWidth,
  required num dstHeight,
}) {
  if (srcWidth <= 0 || srcHeight <= 0 || dstWidth <= 0 || dstHeight <= 0) {
    return FitRect.empty;
  }

  final scale = math.min(dstWidth / srcWidth, dstHeight / srcHeight);
  final width = srcWidth * scale;
  final height = srcHeight * scale;
  return FitRect(
    left: (dstWidth - width) / 2,
    top: (dstHeight - height) / 2,
    width: width.toDouble(),
    height: height.toDouble(),
  );
}
