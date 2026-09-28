// This is a generated file - do not edit.
//
// Generated from pixeltrace/types/v1/types.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// The public key that identifies a destination for session traffic.
class SiteKey extends $pb.GeneratedMessage {
  factory SiteKey({
    $core.String? key,
  }) {
    final result = create();
    if (key != null) result.key = key;
    return result;
  }

  SiteKey._();

  factory SiteKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SiteKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SiteKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SiteKey clone() => SiteKey()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SiteKey copyWith(void Function(SiteKey) updates) =>
      super.copyWith((message) => updates(message as SiteKey)) as SiteKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SiteKey create() => SiteKey._();
  @$core.override
  SiteKey createEmptyInstance() => create();
  static $pb.PbList<SiteKey> createRepeated() => $pb.PbList<SiteKey>();
  @$core.pragma('dart2js:noInline')
  static SiteKey getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SiteKey>(create);
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
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  SessionId._();

  factory SessionId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SessionId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionId clone() => SessionId()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionId copyWith(void Function(SessionId) updates) =>
      super.copyWith((message) => updates(message as SessionId)) as SessionId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionId create() => SessionId._();
  @$core.override
  SessionId createEmptyInstance() => create();
  static $pb.PbList<SessionId> createRepeated() => $pb.PbList<SessionId>();
  @$core.pragma('dart2js:noInline')
  static SessionId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionId>(create);
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

/// An opaque identifier for a user: 'user_*'
class UserId extends $pb.GeneratedMessage {
  factory UserId({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  UserId._();

  factory UserId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserId clone() => UserId()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserId copyWith(void Function(UserId) updates) =>
      super.copyWith((message) => updates(message as UserId)) as UserId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserId create() => UserId._();
  @$core.override
  UserId createEmptyInstance() => create();
  static $pb.PbList<UserId> createRepeated() => $pb.PbList<UserId>();
  @$core.pragma('dart2js:noInline')
  static UserId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserId>(create);
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
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  ProjectId._();

  factory ProjectId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectId clone() => ProjectId()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectId copyWith(void Function(ProjectId) updates) =>
      super.copyWith((message) => updates(message as ProjectId)) as ProjectId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectId create() => ProjectId._();
  @$core.override
  ProjectId createEmptyInstance() => create();
  static $pb.PbList<ProjectId> createRepeated() => $pb.PbList<ProjectId>();
  @$core.pragma('dart2js:noInline')
  static ProjectId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectId>(create);
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
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  ProjectTagId._();

  factory ProjectTagId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectTagId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectTagId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectTagId clone() => ProjectTagId()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectTagId copyWith(void Function(ProjectTagId) updates) =>
      super.copyWith((message) => updates(message as ProjectTagId))
          as ProjectTagId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectTagId create() => ProjectTagId._();
  @$core.override
  ProjectTagId createEmptyInstance() => create();
  static $pb.PbList<ProjectTagId> createRepeated() =>
      $pb.PbList<ProjectTagId>();
  @$core.pragma('dart2js:noInline')
  static ProjectTagId getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectTagId>(create);
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
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  OrganizationId._();

  factory OrganizationId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OrganizationId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrganizationId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrganizationId clone() => OrganizationId()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrganizationId copyWith(void Function(OrganizationId) updates) =>
      super.copyWith((message) => updates(message as OrganizationId))
          as OrganizationId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrganizationId create() => OrganizationId._();
  @$core.override
  OrganizationId createEmptyInstance() => create();
  static $pb.PbList<OrganizationId> createRepeated() =>
      $pb.PbList<OrganizationId>();
  @$core.pragma('dart2js:noInline')
  static OrganizationId getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OrganizationId>(create);
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
    final result = create();
    if (referrer != null) result.referrer = referrer;
    return result;
  }

  SessionPublisherInfo._();

  factory SessionPublisherInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SessionPublisherInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionPublisherInfo',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.types.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'referrer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionPublisherInfo clone() =>
      SessionPublisherInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionPublisherInfo copyWith(void Function(SessionPublisherInfo) updates) =>
      super.copyWith((message) => updates(message as SessionPublisherInfo))
          as SessionPublisherInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionPublisherInfo create() => SessionPublisherInfo._();
  @$core.override
  SessionPublisherInfo createEmptyInstance() => create();
  static $pb.PbList<SessionPublisherInfo> createRepeated() =>
      $pb.PbList<SessionPublisherInfo>();
  @$core.pragma('dart2js:noInline')
  static SessionPublisherInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionPublisherInfo>(create);
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
