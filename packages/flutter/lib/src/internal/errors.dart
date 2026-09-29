import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' show Logger;

final log = Logger('pixeltrace');

/// Receives errors raised by the SDK.
abstract class PixeltraceErrorSink {
  const PixeltraceErrorSink();

  /// Reports [error].
  void report(Object error, StackTrace stack);
}

/// The default sink, treating errors as follows:
/// - [Error]: a bug, ours or the integration's. The developer should see it, so
///   it goes to [FlutterError.reportError].
/// - anything else (e.g. network issues): logged in debug and dropped in
///   release.
class DefaultErrorSink extends PixeltraceErrorSink {
  const DefaultErrorSink();

  @override
  void report(Object error, StackTrace stack) {
    if (error is Error) {
      _reportToFlutter(error, stack);
      return;
    }

    assert(() {
      log.warning('pixeltrace encountered an issue', error, stack);
      return true;
    }());
  }
}

/// Consumes errors and suppresses them.
class NullErrorSink extends PixeltraceErrorSink {
  const NullErrorSink();

  @override
  void report(Object error, StackTrace stack) {}
}

/// Catches errors on [future] so a failure won't surface in the host app as an
/// unhandled error. Use in place of plain `unawaited`.
void unawaitedCatchErr(
  Future<void>? future, {
  required PixeltraceErrorSink sink,
}) {
  unawaited(future?.catchError(sink.report));
}

class PixeltraceServiceException implements Exception {
  final String message;
  const PixeltraceServiceException({this.message = ''});

  @override
  String toString() => 'PixeltraceServiceException($message)';
}

class PixeltraceCaptureException implements Exception {
  final String message;
  const PixeltraceCaptureException({this.message = ''});

  @override
  String toString() => 'PixeltraceCaptureException($message)';
}

void _reportToFlutter(
  Object error,
  StackTrace stack, {
  DiagnosticsNode? context,
}) {
  FlutterError.reportError(
    FlutterErrorDetails(
      exception: error,
      stack: stack,
      library: 'pixeltrace',
      context: context,
    ),
  );
}
