import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/pixeltrace_flutter.dart';

/// Tracks how many times the child subtree was built from scratch.
int _initCount = 0;
_ProbeState? _lastState;

class _Probe extends StatefulWidget {
  const _Probe();

  @override
  State<_Probe> createState() => _ProbeState();
}

class _ProbeState extends State<_Probe> {
  /// Stand-in for some app state
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _initCount++;
    _lastState = this;
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

Widget _app({bool captureEnabled = true}) => Pixeltrace(
  serviceConfig: PixeltraceServiceConfig(projectKey: 'test-key'),
  captureConfig: PixeltraceCaptureConfig(
    fps: 30,
    captureEnabled: captureEnabled,
    captureInDebugMode: true,
  ),
  child: const _Probe(),
);

void main() {
  setUp(() {
    _initCount = 0;
    _lastState = null;
  });

  testWidgets('child state survives the connect and a captureEnabled toggle', (
    tester,
  ) async {
    // Settling runs the connect, which swaps a source in under the child.
    await tester.pumpWidget(_app(captureEnabled: true));
    await tester.pumpAndSettle();

    final firstState = _lastState!;
    firstState.counter = 7;

    // Off. The session is torn down while the child stays put.
    await tester.pumpWidget(_app(captureEnabled: false));
    await tester.pumpAndSettle();
    expect(
      _initCount,
      1,
      reason: 'neither connecting nor toggling capture off may re-initialize '
          'the child',
    );
    expect(identical(_lastState, firstState), isTrue);

    // ...and back on.
    await tester.pumpWidget(_app(captureEnabled: true));
    await tester.pumpAndSettle();
    expect(
      _initCount,
      1,
      reason: 'toggling capture back on must not re-initialize the child',
    );
    expect(identical(_lastState, firstState), isTrue);
    expect(firstState.counter, 7);
  });
}
