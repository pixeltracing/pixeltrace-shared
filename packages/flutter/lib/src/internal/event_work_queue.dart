import 'dart:collection';

import 'package:meta/meta.dart';

import 'errors.dart';

/// A simple state machine with an event-queue execution model. Events are
/// non-reentrant and queued if the machine is currently busy.
///
/// Subclasses implement the transition table via [handle].
abstract class EventWorkQueue<S, E> {
  final _queue = Queue<E>();
  bool _dispatching = false;
  S _state;

  /// Prefix for debug logs.
  final String debugName;

  /// Where a throwing [handle] call is reported.
  final PixeltraceErrorSink sink;

  /// The current state.
  S get state => _state;

  EventWorkQueue(this._state, {required this.debugName, required this.sink});

  /// Accepts and handles [event]. The event is guaranteed to be delivered at
  /// some point in the future, but this function returns arbitrarily before
  /// that.
  void send(E event) async {
    _queue.add(event);
    if (_dispatching) {
      return;
    }
    _dispatching = true;
    try {
      while (_queue.isNotEmpty) {
        final evt = _queue.removeFirst();

        S? next;
        try {
          next = await handle(_state, evt);
        } catch (e, s) {
          sink.report(e, s);
          continue;
        }

        if (next == null || identical(next, _state)) {
          continue;
        }
        log.fine('$debugName: $_state --$evt--> $next');
        _state = next;
      }
    } finally {
      _dispatching = false;
    }
  }

  /// The transition table. Returns the next state, or null when the event
  /// causes no transition (either ignored, or handled in place).
  @protected
  Future<S?> handle(S state, E event);
}
