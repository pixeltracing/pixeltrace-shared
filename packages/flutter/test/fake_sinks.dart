import 'package:pixeltrace_flutter/src/internal/errors.dart';

/// Collects what the SDK reports, so tests can assert on it.
class RecordingSink extends PixeltraceErrorSink {
  final List<Object> errors = [];
  final List<StackTrace> stacks = [];

  @override
  void report(Object error, StackTrace stack) {
    errors.add(error);
    stacks.add(stack);
  }
}
