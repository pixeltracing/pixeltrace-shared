// This is a generated file - do not edit.
//
// Generated from pixeltrace/types/v1/types.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// The public key that identifies a destination for session traffic.
class SiteKey extends $pb.GeneratedMessage {
  factory SiteKey({
    $core.String? key,
  }) {
    final result = SiteKey._();
    if (key != null) result.key = key;
    return result;
  }

  SiteKey._();

  factory SiteKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SiteKey()..mergeFromBuffer(data, registry);
  factory SiteKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SiteKey()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SiteKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: SiteKey.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SiteKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SiteKey copyWith(void Function(SiteKey) updates) =>
      super.copyWith((message) => updates(message as SiteKey)) as SiteKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use SiteKey() / SiteKey.new instead')
  static SiteKey create() => SiteKey._();
  static $pb.GeneratedMessage $_createMessage() => SiteKey._();
  @$core.override
  SiteKey createEmptyInstance() => SiteKey._();
  @$core.pragma('dart2js:noInline')
  static SiteKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SiteKey>(SiteKey.$_createMessage);
  static SiteKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
}

/// An opaque identifier for an ingest session: 'sess_*'
class SessionId extends $pb.GeneratedMessage {
  factory SessionId({
    $core.String? id,
  }) {
    final result = SessionId._();
    if (id != null) result.id = id;
    return result;
  }

  SessionId._();

  factory SessionId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SessionId()..mergeFromBuffer(data, registry);
  factory SessionId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SessionId()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: SessionId.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionId copyWith(void Function(SessionId) updates) =>
      super.copyWith((message) => updates(message as SessionId)) as SessionId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use SessionId() / SessionId.new instead')
  static SessionId create() => SessionId._();
  static $pb.GeneratedMessage $_createMessage() => SessionId._();
  @$core.override
  SessionId createEmptyInstance() => SessionId._();
  @$core.pragma('dart2js:noInline')
  static SessionId getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionId>(SessionId.$_createMessage);
  static SessionId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

/// The secret that authorizes calls naming an existing ingest session.
class SessionToken extends $pb.GeneratedMessage {
  factory SessionToken({
    $core.String? token,
  }) {
    final result = SessionToken._();
    if (token != null) result.token = token;
    return result;
  }

  SessionToken._();

  factory SessionToken.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SessionToken()..mergeFromBuffer(data, registry);
  factory SessionToken.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SessionToken()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionToken',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: SessionToken.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionToken clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionToken copyWith(void Function(SessionToken) updates) =>
      super.copyWith((message) => updates(message as SessionToken))
          as SessionToken;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use SessionToken() / SessionToken.new instead')
  static SessionToken create() => SessionToken._();
  static $pb.GeneratedMessage $_createMessage() => SessionToken._();
  @$core.override
  SessionToken createEmptyInstance() => SessionToken._();
  @$core.pragma('dart2js:noInline')
  static SessionToken getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionToken>(
          SessionToken.$_createMessage);
  static SessionToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);
}

/// An opaque identifier for a user: 'user_*'
class UserId extends $pb.GeneratedMessage {
  factory UserId({
    $core.String? id,
  }) {
    final result = UserId._();
    if (id != null) result.id = id;
    return result;
  }

  UserId._();

  factory UserId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UserId()..mergeFromBuffer(data, registry);
  factory UserId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UserId()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: UserId.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserId copyWith(void Function(UserId) updates) =>
      super.copyWith((message) => updates(message as UserId)) as UserId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use UserId() / UserId.new instead')
  static UserId create() => UserId._();
  static $pb.GeneratedMessage $_createMessage() => UserId._();
  @$core.override
  UserId createEmptyInstance() => UserId._();
  @$core.pragma('dart2js:noInline')
  static UserId getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserId>(UserId.$_createMessage);
  static UserId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

/// An opaque identifier for a project: 'proj_*'
class ProjectId extends $pb.GeneratedMessage {
  factory ProjectId({
    $core.String? id,
  }) {
    final result = ProjectId._();
    if (id != null) result.id = id;
    return result;
  }

  ProjectId._();

