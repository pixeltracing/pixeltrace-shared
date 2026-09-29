import 'package:flutter/widgets.dart';

import '../internal/config.dart';
import '../internal/errors.dart';

/// Publishes the [PixeltraceServiceConfig] that descendant `PixeltraceCapture`
/// widgets record against, along with the sink they report failures to.
class PixeltraceService extends StatelessWidget {
  /// Where the subtree records to.
  final PixeltraceServiceConfig config;

  /// Where the SDK reports errors.
  final PixeltraceErrorSink errorSink;

  /// The subtree that will be recorded.
  final Widget? child;

  const PixeltraceService({
    required this.config,
    this.errorSink = const DefaultErrorSink(),
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PixeltraceConfigProvider(
      config: config,
      sink: errorSink,
      child: SizedBox(child: child),
    );
  }
}

class PixeltraceConfigProvider extends InheritedWidget {
  final PixeltraceServiceConfig config;
  final PixeltraceErrorSink sink;

  const PixeltraceConfigProvider({
    required this.config,
    required this.sink,
    super.key,
    required super.child,
  });

  /// The nearest service, or null when there is no [PixeltraceService] above
  /// [context] — in which case there is nowhere to record to.
  static PixeltraceConfigProvider? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PixeltraceConfigProvider>();

  @override
  bool updateShouldNotify(PixeltraceConfigProvider oldWidget) =>
      config != oldWidget.config || sink != oldWidget.sink;
}
