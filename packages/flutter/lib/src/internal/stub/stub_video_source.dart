import 'dart:ui';

import '../../video_source.dart';

class StubVideoSource extends PixeltraceVideoSource {
  final int fps;
  StubVideoSource({required this.fps});
}

Future<PixeltraceVideoSource> captureFlutterView(
  FlutterView view, {
  required int fps,
}) async {
  return StubVideoSource(fps: fps);
}
