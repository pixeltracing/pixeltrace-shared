import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart';
import 'package:connectrpc/web.dart';
import 'package:pixeltrace_proto/pixeltrace/coord/v1/session.connect.client.dart';
import 'package:pixeltrace_proto/pixeltrace/coord/v1/session.pb.dart';
import 'package:pixeltrace_proto/pixeltrace/types/v1/types.pb.dart';
import 'package:web/web.dart' as web;

import '../config.dart';
import '../errors.dart';

/// The upload path's half of the ingest API: acquire a socket, and finalize a
/// session whose socket is gone.
///
/// The WebRTC handshake rpcs (`Prepare`, `Establish`, `StartRecording`,
/// `Close`) have no counterpart here. `BeginUpload` plus the socket's first
/// frame is the whole start of a recording.
class SessionRpc {
  final PixeltraceServiceConfig config;

  final Transport _transport;
  late final _client = SessionServiceClient(_transport);

  SessionRpc(this.config)
    : _transport = Transport(
        baseUrl: config.endpoint,
        codec: const ProtoCodec(),
        httpClient: createHttpClient(),
      );

  /// Opens (or, with [resume], rejoins) an upload session.
  ///
  /// The returned `upload_url` is itself the credential — there is no token to
  /// carry and none to refresh — so a resume calls this again for a fresh one
  /// rather than reusing a URL that may have expired.
  Future<BeginUploadResponse> beginUpload({SessionId? resume}) async {
    try {
      return await _client.beginUpload(
        BeginUploadRequest(
          siteKey: SiteKey(key: config.projectKey),
          sessionId: resume,
          clientInfo: SessionPublisherInfo(referrer: web.document.referrer),
        ),
      );
    } catch (e) {
      throw PixeltraceServiceException(message: 'begin upload failed: $e');
    }
  }

  /// Finalizes [sessionId]. Best-effort: a session nobody finalizes is closed
  /// by the server's idle timeout anyway.
  Future<void> finishUpload(SessionId sessionId) async {
    try {
      await _client.finishUpload(
        FinishUploadRequest(
          sessionId: sessionId,
          siteKey: SiteKey(key: config.projectKey),
        ),
      );
    } catch (_) {
      // Finalization is always best-effort.
    }
  }
}
