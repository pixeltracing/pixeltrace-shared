@TestOn('browser')
library;

import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pixeltrace_flutter/src/internal/web/sender_stats.dart';
import 'package:pixeltrace_rtc/web.dart';
import 'package:web/web.dart' as web;

/// Connects a sender carrying [track] to a local receiver, returning the sender
/// and a function that closes both ends.
Future<(web.RTCRtpSender, VoidCallback)> _loopback(
  web.MediaStreamTrack track,
) async {
  final tx = web.RTCPeerConnection();
  final rx = web.RTCPeerConnection();
  final sender = tx.addTrack(track, web.MediaStream());
  final offer = await buildOfferSdp(tx);
  await rx
      .setRemoteDescription(
        web.RTCSessionDescriptionInit(type: 'offer', sdp: offer),
      )
      .toDart;
  final answer = await buildOfferSdp(rx);
  await tx
      .setRemoteDescription(
        web.RTCSessionDescriptionInit(type: 'answer', sdp: answer),
      )
      .toDart;
  return (
    sender,
    () {
      tx.close();
      rx.close();
    },
  );
}

web.HTMLCanvasElement _canvas() =>
    web.document.createElement('canvas') as web.HTMLCanvasElement
      ..width = 320
      ..height = 180;

/// Repaints [canvas] with a new color every animation frame. Returns a cancel
/// function that stops the animation.
VoidCallback _animate(web.HTMLCanvasElement canvas) {
  final ctx = canvas.getContext('2d') as web.CanvasRenderingContext2D;
  bool running = true;
  int n = 0;
  void paint(JSNumber _) {
    if (!running) {
      return;
    }
    ctx.fillStyle = 'hsl(${n++ % 360}, 60%, 50%)'.toJS;
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    web.window.requestAnimationFrame(paint.toJS);
  }

  web.window.requestAnimationFrame(paint.toJS);
  return () => running = false;
}

void main() {
  test(
    'framesSent counts frames, and stops while the canvas is still',
    () async {
      final canvas = _canvas();
      final track = canvas.captureStream(30).getVideoTracks().toDart.first;
      final (sender, close) = await _loopback(track);
      addTearDown(() {
        track.stop();
        close();
      });

      var stop = _animate(canvas);
      await Future<void>.delayed(const Duration(seconds: 2));
      final drawn = await framesSent(sender);
      expect(drawn, greaterThan(0));

      stop();
      // Let frames already captured drain through the encoder.
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final settled = await framesSent(sender);
      await Future<void>.delayed(const Duration(seconds: 2));
      expect(await framesSent(sender), settled);

      stop = _animate(canvas);
      addTearDown(stop);
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(await framesSent(sender), greaterThan(settled!));
    },
  );

  test('framesSent keeps counting across a track replacement', () async {
    final first = _canvas();
    final firstTrack = first.captureStream(30).getVideoTracks().toDart.first;
    final (sender, close) = await _loopback(firstTrack);
    final stopFirst = _animate(first);
    addTearDown(() {
      stopFirst();
      firstTrack.stop();
      close();
    });
    await Future<void>.delayed(const Duration(seconds: 2));
    final before = await framesSent(sender);
    expect(before, greaterThan(0));

    // What swap() does: a new canvas's track on the same sender.
    final second = _canvas();
    final secondTrack = second.captureStream(30).getVideoTracks().toDart.first;
    final stopSecond = _animate(second);
    addTearDown(() {
      stopSecond();
      secondTrack.stop();
    });
    await sender.replaceTrack(secondTrack).toDart;
    await Future<void>.delayed(const Duration(seconds: 1));
    expect(await framesSent(sender), greaterThan(before!));
  });
}
