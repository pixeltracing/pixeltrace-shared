import 'dart:ui' show FlutterView;

import 'package:flutter/widgets.dart';

import '../internal/config.dart';
import '../internal/errors.dart';
import '../internal/media_link.dart';
import '../video_source.dart';
import 'pixeltrace_service.dart';

/// Drop this beneath a `PixeltraceService` ancestor to capture the app's
/// Flutter view. Capture occurs asynchronously, in the background, and
/// recording typically starts after a delay of a few seconds. Recording
/// stops when disabled, or when removed from the tree.
class PixeltraceCapture extends StatefulWidget {
  final PixeltraceCaptureConfig config;
  final Widget? child;

  const PixeltraceCapture({required this.config, this.child, super.key});

  @override
  State<PixeltraceCapture> createState() => _PixeltraceCaptureState();
}

class _PixeltraceCaptureState extends State<PixeltraceCapture> {
  /// The link carrying the current recording, or null while capture is off, and
  /// its config.
  MediaLink? _link;
  PixeltraceServiceConfig? _config;

  PixeltraceErrorSink _sink = const DefaultErrorSink();
  bool _connected = false;
  int? _prevFps;
  FlutterView? _prevView;
  int _generation = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(covariant PixeltraceCapture oldWidget) {
    super.didUpdateWidget(oldWidget);
    _sync();
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: widget.child);
  }

  void _sync() {
    final service = PixeltraceConfigProvider.maybeOf(context);
    if (!widget.config.enabled || service == null) {
      _stop();
      return;
    }

    // A new destination is a different recording, so end the current one.
    if (_link != null && service.config != _config) {
      _stop();
    }

    if (_link == null) {
      _config = service.config;
      _sink = service.sink;
      _link = MediaLink(config: _config!, sink: _sink);
    }

    final view = View.of(context);
    if (widget.config.fps != _prevFps || view != _prevView) {
      _bind(view);
    }
  }

  void _bind(FlutterView view) {
    final link = _link!;
    final fps = widget.config.fps;
    _prevFps = fps;
    _prevView = view;

    final generation = ++_generation;
    _bg(() async {
      final source = await captureFlutterView(view, fps: fps);

      // Torn down, or superseded by a newer binding, while the capture was in
      // flight. Installing now would stream the wrong thing.
      if (generation != _generation) {
        return;
      }

      if (_connected) {
        link.rebind(source);
      } else {
        _connected = true;
        link.connect(source);
      }
    }());
  }

  void _stop() {
    final link = _link;
    if (link == null) {
      return;
    }

    _generation++;
    _link = null;
    _connected = false;
    _prevFps = null;
    _prevView = null;
    link.dispose();
  }

  void _bg(Future<void> future) => unawaitedCatchErr(future, sink: _sink);
}
