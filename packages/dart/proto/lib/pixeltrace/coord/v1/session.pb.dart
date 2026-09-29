// This is a generated file - do not edit.
//
// Generated from pixeltrace/coord/v1/session.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

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
    final result = PrepareRequest._();
    if (siteKey != null) result.siteKey = siteKey;
    return result;
  }

  PrepareRequest._();

  factory PrepareRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      PrepareRequest()..mergeFromBuffer(data, registry);
  factory PrepareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      PrepareRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: PrepareRequest.$_createMessage)
    ..aOM<$0.SiteKey>(1, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareRequest copyWith(void Function(PrepareRequest) updates) =>
      super.copyWith((message) => updates(message as PrepareRequest))
          as PrepareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use PrepareRequest() / PrepareRequest.new instead')
  static PrepareRequest create() => PrepareRequest._();
  static $pb.GeneratedMessage $_createMessage() => PrepareRequest._();
  @$core.override
  PrepareRequest createEmptyInstance() => PrepareRequest._();
  @$core.pragma('dart2js:noInline')
  static PrepareRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrepareRequest>(
          PrepareRequest.$_createMessage);
  static PrepareRequest? _defaultInstance;

  /// Site key of the project this traffic belongs to.
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
    final result = PrepareResponse._();
    if (iceServers != null) result.iceServers.addAll(iceServers);
    return result;
  }

  PrepareResponse._();

  factory PrepareResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      PrepareResponse()..mergeFromBuffer(data, registry);
  factory PrepareResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      PrepareResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: PrepareResponse.$_createMessage)
    ..pPM<IceServer>(1, _omitFieldNames ? '' : 'iceServers',
        subBuilder: IceServer.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareResponse copyWith(void Function(PrepareResponse) updates) =>
      super.copyWith((message) => updates(message as PrepareResponse))
          as PrepareResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use PrepareResponse() / PrepareResponse.new instead')
  static PrepareResponse create() => PrepareResponse._();
  static $pb.GeneratedMessage $_createMessage() => PrepareResponse._();
  @$core.override
  PrepareResponse createEmptyInstance() => PrepareResponse._();
  @$core.pragma('dart2js:noInline')
  static PrepareResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrepareResponse>(
          PrepareResponse.$_createMessage);
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
    final result = IceServer._();
    if (urls != null) result.urls.addAll(urls);
    if (username != null) result.username = username;
    if (credential != null) result.credential = credential;
    return result;
  }

  IceServer._();

  factory IceServer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      IceServer()..mergeFromBuffer(data, registry);
  factory IceServer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      IceServer()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IceServer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: IceServer.$_createMessage)
    ..pPS(1, _omitFieldNames ? '' : 'urls')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'credential')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IceServer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IceServer copyWith(void Function(IceServer) updates) =>
      super.copyWith((message) => updates(message as IceServer)) as IceServer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use IceServer() / IceServer.new instead')
  static IceServer create() => IceServer._();
  static $pb.GeneratedMessage $_createMessage() => IceServer._();
  @$core.override
  IceServer createEmptyInstance() => IceServer._();
  @$core.pragma('dart2js:noInline')
  static IceServer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IceServer>(IceServer.$_createMessage);
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

/// Request to establish an ingest session.
class EstablishRequest extends $pb.GeneratedMessage {
  factory EstablishRequest({
    $0.SiteKey? siteKey,
    SessionDescription? sdpOffer,
    $0.SessionId? sessionId,
    $0.SessionPublisherInfo? clientInfo,
    $0.SessionToken? sessionToken,
  }) {
    final result = EstablishRequest._();
    if (siteKey != null) result.siteKey = siteKey;
    if (sdpOffer != null) result.sdpOffer = sdpOffer;
    if (sessionId != null) result.sessionId = sessionId;
    if (clientInfo != null) result.clientInfo = clientInfo;
    if (sessionToken != null) result.sessionToken = sessionToken;
    return result;
  }

  EstablishRequest._();

