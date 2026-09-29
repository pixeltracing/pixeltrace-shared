import 'dart:async';
import 'dart:js_interop';
import 'dart:ui';
import 'package:web/web.dart' as web;

import '../errors.dart';
import '../../video_source.dart';

class WebVideoSource extends PixeltraceVideoSource {
  final web.HTMLCanvasElement canvas;

  /// Frames per second at which to capture the video stream.
  final int fps;

  WebVideoSource(this.canvas, {required this.fps});
}

// TODO: locate canvas corresponding to the view.
//   see <https://github.com/flutter/flutter/issues/188789>
Future<PixeltraceVideoSource> captureFlutterView(
  FlutterView _, {
  required int fps,
}) async {
  final canvas = await _awaitFlutterCanvas();
  if (canvas == null) {
    throw PixeltraceCaptureException(
      message: 'failed to find the Flutter <canvas>',
    );
  }
  return WebVideoSource(canvas, fps: fps);
}

/// Resolves with Flutter's render `<canvas>` once it exists, or null if it does
/// not appear within a timeout.
Future<web.HTMLCanvasElement?> _awaitFlutterCanvas() {
  const kTimeout = Duration(seconds: 3);
  final existing = findFlutterCanvas();
  if (existing != null) {
    return Future.value(existing);
  }

  final completer = Completer<web.HTMLCanvasElement?>();
  final observer = observeFlutterCanvas(() {
    if (completer.isCompleted) {
      return;
    }
    final canvas = findFlutterCanvas();
    if (canvas != null) {
      completer.complete(canvas);
    }
  });

  return completer.future
      .timeout(kTimeout, onTimeout: () => null)
      .whenComplete(() => observer.disconnect());
}

/// Finds the Flutter render `<canvas>` currently in the DOM, or null if none
/// can be located.
web.HTMLCanvasElement? findFlutterCanvas() {
  // Primary: the glass pane hosts Flutter's rendering surfaces in its shadow
  // root.
  for (final root in _glassPaneShadowRoots()) {
    final canvas = _asCanvas(root.querySelector('canvas'));
    if (canvas != null) {
      return canvas;
    }
  }

  // Fallbacks: some renderer/embedding configurations place the canvas in the
  // light DOM (e.g. under flt-scene-host) rather than a shadow root.
  final doc = web.document;
  return _asCanvas(doc.querySelector('canvas')) ??
      _asCanvas(doc.querySelector('flt-scene-host canvas')) ??
      _asCanvas(doc.querySelector('flutter-view canvas'));
}

/// Invokes [onMutation] whenever the DOM changes in a way that can make the
/// <canvas> move or be replaced. The caller must [MutationObserver.disconnect]
/// the returned observer when done.
web.MutationObserver observeFlutterCanvas(void Function() onMutation) {
  void handle(JSArray<web.MutationRecord> _, web.MutationObserver observer) {
    _syncCanvasObservation(observer);
    onMutation();
  }

  final observer = web.MutationObserver(handle.toJS);
  _syncCanvasObservation(observer);
  return observer;
}

/// (Re)attaches [observer] to the light DOM root and every glass pane's shadow
/// root. Re-observing an already-watched node just refreshes it, so this is
/// safe to call repeatedly as new panes appear.
void _syncCanvasObservation(web.MutationObserver observer) {
  final opts = web.MutationObserverInit(childList: true, subtree: true);

  // Regular DOM: renderer configs that keep the canvas outside a shadow root,
  // and glass-pane elements being added or removed wholesale.
  final lightRoot = web.document.body ?? web.document.documentElement;
  if (lightRoot != null) {
    observer.observe(lightRoot, opts);
  }

  // Shadow DOM: the common case, where the canvas lives inside the glass pane's
  // shadow root.
  for (final root in _glassPaneShadowRoots()) {
    observer.observe(root, opts);
  }
}

/// The shadow root of each Flutter `flt-glass-pane`, which is where Flutter
/// mounts its `<canvas>` elements.
Iterable<web.ShadowRoot> _glassPaneShadowRoots() sync* {
  final panes = web.document.querySelectorAll('flt-glass-pane');
  for (var i = 0; i < panes.length; i++) {
    final root = (panes.item(i) as web.Element?)?.shadowRoot;
    if (root != null) {
      yield root;
    }
  }
}

web.HTMLCanvasElement? _asCanvas(web.Element? found) {
  return found.isA<web.HTMLCanvasElement>()
      ? found as web.HTMLCanvasElement
      : null;
}
