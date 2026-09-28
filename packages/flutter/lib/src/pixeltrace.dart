import 'package:flutter/widgets.dart';

import 'internal/config.dart';
import 'internal/errors.dart';
import 'widgets/pixeltrace_capture.dart';
import 'widgets/pixeltrace_service.dart';

class Pixeltrace extends StatelessWidget {
  final PixeltraceServiceConfig serviceConfig;
  final PixeltraceCaptureConfig captureConfig;
  final PixeltraceErrorSink errorSink;
  final Widget? child;

  const Pixeltrace({
    required this.serviceConfig,
    required this.captureConfig,
    this.errorSink = const DefaultErrorSink(),
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PixeltraceService(
      config: serviceConfig,
      errorSink: errorSink,
      child: PixeltraceCapture(config: captureConfig, child: child),
    );
  }
}
