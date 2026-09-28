import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/src/internal/fit.dart';

void main() {
  group('letterboxFit', () {
    test('fills the surface when the aspect ratios match', () {
      final fit = letterboxFit(
        srcWidth: 640,
        srcHeight: 360,
        dstWidth: 1280,
        dstHeight: 720,
      );
      expect(fit, const FitRect(left: 0, top: 0, width: 1280, height: 720));
    });

    test('bars the sides of a source taller than the surface', () {
      // 3:4 into 16:9 -> full height, centered horizontally.
      final fit = letterboxFit(
        srcWidth: 540,
        srcHeight: 720,
        dstWidth: 1280,
        dstHeight: 720,
      );
      expect(fit.height, 720);
      expect(fit.width, 540);
      expect(fit.top, 0);
      expect(fit.left, (1280 - 540) / 2);
    });

    test('bars the top and bottom of a source wider than the surface', () {
      // 2:1 into 16:9 -> full width, centered vertically.
      final fit = letterboxFit(
        srcWidth: 1440,
        srcHeight: 720,
        dstWidth: 1280,
        dstHeight: 720,
      );
      expect(fit.width, 1280);
      expect(fit.height, 640);
      expect(fit.left, 0);
      expect(fit.top, (720 - 640) / 2);
    });

    test('upscales a source smaller than the surface', () {
      final fit = letterboxFit(
        srcWidth: 320,
        srcHeight: 180,
        dstWidth: 1280,
        dstHeight: 720,
      );
      expect(fit, const FitRect(left: 0, top: 0, width: 1280, height: 720));
    });

    test('stays inside the surface for every aspect ratio', () {
      for (final src in const [
        [1, 1],
        [3, 4],
        [16, 9],
        [21, 9],
        [1, 100],
        [100, 1],
        [1919, 1081],
      ]) {
        final fit = letterboxFit(
          srcWidth: src[0],
          srcHeight: src[1],
          dstWidth: 1280,
          dstHeight: 720,
        );
        expect(fit.left, greaterThanOrEqualTo(0), reason: '$src');
        expect(fit.top, greaterThanOrEqualTo(0), reason: '$src');
        expect(
          fit.left + fit.width,
          lessThanOrEqualTo(1280.001),
          reason: '$src',
        );
        expect(
          fit.top + fit.height,
          lessThanOrEqualTo(720.001),
          reason: '$src',
        );

        // Aspect ratio preserved.
        expect(
          fit.width / fit.height,
          closeTo(src[0] / src[1], 1e-9),
          reason: '$src',
        );
      }
    });

    test('a source or surface with no area has nothing to draw', () {
      const sizes = [
        [0, 720, 1280, 720],
        [1280, 0, 1280, 720],
        [1280, 720, 0, 720],
        [1280, 720, 1280, 0],
        [-1280, 720, 1280, 720],
      ];
      for (final s in sizes) {
        final fit = letterboxFit(
          srcWidth: s[0],
          srcHeight: s[1],
          dstWidth: s[2],
          dstHeight: s[3],
        );
        expect(fit.isEmpty, isTrue, reason: '$s');
        expect(fit, FitRect.empty, reason: '$s');
      }
    });
  });
}
