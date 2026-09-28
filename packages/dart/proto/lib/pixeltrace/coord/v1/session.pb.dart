// This is a generated file - do not edit.
//
// Generated from pixeltrace/coord/v1/session.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../types/v1/types.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Request for any pre-offer configuration a client may need before it can build
/// an SDP offer.
class PrepareRequest extends $pb.GeneratedMessage {
  factory PrepareRequest({
    $0.SiteKey? siteKey,
  }) {
    final result = create();
    if (siteKey != null) result.siteKey = siteKey;
    return result;
  }

  PrepareRequest._();

  factory PrepareRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrepareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOM<$0.SiteKey>(1, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareRequest clone() => PrepareRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareRequest copyWith(void Function(PrepareRequest) updates) =>
      super.copyWith((message) => updates(message as PrepareRequest))
          as PrepareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrepareRequest create() => PrepareRequest._();
  @$core.override
  PrepareRequest createEmptyInstance() => create();
  static $pb.PbList<PrepareRequest> createRepeated() =>
      $pb.PbList<PrepareRequest>();
  @$core.pragma('dart2js:noInline')
  static PrepareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareRequest>(create);
  static PrepareRequest? _defaultInstance;

  /// Identifier of project this traffic will belong to.
  @$pb.TagNumber(1)
  $0.SiteKey get siteKey => $_getN(0);
  @$pb.TagNumber(1)
  set siteKey($0.SiteKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteKey() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SiteKey ensureSiteKey() => $_ensure(0);
}

/// Response carrying the pre-offer configuration for the ingest handshake.
class PrepareResponse extends $pb.GeneratedMessage {
  factory PrepareResponse({
    $core.Iterable<IceServer>? iceServers,
  }) {
    final result = create();
    if (iceServers != null) result.iceServers.addAll(iceServers);
    return result;
  }

  PrepareResponse._();

  factory PrepareResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrepareResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..pc<IceServer>(1, _omitFieldNames ? '' : 'iceServers', $pb.PbFieldType.PM,
        subBuilder: IceServer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareResponse clone() => PrepareResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareResponse copyWith(void Function(PrepareResponse) updates) =>
      super.copyWith((message) => updates(message as PrepareResponse))
          as PrepareResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrepareResponse create() => PrepareResponse._();
  @$core.override
  PrepareResponse createEmptyInstance() => create();
  static $pb.PbList<PrepareResponse> createRepeated() =>
      $pb.PbList<PrepareResponse>();
  @$core.pragma('dart2js:noInline')
  static PrepareResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareResponse>(create);
  static PrepareResponse? _defaultInstance;

  /// STUN/TURN servers the client should apply to its peer connection before
  /// gathering ICE candidates and building the SDP offer it sends to Establish.
  @$pb.TagNumber(1)
  $pb.PbList<IceServer> get iceServers => $_getList(0);
}

/// A STUN/TURN server the client configures for ICE, shaped like a WebRTC
/// RTCIceServer entry.
class IceServer extends $pb.GeneratedMessage {
  factory IceServer({
    $core.Iterable<$core.String>? urls,
    $core.String? username,
    $core.String? credential,
  }) {
    final result = create();
    if (urls != null) result.urls.addAll(urls);
    if (username != null) result.username = username;
    if (credential != null) result.credential = credential;
    return result;
  }

  IceServer._();

  factory IceServer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IceServer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IceServer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'urls')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'credential')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IceServer clone() => IceServer()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IceServer copyWith(void Function(IceServer) updates) =>
      super.copyWith((message) => updates(message as IceServer)) as IceServer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IceServer create() => IceServer._();
  @$core.override
  IceServer createEmptyInstance() => create();
  static $pb.PbList<IceServer> createRepeated() => $pb.PbList<IceServer>();
  @$core.pragma('dart2js:noInline')
  static IceServer getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IceServer>(create);
  static IceServer? _defaultInstance;

  /// One or more STUN/TURN URLs for this server (e.g. stun:, turn:, turns:).
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get urls => $_getList(0);

  /// Username for TURN authentication. Empty for STUN-only servers.
  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => $_clearField(2);

  /// Credential for TURN authentication. Empty for STUN-only servers.
  @$pb.TagNumber(3)
  $core.String get credential => $_getSZ(2);
  @$pb.TagNumber(3)
  set credential($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCredential() => $_has(2);
  @$pb.TagNumber(3)
  void clearCredential() => $_clearField(3);
}

/// Request to establish a connection to the tracing endpoint.
class EstablishRequest extends $pb.GeneratedMessage {
  factory EstablishRequest({
    $0.SiteKey? siteKey,
    SessionDescription? sdpOffer,
    $0.SessionId? sessionId,
    $0.SessionPublisherInfo? clientInfo,
  }) {
    final result = create();
    if (siteKey != null) result.siteKey = siteKey;
    if (sdpOffer != null) result.sdpOffer = sdpOffer;
    if (sessionId != null) result.sessionId = sessionId;
    if (clientInfo != null) result.clientInfo = clientInfo;
    return result;
  }

  EstablishRequest._();

  factory EstablishRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EstablishRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EstablishRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOM<$0.SiteKey>(1, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.create)
    ..aOM<SessionDescription>(2, _omitFieldNames ? '' : 'sdpOffer',
        subBuilder: SessionDescription.create)
    ..aOM<$0.SessionId>(3, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.create)
    ..aOM<$0.SessionPublisherInfo>(4, _omitFieldNames ? '' : 'clientInfo',
        subBuilder: $0.SessionPublisherInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstablishRequest clone() => EstablishRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstablishRequest copyWith(void Function(EstablishRequest) updates) =>
      super.copyWith((message) => updates(message as EstablishRequest))
          as EstablishRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EstablishRequest create() => EstablishRequest._();
  @$core.override
  EstablishRequest createEmptyInstance() => create();
  static $pb.PbList<EstablishRequest> createRepeated() =>
      $pb.PbList<EstablishRequest>();
  @$core.pragma('dart2js:noInline')
  static EstablishRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EstablishRequest>(create);
  static EstablishRequest? _defaultInstance;

  /// Identifier of project to receive this traffic.
  @$pb.TagNumber(1)
  $0.SiteKey get siteKey => $_getN(0);
  @$pb.TagNumber(1)
  set siteKey($0.SiteKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteKey() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SiteKey ensureSiteKey() => $_ensure(0);

  /// The client's WebRTC SDP offer.
  @$pb.TagNumber(2)
  SessionDescription get sdpOffer => $_getN(1);
  @$pb.TagNumber(2)
  set sdpOffer(SessionDescription value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSdpOffer() => $_has(1);
  @$pb.TagNumber(2)
  void clearSdpOffer() => $_clearField(2);
  @$pb.TagNumber(2)
  SessionDescription ensureSdpOffer() => $_ensure(1);

  /// The ingest session this offer should resume, if any.
  @$pb.TagNumber(3)
  $0.SessionId get sessionId => $_getN(2);
  @$pb.TagNumber(3)
  set sessionId($0.SessionId value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSessionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionId() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.SessionId ensureSessionId() => $_ensure(2);

  /// Any info available about the client initiating the session.
  @$pb.TagNumber(4)
  $0.SessionPublisherInfo get clientInfo => $_getN(3);
  @$pb.TagNumber(4)
  set clientInfo($0.SessionPublisherInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasClientInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearClientInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.SessionPublisherInfo ensureClientInfo() => $_ensure(3);
}

/// Response to a tracing establish request.
class EstablishResponse extends $pb.GeneratedMessage {
  factory EstablishResponse({
    IngestSession? session,
  }) {
    final result = create();
    if (session != null) result.session = session;
    return result;
  }

  EstablishResponse._();

  factory EstablishResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EstablishResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EstablishResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOM<IngestSession>(1, _omitFieldNames ? '' : 'session',
        subBuilder: IngestSession.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstablishResponse clone() => EstablishResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstablishResponse copyWith(void Function(EstablishResponse) updates) =>
      super.copyWith((message) => updates(message as EstablishResponse))
          as EstablishResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EstablishResponse create() => EstablishResponse._();
  @$core.override
  EstablishResponse createEmptyInstance() => create();
  static $pb.PbList<EstablishResponse> createRepeated() =>
      $pb.PbList<EstablishResponse>();
  @$core.pragma('dart2js:noInline')
  static EstablishResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EstablishResponse>(create);
  static EstablishResponse? _defaultInstance;

  /// The established ingest session.
  @$pb.TagNumber(1)
  IngestSession get session => $_getN(0);
  @$pb.TagNumber(1)
  set session(IngestSession value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);
  @$pb.TagNumber(1)
  IngestSession ensureSession() => $_ensure(0);
}

/// A WebRTC SDP, used for both offers and answers in the ingest handshake.
class SessionDescription extends $pb.GeneratedMessage {
  factory SessionDescription({
    $core.String? sdp,
  }) {
    final result = create();
    if (sdp != null) result.sdp = sdp;
    return result;
  }

  SessionDescription._();

  factory SessionDescription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SessionDescription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionDescription',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sdp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionDescription clone() => SessionDescription()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionDescription copyWith(void Function(SessionDescription) updates) =>
      super.copyWith((message) => updates(message as SessionDescription))
          as SessionDescription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionDescription create() => SessionDescription._();
  @$core.override
  SessionDescription createEmptyInstance() => create();
  static $pb.PbList<SessionDescription> createRepeated() =>
      $pb.PbList<SessionDescription>();
  @$core.pragma('dart2js:noInline')
  static SessionDescription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionDescription>(create);
  static SessionDescription? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sdp => $_getSZ(0);
  @$pb.TagNumber(1)
  set sdp($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSdp() => $_has(0);
  @$pb.TagNumber(1)
  void clearSdp() => $_clearField(1);
}

/// An established ingest session.
class IngestSession extends $pb.GeneratedMessage {
  factory IngestSession({
    SessionDescription? sdpAnswer,
    $0.SessionId? sessionId,
  }) {
    final result = create();
    if (sdpAnswer != null) result.sdpAnswer = sdpAnswer;
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  IngestSession._();

  factory IngestSession.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngestSession.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngestSession',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOM<SessionDescription>(1, _omitFieldNames ? '' : 'sdpAnswer',
        subBuilder: SessionDescription.create)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngestSession clone() => IngestSession()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngestSession copyWith(void Function(IngestSession) updates) =>
      super.copyWith((message) => updates(message as IngestSession))
          as IngestSession;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngestSession create() => IngestSession._();
  @$core.override
  IngestSession createEmptyInstance() => create();
  static $pb.PbList<IngestSession> createRepeated() =>
      $pb.PbList<IngestSession>();
  @$core.pragma('dart2js:noInline')
  static IngestSession getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngestSession>(create);
  static IngestSession? _defaultInstance;

  /// The SDP answer to apply as the remote description.
  @$pb.TagNumber(1)
  SessionDescription get sdpAnswer => $_getN(0);
  @$pb.TagNumber(1)
  set sdpAnswer(SessionDescription value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSdpAnswer() => $_has(0);
  @$pb.TagNumber(1)
  void clearSdpAnswer() => $_clearField(1);
  @$pb.TagNumber(1)
  SessionDescription ensureSdpAnswer() => $_ensure(0);

  /// Opaque id correlating this ingest session backend-side.
  @$pb.TagNumber(2)
  $0.SessionId get sessionId => $_getN(1);
  @$pb.TagNumber(2)
  set sessionId($0.SessionId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SessionId ensureSessionId() => $_ensure(1);
}

/// Request to begin recording a session whose media path is now connected.
class StartRecordingRequest extends $pb.GeneratedMessage {
  factory StartRecordingRequest({
    $0.SessionId? sessionId,
    $0.SiteKey? siteKey,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (siteKey != null) result.siteKey = siteKey;
    return result;
  }

  StartRecordingRequest._();

  factory StartRecordingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartRecordingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartRecordingRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOM<$0.SessionId>(1, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.create)
    ..aOM<$0.SiteKey>(2, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecordingRequest clone() =>
      StartRecordingRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecordingRequest copyWith(
          void Function(StartRecordingRequest) updates) =>
      super.copyWith((message) => updates(message as StartRecordingRequest))
          as StartRecordingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRecordingRequest create() => StartRecordingRequest._();
  @$core.override
  StartRecordingRequest createEmptyInstance() => create();
  static $pb.PbList<StartRecordingRequest> createRepeated() =>
      $pb.PbList<StartRecordingRequest>();
  @$core.pragma('dart2js:noInline')
  static StartRecordingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartRecordingRequest>(create);
  static StartRecordingRequest? _defaultInstance;

  /// The session_id returned in IngestSession.
  @$pb.TagNumber(1)
  $0.SessionId get sessionId => $_getN(0);
  @$pb.TagNumber(1)
  set sessionId($0.SessionId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SessionId ensureSessionId() => $_ensure(0);

  /// The site key the session was established with.
  @$pb.TagNumber(2)
  $0.SiteKey get siteKey => $_getN(1);
  @$pb.TagNumber(2)
  set siteKey($0.SiteKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSiteKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSiteKey() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SiteKey ensureSiteKey() => $_ensure(1);
}

/// Response to a start-recording request.
class StartRecordingResponse extends $pb.GeneratedMessage {
  factory StartRecordingResponse() => create();

  StartRecordingResponse._();

  factory StartRecordingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartRecordingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartRecordingResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecordingResponse clone() =>
      StartRecordingResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecordingResponse copyWith(
          void Function(StartRecordingResponse) updates) =>
      super.copyWith((message) => updates(message as StartRecordingResponse))
          as StartRecordingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRecordingResponse create() => StartRecordingResponse._();
  @$core.override
  StartRecordingResponse createEmptyInstance() => create();
  static $pb.PbList<StartRecordingResponse> createRepeated() =>
      $pb.PbList<StartRecordingResponse>();
  @$core.pragma('dart2js:noInline')
  static StartRecordingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartRecordingResponse>(create);
  static StartRecordingResponse? _defaultInstance;
}

/// Request to tear down a previously established session.
class CloseRequest extends $pb.GeneratedMessage {
  factory CloseRequest({
    $0.SessionId? sessionId,
    $0.SiteKey? siteKey,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (siteKey != null) result.siteKey = siteKey;
    return result;
  }

  CloseRequest._();

  factory CloseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CloseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CloseRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOM<$0.SessionId>(1, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.create)
    ..aOM<$0.SiteKey>(2, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseRequest clone() => CloseRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseRequest copyWith(void Function(CloseRequest) updates) =>
      super.copyWith((message) => updates(message as CloseRequest))
          as CloseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CloseRequest create() => CloseRequest._();
  @$core.override
  CloseRequest createEmptyInstance() => create();
  static $pb.PbList<CloseRequest> createRepeated() =>
      $pb.PbList<CloseRequest>();
  @$core.pragma('dart2js:noInline')
  static CloseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CloseRequest>(create);
  static CloseRequest? _defaultInstance;

  /// The session_id returned in IngestSession.
  @$pb.TagNumber(1)
  $0.SessionId get sessionId => $_getN(0);
  @$pb.TagNumber(1)
  set sessionId($0.SessionId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SessionId ensureSessionId() => $_ensure(0);

  /// The site key the session was established with.
  @$pb.TagNumber(2)
  $0.SiteKey get siteKey => $_getN(1);
  @$pb.TagNumber(2)
  set siteKey($0.SiteKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSiteKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSiteKey() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SiteKey ensureSiteKey() => $_ensure(1);
}

/// Response to a close request.
class CloseResponse extends $pb.GeneratedMessage {
  factory CloseResponse() => create();

  CloseResponse._();

  factory CloseResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CloseResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CloseResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseResponse clone() => CloseResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseResponse copyWith(void Function(CloseResponse) updates) =>
      super.copyWith((message) => updates(message as CloseResponse))
          as CloseResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CloseResponse create() => CloseResponse._();
  @$core.override
  CloseResponse createEmptyInstance() => create();
  static $pb.PbList<CloseResponse> createRepeated() =>
      $pb.PbList<CloseResponse>();
  @$core.pragma('dart2js:noInline')
  static CloseResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CloseResponse>(create);
  static CloseResponse? _defaultInstance;
}

/// Request to begin, or resume, an upload session.
class BeginUploadRequest extends $pb.GeneratedMessage {
  factory BeginUploadRequest({
    $0.SiteKey? siteKey,
    $0.SessionId? sessionId,
    $0.SessionPublisherInfo? clientInfo,
  }) {
    final result = create();
    if (siteKey != null) result.siteKey = siteKey;
    if (sessionId != null) result.sessionId = sessionId;
    if (clientInfo != null) result.clientInfo = clientInfo;
    return result;
  }

  BeginUploadRequest._();

  factory BeginUploadRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BeginUploadRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeginUploadRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOM<$0.SiteKey>(1, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.create)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.create)
    ..aOM<$0.SessionPublisherInfo>(3, _omitFieldNames ? '' : 'clientInfo',
        subBuilder: $0.SessionPublisherInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginUploadRequest clone() => BeginUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginUploadRequest copyWith(void Function(BeginUploadRequest) updates) =>
      super.copyWith((message) => updates(message as BeginUploadRequest))
          as BeginUploadRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeginUploadRequest create() => BeginUploadRequest._();
  @$core.override
  BeginUploadRequest createEmptyInstance() => create();
  static $pb.PbList<BeginUploadRequest> createRepeated() =>
      $pb.PbList<BeginUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static BeginUploadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BeginUploadRequest>(create);
  static BeginUploadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.SiteKey get siteKey => $_getN(0);
  @$pb.TagNumber(1)
  set siteKey($0.SiteKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteKey() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SiteKey ensureSiteKey() => $_ensure(0);

  /// The upload session to resume, if any.
  @$pb.TagNumber(2)
  $0.SessionId get sessionId => $_getN(1);
  @$pb.TagNumber(2)
  set sessionId($0.SessionId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SessionId ensureSessionId() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.SessionPublisherInfo get clientInfo => $_getN(2);
  @$pb.TagNumber(3)
  set clientInfo($0.SessionPublisherInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasClientInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.SessionPublisherInfo ensureClientInfo() => $_ensure(2);
}

/// Response to a begin-upload request.
class BeginUploadResponse extends $pb.GeneratedMessage {
  factory BeginUploadResponse({
    $0.SessionId? sessionId,
    $core.String? uploadUrl,
    SessionLimits? limits,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (uploadUrl != null) result.uploadUrl = uploadUrl;
    if (limits != null) result.limits = limits;
    return result;
  }

  BeginUploadResponse._();

  factory BeginUploadResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BeginUploadResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeginUploadResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOM<$0.SessionId>(1, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.create)
    ..aOS(2, _omitFieldNames ? '' : 'uploadUrl')
    ..aOM<SessionLimits>(3, _omitFieldNames ? '' : 'limits',
        subBuilder: SessionLimits.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginUploadResponse clone() => BeginUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginUploadResponse copyWith(void Function(BeginUploadResponse) updates) =>
      super.copyWith((message) => updates(message as BeginUploadResponse))
          as BeginUploadResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeginUploadResponse create() => BeginUploadResponse._();
  @$core.override
  BeginUploadResponse createEmptyInstance() => create();
  static $pb.PbList<BeginUploadResponse> createRepeated() =>
      $pb.PbList<BeginUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static BeginUploadResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BeginUploadResponse>(create);
  static BeginUploadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.SessionId get sessionId => $_getN(0);
  @$pb.TagNumber(1)
  set sessionId($0.SessionId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SessionId ensureSessionId() => $_ensure(0);

  /// WebSocket URL the client streams fragments to.
  @$pb.TagNumber(2)
  $core.String get uploadUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set uploadUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUploadUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUploadUrl() => $_clearField(2);

  /// The limits the session runs under, so the client knows its own deadline.
  @$pb.TagNumber(3)
  SessionLimits get limits => $_getN(2);
  @$pb.TagNumber(3)
  set limits(SessionLimits value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLimits() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimits() => $_clearField(3);
  @$pb.TagNumber(3)
  SessionLimits ensureLimits() => $_ensure(2);
}

/// Request to finalize an upload session whose socket is gone.
class FinishUploadRequest extends $pb.GeneratedMessage {
  factory FinishUploadRequest({
    $0.SessionId? sessionId,
    $0.SiteKey? siteKey,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (siteKey != null) result.siteKey = siteKey;
    return result;
  }

  FinishUploadRequest._();

  factory FinishUploadRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinishUploadRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinishUploadRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..aOM<$0.SessionId>(1, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.create)
    ..aOM<$0.SiteKey>(2, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishUploadRequest clone() => FinishUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishUploadRequest copyWith(void Function(FinishUploadRequest) updates) =>
      super.copyWith((message) => updates(message as FinishUploadRequest))
          as FinishUploadRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinishUploadRequest create() => FinishUploadRequest._();
  @$core.override
  FinishUploadRequest createEmptyInstance() => create();
  static $pb.PbList<FinishUploadRequest> createRepeated() =>
      $pb.PbList<FinishUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static FinishUploadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinishUploadRequest>(create);
  static FinishUploadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.SessionId get sessionId => $_getN(0);
  @$pb.TagNumber(1)
  set sessionId($0.SessionId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SessionId ensureSessionId() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.SiteKey get siteKey => $_getN(1);
  @$pb.TagNumber(2)
  set siteKey($0.SiteKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSiteKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSiteKey() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SiteKey ensureSiteKey() => $_ensure(1);
}

/// Response to a finish-upload request.
class FinishUploadResponse extends $pb.GeneratedMessage {
  factory FinishUploadResponse() => create();

  FinishUploadResponse._();

  factory FinishUploadResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinishUploadResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinishUploadResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishUploadResponse clone() =>
      FinishUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishUploadResponse copyWith(void Function(FinishUploadResponse) updates) =>
      super.copyWith((message) => updates(message as FinishUploadResponse))
          as FinishUploadResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinishUploadResponse create() => FinishUploadResponse._();
  @$core.override
  FinishUploadResponse createEmptyInstance() => create();
  static $pb.PbList<FinishUploadResponse> createRepeated() =>
      $pb.PbList<FinishUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static FinishUploadResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinishUploadResponse>(create);
  static FinishUploadResponse? _defaultInstance;
}

/// The limits a capture session runs under.
///
/// Resolved numbers only, not plan or tier names: the data plane enforces limits
/// and has no concept of plans, so pricing and packaging changes never reach it.
class SessionLimits extends $pb.GeneratedMessage {
  factory SessionLimits({
    $core.int? maxSessionSeconds,
    $core.int? idleTimeoutSeconds,
    $core.int? discardUnderSeconds,
  }) {
    final result = create();
    if (maxSessionSeconds != null) result.maxSessionSeconds = maxSessionSeconds;
    if (idleTimeoutSeconds != null)
      result.idleTimeoutSeconds = idleTimeoutSeconds;
    if (discardUnderSeconds != null)
      result.discardUnderSeconds = discardUnderSeconds;
    return result;
  }

  SessionLimits._();

  factory SessionLimits.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SessionLimits.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionLimits',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'maxSessionSeconds', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'idleTimeoutSeconds', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'discardUnderSeconds', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionLimits clone() => SessionLimits()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionLimits copyWith(void Function(SessionLimits) updates) =>
      super.copyWith((message) => updates(message as SessionLimits))
          as SessionLimits;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionLimits create() => SessionLimits._();
  @$core.override
  SessionLimits createEmptyInstance() => create();
  static $pb.PbList<SessionLimits> createRepeated() =>
      $pb.PbList<SessionLimits>();
  @$core.pragma('dart2js:noInline')
  static SessionLimits getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionLimits>(create);
  static SessionLimits? _defaultInstance;

  /// How long the session may record before it is finalized.
  ///
  /// 0 means unset, which resolves to the most restrictive system default, not
  /// "unlimited". A session with no deadline would never be guaranteed to
  /// finalize.
  @$pb.TagNumber(1)
  $core.int get maxSessionSeconds => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxSessionSeconds($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMaxSessionSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxSessionSeconds() => $_clearField(1);

  /// How long the session may go without media before it is finalized. 0 means
  /// unset, resolving to the system default as above.
  @$pb.TagNumber(2)
  $core.int get idleTimeoutSeconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set idleTimeoutSeconds($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdleTimeoutSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdleTimeoutSeconds() => $_clearField(2);

  /// Recordings whose captured duration ends up shorter than this are
  /// discarded at finalize instead of being kept. 0 means no minimum.
  @$pb.TagNumber(3)
  $core.int get discardUnderSeconds => $_getIZ(2);
  @$pb.TagNumber(3)
  set discardUnderSeconds($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDiscardUnderSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiscardUnderSeconds() => $_clearField(3);
}

/// Provides the public interface related to ingestion sessions.
///
/// The ingest handshake is three steps: Prepare (pre-offer config), Establish
/// (exchange SDP and provision the session), then StartRecording once the
/// client's media path is connected. Close stops the recording and closes the
/// connection.
class SessionServiceApi {
  final $pb.RpcClient _client;

  SessionServiceApi(this._client);

  $async.Future<PrepareResponse> prepare(
          $pb.ClientContext? ctx, PrepareRequest request) =>
      _client.invoke<PrepareResponse>(
          ctx, 'SessionService', 'Prepare', request, PrepareResponse());
  $async.Future<EstablishResponse> establish(
          $pb.ClientContext? ctx, EstablishRequest request) =>
      _client.invoke<EstablishResponse>(
          ctx, 'SessionService', 'Establish', request, EstablishResponse());
  $async.Future<StartRecordingResponse> startRecording(
          $pb.ClientContext? ctx, StartRecordingRequest request) =>
      _client.invoke<StartRecordingResponse>(ctx, 'SessionService',
          'StartRecording', request, StartRecordingResponse());
  $async.Future<CloseResponse> close(
          $pb.ClientContext? ctx, CloseRequest request) =>
      _client.invoke<CloseResponse>(
          ctx, 'SessionService', 'Close', request, CloseResponse());

  /// The WebCodecs upload path: BeginUpload authorizes and provisions a session,
  /// the client then streams fragments over the returned upload URL.
  $async.Future<BeginUploadResponse> beginUpload(
          $pb.ClientContext? ctx, BeginUploadRequest request) =>
      _client.invoke<BeginUploadResponse>(
          ctx, 'SessionService', 'BeginUpload', request, BeginUploadResponse());
  $async.Future<FinishUploadResponse> finishUpload(
          $pb.ClientContext? ctx, FinishUploadRequest request) =>
      _client.invoke<FinishUploadResponse>(ctx, 'SessionService',
          'FinishUpload', request, FinishUploadResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