  factory ProjectId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ProjectId()..mergeFromBuffer(data, registry);
  factory ProjectId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ProjectId()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: ProjectId.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectId copyWith(void Function(ProjectId) updates) =>
      super.copyWith((message) => updates(message as ProjectId)) as ProjectId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ProjectId() / ProjectId.new instead')
  static ProjectId create() => ProjectId._();
  static $pb.GeneratedMessage $_createMessage() => ProjectId._();
  @$core.override
  ProjectId createEmptyInstance() => ProjectId._();
  @$core.pragma('dart2js:noInline')
  static ProjectId getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectId>(ProjectId.$_createMessage);
  static ProjectId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

/// An opaque identifier for a project's tag definition: 'tag_*'
class ProjectTagId extends $pb.GeneratedMessage {
  factory ProjectTagId({
    $core.String? id,
  }) {
    final result = ProjectTagId._();
    if (id != null) result.id = id;
    return result;
  }

  ProjectTagId._();

  factory ProjectTagId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ProjectTagId()..mergeFromBuffer(data, registry);
  factory ProjectTagId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ProjectTagId()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectTagId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: ProjectTagId.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectTagId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectTagId copyWith(void Function(ProjectTagId) updates) =>
      super.copyWith((message) => updates(message as ProjectTagId))
          as ProjectTagId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ProjectTagId() / ProjectTagId.new instead')
  static ProjectTagId create() => ProjectTagId._();
  static $pb.GeneratedMessage $_createMessage() => ProjectTagId._();
  @$core.override
  ProjectTagId createEmptyInstance() => ProjectTagId._();
  @$core.pragma('dart2js:noInline')
  static ProjectTagId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectTagId>(
          ProjectTagId.$_createMessage);
  static ProjectTagId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

/// An opaque identifier for an organization: 'org_*'
class OrganizationId extends $pb.GeneratedMessage {
  factory OrganizationId({
    $core.String? id,
  }) {
    final result = OrganizationId._();
    if (id != null) result.id = id;
    return result;
  }

  OrganizationId._();

  factory OrganizationId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      OrganizationId()..mergeFromBuffer(data, registry);
  factory OrganizationId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      OrganizationId()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrganizationId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: OrganizationId.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrganizationId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrganizationId copyWith(void Function(OrganizationId) updates) =>
      super.copyWith((message) => updates(message as OrganizationId))
          as OrganizationId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use OrganizationId() / OrganizationId.new instead')
  static OrganizationId create() => OrganizationId._();
  static $pb.GeneratedMessage $_createMessage() => OrganizationId._();
  @$core.override
  OrganizationId createEmptyInstance() => OrganizationId._();
  @$core.pragma('dart2js:noInline')
  static OrganizationId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrganizationId>(
          OrganizationId.$_createMessage);
  static OrganizationId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

/// Attributes of a session's publishing client, as reported by the client
/// itself.
class SessionPublisherInfo extends $pb.GeneratedMessage {
  factory SessionPublisherInfo({
    $core.String? referrer,
  }) {
    final result = SessionPublisherInfo._();
    if (referrer != null) result.referrer = referrer;
    return result;
  }

  SessionPublisherInfo._();

  factory SessionPublisherInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SessionPublisherInfo()..mergeFromBuffer(data, registry);
  factory SessionPublisherInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SessionPublisherInfo()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionPublisherInfo',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: SessionPublisherInfo.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'referrer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionPublisherInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionPublisherInfo copyWith(void Function(SessionPublisherInfo) updates) =>
      super.copyWith((message) => updates(message as SessionPublisherInfo))
          as SessionPublisherInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use SessionPublisherInfo() / SessionPublisherInfo.new instead')
  static SessionPublisherInfo create() => SessionPublisherInfo._();
  static $pb.GeneratedMessage $_createMessage() => SessionPublisherInfo._();
  @$core.override
  SessionPublisherInfo createEmptyInstance() => SessionPublisherInfo._();
  @$core.pragma('dart2js:noInline')
  static SessionPublisherInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionPublisherInfo>(
          SessionPublisherInfo.$_createMessage);
  static SessionPublisherInfo? _defaultInstance;

  /// The document.referrer value at session start.
  @$pb.TagNumber(1)
  $core.String get referrer => $_getSZ(0);
  @$pb.TagNumber(1)
  set referrer($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReferrer() => $_has(0);
  @$pb.TagNumber(1)
  void clearReferrer() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
