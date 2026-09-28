# pixeltrace_flutter example

A minimal app that streams its UI to Pixeltrace cloud by wrapping itself in a
[`Pixeltrace`] widget. See [`lib/main.dart`](lib/main.dart) for the integration.

## Running

Run with Chrome, passing your project key:

```sh
flutter run -d chrome --dart-define=PIXELTRACE_PROJECT_KEY=your-project-key
```

[`Pixeltrace`]: ../lib/pixeltrace_flutter.dart
