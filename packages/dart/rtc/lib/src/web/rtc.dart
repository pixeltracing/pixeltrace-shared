import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// How a peer connection settled while being waited on.
enum RtcConnectResult { connected, failed, timedOut }

/// Takes [pc] to a local offer and returns its SDP, once ICE gathering has
/// finished. Throws if the browser provided no description.
Future<String> buildOfferSdp(web.RTCPeerConnection pc) async {
  await pc.setLocalDescription().toDart;
  await waitForIceGathering(pc);
  final offerSdp = pc.localDescription?.sdp;
  if (offerSdp == null) {
    throw Exception('no local SDP was determined');
  }
  return offerSdp;
}

/// Blocks until [pc] reaches a steady state, bounded by [timeout].
Future<RtcConnectResult> waitForConnection(
  web.RTCPeerConnection pc, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  final completer = Completer<RtcConnectResult>();
  void onStateChange([web.Event? _]) {
    if (completer.isCompleted) return;
    switch (pc.connectionState) {
      case 'connected':
        completer.complete(RtcConnectResult.connected);
      case 'failed' || 'closed':
        completer.complete(RtcConnectResult.failed);
    }
  }

  final onStateChangeJs = onStateChange.toJS;
  pc.addEventListener('connectionstatechange', onStateChangeJs);
  try {
    onStateChange();
    return await completer.future.timeout(
      timeout,
      onTimeout: () => RtcConnectResult.timedOut,
    );
  } finally {
    pc.removeEventListener('connectionstatechange', onStateChangeJs);
  }
}

/// Resolves once ICE gathering has finished. Returns immediately if already
/// done; bounded by [timeout].
Future<void> waitForIceGathering(
  web.RTCPeerConnection pc, {
  Duration timeout = const Duration(seconds: 3),
}) async {
  if (pc.iceGatheringState == 'complete') {
    return;
  }

  final completer = Completer<void>();
  void onStateChange(web.Event _) {
    if (pc.iceGatheringState == 'complete' && !completer.isCompleted) {
      completer.complete();
    }
  }

  final onStateChangeJs = onStateChange.toJS;
  pc.addEventListener('icegatheringstatechange', onStateChangeJs);
  try {
    // If we time out, we still may have a partial list of ice candidates, so
    // it's worth proceeding.
    await completer.future.timeout(timeout, onTimeout: () {});
  } finally {
    pc.removeEventListener('icegatheringstatechange', onStateChangeJs);
  }
}
