# pixeltrace_flutter

Stream a running Flutter web app's UI to [Pixeltrace](https://pixeltrace.dev).

`pixeltrace_flutter` captures your app's rendered output and ingests it over
WebRTC, so you can watch and trace real sessions from the Pixeltrace dashboard.

## Platform support

| Platform | Status                        |
| -------- | ----------------------------- |
| Web      | ✅ Supported                  |
| Others   | ⚠️ No-op (capture is skipped) |

On non-web platforms the SDK is safe to include and build, but does not capture
anything.

## Getting started

Add the dependency via `flutter pub add pixeltrace_flutter` or:

```yaml
dependencies:
  pixeltrace_flutter: ^0.0.1
```

You'll need a free Pixeltrace account, and a **project key** created on the
dashboard.

## Usage

Wrap your app in a `Pixeltrace` widget:

```dart
import 'package:pixeltrace_flutter/pixeltrace_flutter.dart';

void main() {
  runApp(
    Pixeltrace(
      serviceConfig: PixeltraceServiceConfig(projectKey: 'your-project-key'),
      captureConfig: const PixeltraceCaptureConfig(fps: 30),
      child: const MyApp(),
    ),
  );
}
```

The widget connects to the ingest service, establishes a WebRTC session, and
starts a capture automatically. It tears everything down and stops capturing
when removed from the tree.

## Example

See [`example/`](example/) for a runnable web app.

## Additional information

- Homepage: <https://pixeltrace.dev>
- Issues: <https://github.com/pixeltracing/pixeltrace-shared/issues>
