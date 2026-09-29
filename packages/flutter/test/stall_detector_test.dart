import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/src/internal/stall_detector.dart';

void main() {
  final t0 = DateTime(2026);
  DateTime at(int seconds) => t0.add(Duration(seconds: seconds));

  test('nothing recorded is not a stall', () {
    expect(StallDetector().isStalled(at(600)), isFalse);
  });

  test('steady frames are never a stall', () {
    final d = StallDetector();
    for (var s = 0; s < 120; s++) {
      d.record(s * 30, at(s));
      expect(d.isStalled(at(s)), isFalse);
    }
  });

  test('a stall begins once no frames are sent for the threshold', () {
    final d = StallDetector();
    d.record(100, at(0));
    d.record(100, at(24));
    expect(d.isStalled(at(24)), isFalse);
    d.record(100, at(25));
    expect(d.isStalled(at(25)), isTrue);
  });

  test('a stall is timed from the last new frame, not the first sample', () {
    final d = StallDetector();
    d.record(0, at(0));
    d.record(30, at(10));
    expect(d.isStalled(at(34)), isFalse);
    expect(d.isStalled(at(35)), isTrue);
  });

  test('a session that never sends is timed from the first sample', () {
    final d = StallDetector();
    d.record(0, at(0));
    expect(d.isStalled(at(25)), isTrue);
  });

  test('a new frame ends the stall', () {
    final d = StallDetector();
    d.record(100, at(0));
    expect(d.isStalled(at(600)), isTrue);
    d.record(101, at(600));
    expect(d.isStalled(at(600)), isFalse);
  });
}
