import 'package:flutter/material.dart';
import 'package:pixeltrace_flutter/pixeltrace_flutter.dart';

const _kProjectKey = String.fromEnvironment(
  'PIXELTRACE_PROJECT_KEY',
  defaultValue: 'your-project-key',
);

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  var _transport = PixeltraceTransport.webrtc;

  @override
  Widget build(BuildContext context) {
    // Wrapping the app in [Pixeltrace] streams the app to the Pixeltrace ingest
    // service.
    return Pixeltrace(
      serviceConfig: PixeltraceServiceConfig(
        projectKey: _kProjectKey,
        transport: _transport,
      ),
      // Capture is off in debug builds by default; the example is run in debug
      // mode, so opt in explicitly.
      captureConfig: const PixeltraceCaptureConfig(
        fps: 30,
        captureInDebugMode: true,
      ),
      child: MaterialApp(
        title: 'Pixeltrace Example',
        theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
        home: CounterPage(
          transport: _transport,
          onTransportChanged: (t) => setState(() => _transport = t),
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  final PixeltraceTransport transport;
  final ValueChanged<PixeltraceTransport> onTransportChanged;

  const CounterPage({
    super.key,
    required this.transport,
    required this.onTransportChanged,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pixeltrace Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This screen is being streamed to Pixeltrace.'),
            const SizedBox(height: 16),
            Text('$_count', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 32),
            // The two ingest paths, side by side, so they can be compared on
            // the same app. Switching is a config change, so it ends the
            // current recording and starts a new one.
            SegmentedButton<PixeltraceTransport>(
              segments: const [
                ButtonSegment(
                  value: PixeltraceTransport.webrtc,
                  label: Text('WebRTC'),
                ),
                ButtonSegment(
                  value: PixeltraceTransport.webcodecs,
                  label: Text('WebCodecs'),
                ),
              ],
              selected: {widget.transport},
              onSelectionChanged: (s) => widget.onTransportChanged(s.single),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        child: const Icon(Icons.add),
      ),
    );
  }
}
