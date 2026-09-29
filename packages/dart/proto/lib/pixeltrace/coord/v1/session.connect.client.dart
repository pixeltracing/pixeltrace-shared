//
//  Generated code. Do not modify.
//  source: pixeltrace/coord/v1/session.proto
//

import "package:connectrpc/connect.dart" as connectlib;
import "session.pb.dart" as pixeltracecoordv1session;
import "session.connect.spec.dart" as specs;

/// Provides the public interface related to ingestion sessions.
/// The ingest handshake is three steps: Prepare (pre-offer config), Establish
/// (exchange SDP and provision the session), then StartRecording once the
/// client's media path is connected. Close stops the recording and closes the
/// connection.
extension type SessionServiceClient(connectlib.Transport _transport) {
  Future<pixeltracecoordv1session.PrepareResponse> prepare(
    pixeltracecoordv1session.PrepareRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.SessionService.prepare,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<pixeltracecoordv1session.EstablishResponse> establish(
    pixeltracecoordv1session.EstablishRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.SessionService.establish,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<pixeltracecoordv1session.StartRecordingResponse> startRecording(
    pixeltracecoordv1session.StartRecordingRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.SessionService.startRecording,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<pixeltracecoordv1session.CloseResponse> close(
    pixeltracecoordv1session.CloseRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.SessionService.close,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// The WebCodecs upload path: BeginUpload authorizes and provisions a session;
  /// the client then streams fragments over the returned upload URL.
  Future<pixeltracecoordv1session.BeginUploadResponse> beginUpload(
    pixeltracecoordv1session.BeginUploadRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.SessionService.beginUpload,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<pixeltracecoordv1session.FinishUploadResponse> finishUpload(
    pixeltracecoordv1session.FinishUploadRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.SessionService.finishUpload,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
