import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// How many frames [sender] has sent, or null before it has sent any media.
Future<int?> framesSent(web.RTCRtpSender sender) async {
  final report = await sender.getStats().toDart;
  int? frames;
  report.forEach(
    ((_RtcStats stat, JSString _, JSObject _) {
      if (stat.type == 'outbound-rtp') {
        frames = stat.framesSent?.toDartInt;
      }
    }).toJS,
  );
  return frames;
}

// package:web appears to declare RTCStatsReport with no members
extension on web.RTCStatsReport {
  external void forEach(JSFunction callback);
}

extension type _RtcStats._(JSObject _) implements JSObject {
  external String get type;
  external JSNumber? get framesSent;
}
