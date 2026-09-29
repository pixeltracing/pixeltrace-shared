//
//  Generated code. Do not modify.
//  source: pixeltrace/coord/v1/session.proto
//

import "package:connectrpc/connect.dart" as connectlib;
import "session.pb.dart" as pixeltracecoordv1session;

/// Provides the public interface related to ingestion sessions.
/// The ingest handshake is three steps: Prepare (pre-offer config), Establish
/// (exchange SDP and provision the session), then StartRecording once the
/// client's media path is connected. Close stops the recording and closes the
/// connection.
abstract final class SessionService {
  /// Fully-qualified name of the SessionService service.
  static const name = 'pixeltrace.coord.v1.SessionService';

  static const prepare = connectlib.Spec(
    '/$name/Prepare',
    connectlib.StreamType.unary,
    pixeltracecoordv1session.PrepareRequest.new,
    pixeltracecoordv1session.PrepareResponse.new,
  );

  static const establish = connectlib.Spec(
    '/$name/Establish',
    connectlib.StreamType.unary,
    pixeltracecoordv1session.EstablishRequest.new,
    pixeltracecoordv1session.EstablishResponse.new,
  );

  static const startRecording = connectlib.Spec(
    '/$name/StartRecording',
    connectlib.StreamType.unary,
    pixeltracecoordv1session.StartRecordingRequest.new,
    pixeltracecoordv1session.StartRecordingResponse.new,
  );

  static const close = connectlib.Spec(
    '/$name/Close',
    connectlib.StreamType.unary,
    pixeltracecoordv1session.CloseRequest.new,
    pixeltracecoordv1session.CloseResponse.new,
  );

  /// The WebCodecs upload path: BeginUpload authorizes and provisions a session;
  /// the client then streams fragments over the returned upload URL.
  static const beginUpload = connectlib.Spec(
    '/$name/BeginUpload',
    connectlib.StreamType.unary,
    pixeltracecoordv1session.BeginUploadRequest.new,
    pixeltracecoordv1session.BeginUploadResponse.new,
  );

  static const finishUpload = connectlib.Spec(
    '/$name/FinishUpload',
    connectlib.StreamType.unary,
    pixeltracecoordv1session.FinishUploadRequest.new,
    pixeltracecoordv1session.FinishUploadResponse.new,
  );
}