  factory EstablishRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      EstablishRequest()..mergeFromBuffer(data, registry);
  factory EstablishRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      EstablishRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EstablishRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: EstablishRequest.$_createMessage)
    ..aOM<$0.SiteKey>(1, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.$_createMessage)
    ..aOM<SessionDescription>(2, _omitFieldNames ? '' : 'sdpOffer',
        subBuilder: SessionDescription.$_createMessage)
    ..aOM<$0.SessionId>(3, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.$_createMessage)
    ..aOM<$0.SessionPublisherInfo>(4, _omitFieldNames ? '' : 'clientInfo',
        subBuilder: $0.SessionPublisherInfo.$_createMessage)
    ..aOM<$0.SessionToken>(5, _omitFieldNames ? '' : 'sessionToken',
        subBuilder: $0.SessionToken.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstablishRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstablishRequest copyWith(void Function(EstablishRequest) updates) =>
      super.copyWith((message) => updates(message as EstablishRequest))
          as EstablishRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use EstablishRequest() / EstablishRequest.new instead')
  static EstablishRequest create() => EstablishRequest._();
  static $pb.GeneratedMessage $_createMessage() => EstablishRequest._();
  @$core.override
  EstablishRequest createEmptyInstance() => EstablishRequest._();
  @$core.pragma('dart2js:noInline')
  static EstablishRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EstablishRequest>(
          EstablishRequest.$_createMessage);
  static EstablishRequest? _defaultInstance;

  /// Site key of the project this traffic belongs to.
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

  /// The session_token returned with session_id. Required when resuming.
  @$pb.TagNumber(5)
  $0.SessionToken get sessionToken => $_getN(4);
  @$pb.TagNumber(5)
  set sessionToken($0.SessionToken value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSessionToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearSessionToken() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.SessionToken ensureSessionToken() => $_ensure(4);
}

/// Response to an establish request.
class EstablishResponse extends $pb.GeneratedMessage {
  factory EstablishResponse({
    IngestSession? session,
  }) {
    final result = EstablishResponse._();
    if (session != null) result.session = session;
    return result;
  }

  EstablishResponse._();

  factory EstablishResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      EstablishResponse()..mergeFromBuffer(data, registry);
  factory EstablishResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      EstablishResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EstablishResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: EstablishResponse.$_createMessage)
    ..aOM<IngestSession>(1, _omitFieldNames ? '' : 'session',
        subBuilder: IngestSession.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstablishResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EstablishResponse copyWith(void Function(EstablishResponse) updates) =>
      super.copyWith((message) => updates(message as EstablishResponse))
          as EstablishResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use EstablishResponse() / EstablishResponse.new instead')
  static EstablishResponse create() => EstablishResponse._();
  static $pb.GeneratedMessage $_createMessage() => EstablishResponse._();
  @$core.override
  EstablishResponse createEmptyInstance() => EstablishResponse._();
  @$core.pragma('dart2js:noInline')
  static EstablishResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EstablishResponse>(
          EstablishResponse.$_createMessage);
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
    final result = SessionDescription._();
    if (sdp != null) result.sdp = sdp;
    return result;
  }

  SessionDescription._();

  factory SessionDescription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SessionDescription()..mergeFromBuffer(data, registry);
  factory SessionDescription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SessionDescription()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionDescription',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: SessionDescription.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'sdp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionDescription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionDescription copyWith(void Function(SessionDescription) updates) =>
      super.copyWith((message) => updates(message as SessionDescription))
          as SessionDescription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use SessionDescription() / SessionDescription.new instead')
  static SessionDescription create() => SessionDescription._();
  static $pb.GeneratedMessage $_createMessage() => SessionDescription._();
  @$core.override
  SessionDescription createEmptyInstance() => SessionDescription._();
  @$core.pragma('dart2js:noInline')
  static SessionDescription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionDescription>(
          SessionDescription.$_createMessage);
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
    $0.SessionToken? sessionToken,
  }) {
    final result = IngestSession._();
    if (sdpAnswer != null) result.sdpAnswer = sdpAnswer;
    if (sessionId != null) result.sessionId = sessionId;
    if (sessionToken != null) result.sessionToken = sessionToken;
    return result;
  }

  IngestSession._();

  factory IngestSession.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      IngestSession()..mergeFromBuffer(data, registry);
  factory IngestSession.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      IngestSession()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngestSession',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: IngestSession.$_createMessage)
    ..aOM<SessionDescription>(1, _omitFieldNames ? '' : 'sdpAnswer',
        subBuilder: SessionDescription.$_createMessage)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.$_createMessage)
    ..aOM<$0.SessionToken>(3, _omitFieldNames ? '' : 'sessionToken',
        subBuilder: $0.SessionToken.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngestSession clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngestSession copyWith(void Function(IngestSession) updates) =>
      super.copyWith((message) => updates(message as IngestSession))
          as IngestSession;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use IngestSession() / IngestSession.new instead')
  static IngestSession create() => IngestSession._();
  static $pb.GeneratedMessage $_createMessage() => IngestSession._();
  @$core.override
  IngestSession createEmptyInstance() => IngestSession._();
  @$core.pragma('dart2js:noInline')
  static IngestSession getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IngestSession>(
          IngestSession.$_createMessage);
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

  /// Required on every later call naming session_id.
  @$pb.TagNumber(3)
  $0.SessionToken get sessionToken => $_getN(2);
  @$pb.TagNumber(3)
  set sessionToken($0.SessionToken value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSessionToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionToken() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.SessionToken ensureSessionToken() => $_ensure(2);
}

/// Request to begin recording a session whose media path is now connected.
class StartRecordingRequest extends $pb.GeneratedMessage {
  factory StartRecordingRequest({
    $0.SessionId? sessionId,
    $0.SiteKey? siteKey,
    $0.SessionToken? sessionToken,
  }) {
    final result = StartRecordingRequest._();
    if (sessionId != null) result.sessionId = sessionId;
    if (siteKey != null) result.siteKey = siteKey;
    if (sessionToken != null) result.sessionToken = sessionToken;
    return result;
  }

  StartRecordingRequest._();

  factory StartRecordingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StartRecordingRequest()..mergeFromBuffer(data, registry);
  factory StartRecordingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StartRecordingRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartRecordingRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: StartRecordingRequest.$_createMessage)
    ..aOM<$0.SessionId>(1, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.$_createMessage)
    ..aOM<$0.SiteKey>(2, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.$_createMessage)
    ..aOM<$0.SessionToken>(3, _omitFieldNames ? '' : 'sessionToken',
        subBuilder: $0.SessionToken.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecordingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecordingRequest copyWith(
          void Function(StartRecordingRequest) updates) =>
      super.copyWith((message) => updates(message as StartRecordingRequest))
          as StartRecordingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use StartRecordingRequest() / StartRecordingRequest.new instead')
  static StartRecordingRequest create() => StartRecordingRequest._();
  static $pb.GeneratedMessage $_createMessage() => StartRecordingRequest._();
  @$core.override
  StartRecordingRequest createEmptyInstance() => StartRecordingRequest._();
  @$core.pragma('dart2js:noInline')
  static StartRecordingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartRecordingRequest>(
          StartRecordingRequest.$_createMessage);
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

  /// The session_token returned in IngestSession.
  @$pb.TagNumber(3)
  $0.SessionToken get sessionToken => $_getN(2);
  @$pb.TagNumber(3)
  set sessionToken($0.SessionToken value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSessionToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionToken() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.SessionToken ensureSessionToken() => $_ensure(2);
}

/// Response to a start-recording request.
class StartRecordingResponse extends $pb.GeneratedMessage {
  factory StartRecordingResponse() => StartRecordingResponse._();

  StartRecordingResponse._();

  factory StartRecordingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StartRecordingResponse()..mergeFromBuffer(data, registry);
  factory StartRecordingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StartRecordingResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartRecordingResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: StartRecordingResponse.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecordingResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRecordingResponse copyWith(
          void Function(StartRecordingResponse) updates) =>
      super.copyWith((message) => updates(message as StartRecordingResponse))
          as StartRecordingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use StartRecordingResponse() / StartRecordingResponse.new instead')
  static StartRecordingResponse create() => StartRecordingResponse._();
  static $pb.GeneratedMessage $_createMessage() => StartRecordingResponse._();
  @$core.override
  StartRecordingResponse createEmptyInstance() => StartRecordingResponse._();
  @$core.pragma('dart2js:noInline')
  static StartRecordingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartRecordingResponse>(
          StartRecordingResponse.$_createMessage);
  static StartRecordingResponse? _defaultInstance;
}

/// Request to tear down a previously established session.
class CloseRequest extends $pb.GeneratedMessage {
  factory CloseRequest({
    $0.SessionId? sessionId,
    $0.SiteKey? siteKey,
    $0.SessionToken? sessionToken,
  }) {
    final result = CloseRequest._();
    if (sessionId != null) result.sessionId = sessionId;
    if (siteKey != null) result.siteKey = siteKey;
    if (sessionToken != null) result.sessionToken = sessionToken;
    return result;
  }

  CloseRequest._();

  factory CloseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CloseRequest()..mergeFromBuffer(data, registry);
  factory CloseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CloseRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CloseRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: CloseRequest.$_createMessage)
    ..aOM<$0.SessionId>(1, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.$_createMessage)
    ..aOM<$0.SiteKey>(2, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.$_createMessage)
    ..aOM<$0.SessionToken>(3, _omitFieldNames ? '' : 'sessionToken',
        subBuilder: $0.SessionToken.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseRequest copyWith(void Function(CloseRequest) updates) =>
      super.copyWith((message) => updates(message as CloseRequest))
          as CloseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use CloseRequest() / CloseRequest.new instead')
  static CloseRequest create() => CloseRequest._();
  static $pb.GeneratedMessage $_createMessage() => CloseRequest._();
  @$core.override
  CloseRequest createEmptyInstance() => CloseRequest._();
  @$core.pragma('dart2js:noInline')
  static CloseRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloseRequest>(
          CloseRequest.$_createMessage);
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

  /// The session_token returned in IngestSession.
  @$pb.TagNumber(3)
  $0.SessionToken get sessionToken => $_getN(2);
  @$pb.TagNumber(3)
  set sessionToken($0.SessionToken value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSessionToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionToken() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.SessionToken ensureSessionToken() => $_ensure(2);
}

/// Response to a close request.
class CloseResponse extends $pb.GeneratedMessage {
  factory CloseResponse() => CloseResponse._();

  CloseResponse._();

  factory CloseResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CloseResponse()..mergeFromBuffer(data, registry);
  factory CloseResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CloseResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CloseResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: CloseResponse.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseResponse copyWith(void Function(CloseResponse) updates) =>
      super.copyWith((message) => updates(message as CloseResponse))
          as CloseResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use CloseResponse() / CloseResponse.new instead')
  static CloseResponse create() => CloseResponse._();
  static $pb.GeneratedMessage $_createMessage() => CloseResponse._();
  @$core.override
  CloseResponse createEmptyInstance() => CloseResponse._();
  @$core.pragma('dart2js:noInline')
  static CloseResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloseResponse>(
          CloseResponse.$_createMessage);
  static CloseResponse? _defaultInstance;
}

/// Request to begin, or resume, an upload session.
class BeginUploadRequest extends $pb.GeneratedMessage {
  factory BeginUploadRequest({
    $0.SiteKey? siteKey,
    $0.SessionId? sessionId,
    $0.SessionPublisherInfo? clientInfo,
  }) {
    final result = BeginUploadRequest._();
    if (siteKey != null) result.siteKey = siteKey;
    if (sessionId != null) result.sessionId = sessionId;
    if (clientInfo != null) result.clientInfo = clientInfo;
    return result;
  }

  BeginUploadRequest._();

  factory BeginUploadRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      BeginUploadRequest()..mergeFromBuffer(data, registry);
  factory BeginUploadRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      BeginUploadRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeginUploadRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: BeginUploadRequest.$_createMessage)
    ..aOM<$0.SiteKey>(1, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.$_createMessage)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.$_createMessage)
    ..aOM<$0.SessionPublisherInfo>(3, _omitFieldNames ? '' : 'clientInfo',
        subBuilder: $0.SessionPublisherInfo.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginUploadRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginUploadRequest copyWith(void Function(BeginUploadRequest) updates) =>
      super.copyWith((message) => updates(message as BeginUploadRequest))
          as BeginUploadRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use BeginUploadRequest() / BeginUploadRequest.new instead')
  static BeginUploadRequest create() => BeginUploadRequest._();
  static $pb.GeneratedMessage $_createMessage() => BeginUploadRequest._();
  @$core.override
  BeginUploadRequest createEmptyInstance() => BeginUploadRequest._();
  @$core.pragma('dart2js:noInline')
  static BeginUploadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BeginUploadRequest>(
          BeginUploadRequest.$_createMessage);
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
    final result = BeginUploadResponse._();
    if (sessionId != null) result.sessionId = sessionId;
    if (uploadUrl != null) result.uploadUrl = uploadUrl;
    if (limits != null) result.limits = limits;
    return result;
  }

  BeginUploadResponse._();

  factory BeginUploadResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      BeginUploadResponse()..mergeFromBuffer(data, registry);
  factory BeginUploadResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      BeginUploadResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeginUploadResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: BeginUploadResponse.$_createMessage)
    ..aOM<$0.SessionId>(1, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.$_createMessage)
    ..aOS(2, _omitFieldNames ? '' : 'uploadUrl')
    ..aOM<SessionLimits>(3, _omitFieldNames ? '' : 'limits',
        subBuilder: SessionLimits.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginUploadResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginUploadResponse copyWith(void Function(BeginUploadResponse) updates) =>
      super.copyWith((message) => updates(message as BeginUploadResponse))
          as BeginUploadResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use BeginUploadResponse() / BeginUploadResponse.new instead')
  static BeginUploadResponse create() => BeginUploadResponse._();
  static $pb.GeneratedMessage $_createMessage() => BeginUploadResponse._();
  @$core.override
  BeginUploadResponse createEmptyInstance() => BeginUploadResponse._();
  @$core.pragma('dart2js:noInline')
  static BeginUploadResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BeginUploadResponse>(
          BeginUploadResponse.$_createMessage);
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
    final result = FinishUploadRequest._();
    if (sessionId != null) result.sessionId = sessionId;
    if (siteKey != null) result.siteKey = siteKey;
    return result;
  }

  FinishUploadRequest._();

  factory FinishUploadRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      FinishUploadRequest()..mergeFromBuffer(data, registry);
  factory FinishUploadRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      FinishUploadRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinishUploadRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: FinishUploadRequest.$_createMessage)
    ..aOM<$0.SessionId>(1, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.$_createMessage)
    ..aOM<$0.SiteKey>(2, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishUploadRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishUploadRequest copyWith(void Function(FinishUploadRequest) updates) =>
      super.copyWith((message) => updates(message as FinishUploadRequest))
          as FinishUploadRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use FinishUploadRequest() / FinishUploadRequest.new instead')
  static FinishUploadRequest create() => FinishUploadRequest._();
  static $pb.GeneratedMessage $_createMessage() => FinishUploadRequest._();
  @$core.override
  FinishUploadRequest createEmptyInstance() => FinishUploadRequest._();
  @$core.pragma('dart2js:noInline')
  static FinishUploadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinishUploadRequest>(
          FinishUploadRequest.$_createMessage);
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
  factory FinishUploadResponse() => FinishUploadResponse._();

  FinishUploadResponse._();

  factory FinishUploadResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      FinishUploadResponse()..mergeFromBuffer(data, registry);
  factory FinishUploadResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      FinishUploadResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinishUploadResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: FinishUploadResponse.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishUploadResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinishUploadResponse copyWith(void Function(FinishUploadResponse) updates) =>
      super.copyWith((message) => updates(message as FinishUploadResponse))
          as FinishUploadResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use FinishUploadResponse() / FinishUploadResponse.new instead')
  static FinishUploadResponse create() => FinishUploadResponse._();
  static $pb.GeneratedMessage $_createMessage() => FinishUploadResponse._();
  @$core.override
  FinishUploadResponse createEmptyInstance() => FinishUploadResponse._();
  @$core.pragma('dart2js:noInline')
  static FinishUploadResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinishUploadResponse>(
          FinishUploadResponse.$_createMessage);
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
    final result = SessionLimits._();
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
      SessionLimits()..mergeFromBuffer(data, registry);
  factory SessionLimits.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SessionLimits()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionLimits',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: SessionLimits.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'maxSessionSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'idleTimeoutSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'discardUnderSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionLimits clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionLimits copyWith(void Function(SessionLimits) updates) =>
      super.copyWith((message) => updates(message as SessionLimits))
          as SessionLimits;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use SessionLimits() / SessionLimits.new instead')
  static SessionLimits create() => SessionLimits._();
  static $pb.GeneratedMessage $_createMessage() => SessionLimits._();
  @$core.override
  SessionLimits createEmptyInstance() => SessionLimits._();
  @$core.pragma('dart2js:noInline')
  static SessionLimits getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionLimits>(
          SessionLimits.$_createMessage);
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

  /// The WebCodecs upload path: BeginUpload authorizes and provisions a session;
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
