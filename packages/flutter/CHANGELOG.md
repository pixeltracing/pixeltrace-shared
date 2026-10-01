## 0.0.2

* Depend on `pixeltrace_rtc` 0.0.2.

## 0.0.1

Initial release.

* `Pixeltrace` widget that connects, establishes a WebRTC ingest session, and
  starts a capture for the app's view.
* Web capture of the Flutter render canvas at a configurable frame rate.
* Non-web platforms are supported at build time as no-ops; recording is only
  functional for web builds.
