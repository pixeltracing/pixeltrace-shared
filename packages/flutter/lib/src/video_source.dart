import 'dart:ui';

import 'internal/stub/stub_video_source.dart'
    if (dart.library.js_interop) 'internal/web/web_video_source.dart'
    as impl;

abstract class PixeltraceVideoSource {}

Future<PixeltraceVideoSource> captureFlutterView(
  FlutterView view, {
  required int fps,
}) {
  return impl.captureFlutterView(view, fps: fps);
}
