// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/membership.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/field_mask.pb.dart'
    as $1;

import '../../types/v1/types.pb.dart' as $0;
import 'membership.pbenum.dart';
import 'types.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'membership.pbenum.dart';

/// Identifies a membership: the (org, user) edge.
class MembershipKey extends $pb.GeneratedMessage {
  factory MembershipKey({
    $0.OrganizationId? orgId,
    $0.UserId? userId,
  }) {
    final result = MembershipKey._();
    if (orgId != null) result.orgId = orgId;
    if (userId != null) result.userId = userId;
    return result;
  }

  MembershipKey._();

  factory MembershipKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      MembershipKey()..mergeFromBuffer(data, registry);
  factory MembershipKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      MembershipKey()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MembershipKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: MembershipKey.$_createMessage)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'orgId',
        subBuilder: $0.OrganizationId.$_createMessage)
    ..aOM<$0.UserId>(2, _omitFieldNames ? '' : 'userId',
        subBuilder: $0.UserId.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MembershipKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MembershipKey copyWith(void Function(MembershipKey) updates) =>
      super.copyWith((message) => updates(message as MembershipKey))
          as MembershipKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use MembershipKey() / MembershipKey.new instead')
  static MembershipKey create() => MembershipKey._();
  static $pb.GeneratedMessage $_createMessage() => MembershipKey._();
  @$core.override
  MembershipKey createEmptyInstance() => MembershipKey._();
  @$core.pragma('dart2js:noInline')
  static MembershipKey getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MembershipKey>(
          MembershipKey.$_createMessage);
  static MembershipKey? _defaultInstance;

  /// The organization endpoint of the edge.
  @$pb.TagNumber(1)
  $0.OrganizationId get orgId => $_getN(0);
  @$pb.TagNumber(1)
  set orgId($0.OrganizationId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOrgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrgId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.OrganizationId ensureOrgId() => $_ensure(0);

  /// The user endpoint of the edge.
  @$pb.TagNumber(2)
  $0.UserId get userId => $_getN(1);
  @$pb.TagNumber(2)
  set userId($0.UserId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.UserId ensureUserId() => $_ensure(1);
}

/// A membership: the edge granting a user a role within an organization.
class Membership extends $pb.GeneratedMessage {
  factory Membership({
    MembershipKey? key,
    MembershipProps? props,
  }) {
    final result = Membership._();
    if (key != null) result.key = key;
    if (props != null) result.props = props;
    return result;
  }

  Membership._();

  factory Membership.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Membership()..mergeFromBuffer(data, registry);
  factory Membership.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Membership()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Membership',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: Membership.$_createMessage)
    ..aOM<MembershipKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: MembershipKey.$_createMessage)
    ..aOM<MembershipProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: MembershipProps.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Membership clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Membership copyWith(void Function(Membership) updates) =>
      super.copyWith((message) => updates(message as Membership)) as Membership;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use Membership() / Membership.new instead')
  static Membership create() => Membership._();
  static $pb.GeneratedMessage $_createMessage() => Membership._();
  @$core.override
  Membership createEmptyInstance() => Membership._();
  @$core.pragma('dart2js:noInline')
  static Membership getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Membership>(Membership.$_createMessage);
  static Membership? _defaultInstance;

  /// The (org, user) edge this membership represents.
  @$pb.TagNumber(1)
  MembershipKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(MembershipKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  MembershipKey ensureKey() => $_ensure(0);

  /// Mutable membership properties.
  @$pb.TagNumber(2)
  MembershipProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(MembershipProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  MembershipProps ensureProps() => $_ensure(1);
}

/// Request to create a membership.
class CreateMembershipRequest extends $pb.GeneratedMessage {
  factory CreateMembershipRequest({
    MembershipKey? key,
    MembershipProps? props,
  }) {
    final result = CreateMembershipRequest._();
    if (key != null) result.key = key;
    if (props != null) result.props = props;
    return result;
  }

  CreateMembershipRequest._();

  factory CreateMembershipRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateMembershipRequest()..mergeFromBuffer(data, registry);
  factory CreateMembershipRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateMembershipRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateMembershipRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: CreateMembershipRequest.$_createMessage)
    ..aOM<MembershipKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: MembershipKey.$_createMessage)
    ..aOM<MembershipProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: MembershipProps.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateMembershipRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateMembershipRequest copyWith(
          void Function(CreateMembershipRequest) updates) =>
      super.copyWith((message) => updates(message as CreateMembershipRequest))
          as CreateMembershipRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateMembershipRequest() / CreateMembershipRequest.new instead')
  static CreateMembershipRequest create() => CreateMembershipRequest._();
  static $pb.GeneratedMessage $_createMessage() => CreateMembershipRequest._();
  @$core.override
  CreateMembershipRequest createEmptyInstance() => CreateMembershipRequest._();
  @$core.pragma('dart2js:noInline')
  static CreateMembershipRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateMembershipRequest>(
          CreateMembershipRequest.$_createMessage);
  static CreateMembershipRequest? _defaultInstance;

  /// The org <-> user edge to create.
  @$pb.TagNumber(1)
  MembershipKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(MembershipKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  MembershipKey ensureKey() => $_ensure(0);

  /// Properties for the new membership.
  @$pb.TagNumber(2)
  MembershipProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(MembershipProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  MembershipProps ensureProps() => $_ensure(1);
}

/// Response to a create-membership request.
class CreateMembershipResponse extends $pb.GeneratedMessage {
  factory CreateMembershipResponse({
    Membership? membership,
  }) {
    final result = CreateMembershipResponse._();
    if (membership != null) result.membership = membership;
    return result;
  }

  CreateMembershipResponse._();

  factory CreateMembershipResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateMembershipResponse()..mergeFromBuffer(data, registry);
  factory CreateMembershipResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateMembershipResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateMembershipResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: CreateMembershipResponse.$_createMessage)
    ..aOM<Membership>(1, _omitFieldNames ? '' : 'membership',
        subBuilder: Membership.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateMembershipResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateMembershipResponse copyWith(
          void Function(CreateMembershipResponse) updates) =>
      super.copyWith((message) => updates(message as CreateMembershipResponse))
          as CreateMembershipResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateMembershipResponse() / CreateMembershipResponse.new instead')
  static CreateMembershipResponse create() => CreateMembershipResponse._();
  static $pb.GeneratedMessage $_createMessage() => CreateMembershipResponse._();
  @$core.override
  CreateMembershipResponse createEmptyInstance() =>
      CreateMembershipResponse._();
  @$core.pragma('dart2js:noInline')
  static CreateMembershipResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateMembershipResponse>(
          CreateMembershipResponse.$_createMessage);
  static CreateMembershipResponse? _defaultInstance;

  /// The newly created membership.
  @$pb.TagNumber(1)
  Membership get membership => $_getN(0);
  @$pb.TagNumber(1)
  set membership(Membership value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMembership() => $_has(0);
  @$pb.TagNumber(1)
  void clearMembership() => $_clearField(1);
  @$pb.TagNumber(1)
  Membership ensureMembership() => $_ensure(0);
}

/// Request to fetch a membership.
class GetMembershipRequest extends $pb.GeneratedMessage {
  factory GetMembershipRequest({
    MembershipKey? key,
  }) {
    final result = GetMembershipRequest._();
    if (key != null) result.key = key;
    return result;
  }

  GetMembershipRequest._();

  factory GetMembershipRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetMembershipRequest()..mergeFromBuffer(data, registry);
  factory GetMembershipRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetMembershipRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMembershipRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: GetMembershipRequest.$_createMessage)
    ..aOM<MembershipKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: MembershipKey.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMembershipRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMembershipRequest copyWith(void Function(GetMembershipRequest) updates) =>
      super.copyWith((message) => updates(message as GetMembershipRequest))
          as GetMembershipRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetMembershipRequest() / GetMembershipRequest.new instead')
  static GetMembershipRequest create() => GetMembershipRequest._();
  static $pb.GeneratedMessage $_createMessage() => GetMembershipRequest._();
  @$core.override
  GetMembershipRequest createEmptyInstance() => GetMembershipRequest._();
  @$core.pragma('dart2js:noInline')
  static GetMembershipRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMembershipRequest>(
          GetMembershipRequest.$_createMessage);
  static GetMembershipRequest? _defaultInstance;

  /// The membership to fetch.
  @$pb.TagNumber(1)
  MembershipKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(MembershipKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  MembershipKey ensureKey() => $_ensure(0);
}

/// Response to a get-membership request.
class GetMembershipResponse extends $pb.GeneratedMessage {
  factory GetMembershipResponse({
    Membership? membership,
  }) {
    final result = GetMembershipResponse._();
    if (membership != null) result.membership = membership;
    return result;
  }

  GetMembershipResponse._();

  factory GetMembershipResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetMembershipResponse()..mergeFromBuffer(data, registry);
  factory GetMembershipResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetMembershipResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMembershipResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: GetMembershipResponse.$_createMessage)
    ..aOM<Membership>(1, _omitFieldNames ? '' : 'membership',
        subBuilder: Membership.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMembershipResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMembershipResponse copyWith(
          void Function(GetMembershipResponse) updates) =>
      super.copyWith((message) => updates(message as GetMembershipResponse))
          as GetMembershipResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetMembershipResponse() / GetMembershipResponse.new instead')
  static GetMembershipResponse create() => GetMembershipResponse._();
  static $pb.GeneratedMessage $_createMessage() => GetMembershipResponse._();
  @$core.override
  GetMembershipResponse createEmptyInstance() => GetMembershipResponse._();
  @$core.pragma('dart2js:noInline')
  static GetMembershipResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMembershipResponse>(
          GetMembershipResponse.$_createMessage);
  static GetMembershipResponse? _defaultInstance;

  /// The requested membership.
  @$pb.TagNumber(1)
  Membership get membership => $_getN(0);
  @$pb.TagNumber(1)
  set membership(Membership value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMembership() => $_has(0);
  @$pb.TagNumber(1)
  void clearMembership() => $_clearField(1);
  @$pb.TagNumber(1)
  Membership ensureMembership() => $_ensure(0);
}

/// Request to update a membership's properties.
class UpdateMembershipRequest extends $pb.GeneratedMessage {
  factory UpdateMembershipRequest({
    MembershipKey? key,
    MembershipProps? props,
    $1.FieldMask? updateMask,
  }) {
    final result = UpdateMembershipRequest._();
    if (key != null) result.key = key;
    if (props != null) result.props = props;
    if (updateMask != null) result.updateMask = updateMask;
    return result;
  }

  UpdateMembershipRequest._();

  factory UpdateMembershipRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateMembershipRequest()..mergeFromBuffer(data, registry);
  factory UpdateMembershipRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateMembershipRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateMembershipRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: UpdateMembershipRequest.$_createMessage)
    ..aOM<MembershipKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: MembershipKey.$_createMessage)
    ..aOM<MembershipProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: MembershipProps.$_createMessage)
    ..aOM<$1.FieldMask>(3, _omitFieldNames ? '' : 'updateMask',
        subBuilder: $1.FieldMask.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMembershipRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMembershipRequest copyWith(
          void Function(UpdateMembershipRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateMembershipRequest))
          as UpdateMembershipRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use UpdateMembershipRequest() / UpdateMembershipRequest.new instead')
  static UpdateMembershipRequest create() => UpdateMembershipRequest._();
  static $pb.GeneratedMessage $_createMessage() => UpdateMembershipRequest._();
  @$core.override
  UpdateMembershipRequest createEmptyInstance() => UpdateMembershipRequest._();
  @$core.pragma('dart2js:noInline')
  static UpdateMembershipRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateMembershipRequest>(
          UpdateMembershipRequest.$_createMessage);
  static UpdateMembershipRequest? _defaultInstance;

  /// The membership to update.
  @$pb.TagNumber(1)
  MembershipKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(MembershipKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  MembershipKey ensureKey() => $_ensure(0);

  /// The new property values. Only fields named in update_mask are applied.
  @$pb.TagNumber(2)
  MembershipProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(MembershipProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  MembershipProps ensureProps() => $_ensure(1);

  /// Which fields of props to update. If empty, all fields are replaced.
  @$pb.TagNumber(3)
  $1.FieldMask get updateMask => $_getN(2);
  @$pb.TagNumber(3)
  set updateMask($1.FieldMask value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateMask() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateMask() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.FieldMask ensureUpdateMask() => $_ensure(2);
}

/// Response to an update-membership request.
class UpdateMembershipResponse extends $pb.GeneratedMessage {
  factory UpdateMembershipResponse({
    Membership? membership,
  }) {
    final result = UpdateMembershipResponse._();
    if (membership != null) result.membership = membership;
    return result;
  }

  UpdateMembershipResponse._();

  factory UpdateMembershipResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateMembershipResponse()..mergeFromBuffer(data, registry);
  factory UpdateMembershipResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateMembershipResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateMembershipResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: UpdateMembershipResponse.$_createMessage)
    ..aOM<Membership>(1, _omitFieldNames ? '' : 'membership',
        subBuilder: Membership.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMembershipResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMembershipResponse copyWith(
          void Function(UpdateMembershipResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateMembershipResponse))
          as UpdateMembershipResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use UpdateMembershipResponse() / UpdateMembershipResponse.new instead')
  static UpdateMembershipResponse create() => UpdateMembershipResponse._();
  static $pb.GeneratedMessage $_createMessage() => UpdateMembershipResponse._();
  @$core.override
  UpdateMembershipResponse createEmptyInstance() =>
      UpdateMembershipResponse._();
  @$core.pragma('dart2js:noInline')
  static UpdateMembershipResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateMembershipResponse>(
          UpdateMembershipResponse.$_createMessage);
  static UpdateMembershipResponse? _defaultInstance;

  /// The membership after the update.
  @$pb.TagNumber(1)
  Membership get membership => $_getN(0);
  @$pb.TagNumber(1)
  set membership(Membership value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMembership() => $_has(0);
  @$pb.TagNumber(1)
  void clearMembership() => $_clearField(1);
  @$pb.TagNumber(1)
  Membership ensureMembership() => $_ensure(0);
}

/// Request to delete a membership.
class DeleteMembershipRequest extends $pb.GeneratedMessage {
  factory DeleteMembershipRequest({
    MembershipKey? key,
  }) {
    final result = DeleteMembershipRequest._();
    if (key != null) result.key = key;
    return result;
  }

  DeleteMembershipRequest._();

  factory DeleteMembershipRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteMembershipRequest()..mergeFromBuffer(data, registry);
  factory DeleteMembershipRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteMembershipRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteMembershipRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: DeleteMembershipRequest.$_createMessage)
    ..aOM<MembershipKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: MembershipKey.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteMembershipRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteMembershipRequest copyWith(
          void Function(DeleteMembershipRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteMembershipRequest))
          as DeleteMembershipRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use DeleteMembershipRequest() / DeleteMembershipRequest.new instead')
  static DeleteMembershipRequest create() => DeleteMembershipRequest._();
  static $pb.GeneratedMessage $_createMessage() => DeleteMembershipRequest._();
  @$core.override
  DeleteMembershipRequest createEmptyInstance() => DeleteMembershipRequest._();
  @$core.pragma('dart2js:noInline')
  static DeleteMembershipRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteMembershipRequest>(
          DeleteMembershipRequest.$_createMessage);
  static DeleteMembershipRequest? _defaultInstance;

  /// The membership to delete.
  @$pb.TagNumber(1)
  MembershipKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(MembershipKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  MembershipKey ensureKey() => $_ensure(0);
}

/// Response to a delete-membership request.
class DeleteMembershipResponse extends $pb.GeneratedMessage {
  factory DeleteMembershipResponse() => DeleteMembershipResponse._();

  DeleteMembershipResponse._();

  factory DeleteMembershipResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteMembershipResponse()..mergeFromBuffer(data, registry);
  factory DeleteMembershipResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteMembershipResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteMembershipResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: DeleteMembershipResponse.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteMembershipResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteMembershipResponse copyWith(
          void Function(DeleteMembershipResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteMembershipResponse))
          as DeleteMembershipResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use DeleteMembershipResponse() / DeleteMembershipResponse.new instead')
  static DeleteMembershipResponse create() => DeleteMembershipResponse._();
  static $pb.GeneratedMessage $_createMessage() => DeleteMembershipResponse._();
  @$core.override
  DeleteMembershipResponse createEmptyInstance() =>
      DeleteMembershipResponse._();
  @$core.pragma('dart2js:noInline')
  static DeleteMembershipResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteMembershipResponse>(
          DeleteMembershipResponse.$_createMessage);
  static DeleteMembershipResponse? _defaultInstance;
}

/// Request to list an organization's memberships.
class ListMembershipsRequest extends $pb.GeneratedMessage {
  factory ListMembershipsRequest({
    $0.OrganizationId? orgId,
    $2.PageRequest? page,
  }) {
    final result = ListMembershipsRequest._();
    if (orgId != null) result.orgId = orgId;
    if (page != null) result.page = page;
    return result;
  }

  ListMembershipsRequest._();

  factory ListMembershipsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListMembershipsRequest()..mergeFromBuffer(data, registry);
  factory ListMembershipsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListMembershipsRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListMembershipsRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: ListMembershipsRequest.$_createMessage)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'orgId',
        subBuilder: $0.OrganizationId.$_createMessage)
    ..aOM<$2.PageRequest>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageRequest.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMembershipsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMembershipsRequest copyWith(
          void Function(ListMembershipsRequest) updates) =>
      super.copyWith((message) => updates(message as ListMembershipsRequest))
          as ListMembershipsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListMembershipsRequest() / ListMembershipsRequest.new instead')
  static ListMembershipsRequest create() => ListMembershipsRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListMembershipsRequest._();
  @$core.override
  ListMembershipsRequest createEmptyInstance() => ListMembershipsRequest._();
  @$core.pragma('dart2js:noInline')
  static ListMembershipsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListMembershipsRequest>(
          ListMembershipsRequest.$_createMessage);
  static ListMembershipsRequest? _defaultInstance;

  /// The organization whose memberships to list.
  @$pb.TagNumber(1)
  $0.OrganizationId get orgId => $_getN(0);
  @$pb.TagNumber(1)
  set orgId($0.OrganizationId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOrgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrgId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.OrganizationId ensureOrgId() => $_ensure(0);

  /// Pagination parameters. Omit for the first page.
  @$pb.TagNumber(2)
  $2.PageRequest get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($2.PageRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.PageRequest ensurePage() => $_ensure(1);
}

/// Response to a list-memberships request.
class ListMembershipsResponse extends $pb.GeneratedMessage {
  factory ListMembershipsResponse({
    $core.Iterable<Membership>? memberships,
    $2.PageResponse? page,
  }) {
    final result = ListMembershipsResponse._();
    if (memberships != null) result.memberships.addAll(memberships);
    if (page != null) result.page = page;
    return result;
  }

  ListMembershipsResponse._();

  factory ListMembershipsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListMembershipsResponse()..mergeFromBuffer(data, registry);
  factory ListMembershipsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListMembershipsResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListMembershipsResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: ListMembershipsResponse.$_createMessage)
    ..pPM<Membership>(1, _omitFieldNames ? '' : 'memberships',
        subBuilder: Membership.$_createMessage)
    ..aOM<$2.PageResponse>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageResponse.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMembershipsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMembershipsResponse copyWith(
          void Function(ListMembershipsResponse) updates) =>
      super.copyWith((message) => updates(message as ListMembershipsResponse))
          as ListMembershipsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListMembershipsResponse() / ListMembershipsResponse.new instead')
  static ListMembershipsResponse create() => ListMembershipsResponse._();
  static $pb.GeneratedMessage $_createMessage() => ListMembershipsResponse._();
  @$core.override
  ListMembershipsResponse createEmptyInstance() => ListMembershipsResponse._();
  @$core.pragma('dart2js:noInline')
  static ListMembershipsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListMembershipsResponse>(
          ListMembershipsResponse.$_createMessage);
  static ListMembershipsResponse? _defaultInstance;

  /// A page of the organization's memberships.
  @$pb.TagNumber(1)
  $pb.PbList<Membership> get memberships => $_getList(0);

  /// Pagination cursor for fetching the next page.
  @$pb.TagNumber(2)
  $2.PageResponse get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($2.PageResponse value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.PageResponse ensurePage() => $_ensure(1);
}

/// The mutable properties of a membership.
class MembershipProps extends $pb.GeneratedMessage {
  factory MembershipProps({
    Role? role,
  }) {
    final result = MembershipProps._();
    if (role != null) result.role = role;
    return result;
  }

  MembershipProps._();

  factory MembershipProps.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      MembershipProps()..mergeFromBuffer(data, registry);
  factory MembershipProps.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      MembershipProps()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MembershipProps',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: MembershipProps.$_createMessage)
    ..aE<Role>(1, _omitFieldNames ? '' : 'role', enumValues: Role.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MembershipProps clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MembershipProps copyWith(void Function(MembershipProps) updates) =>
      super.copyWith((message) => updates(message as MembershipProps))
          as MembershipProps;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use MembershipProps() / MembershipProps.new instead')
  static MembershipProps create() => MembershipProps._();
  static $pb.GeneratedMessage $_createMessage() => MembershipProps._();
  @$core.override
  MembershipProps createEmptyInstance() => MembershipProps._();
  @$core.pragma('dart2js:noInline')
  static MembershipProps getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MembershipProps>(
          MembershipProps.$_createMessage);
  static MembershipProps? _defaultInstance;

  /// The role granted to the user within the organization.
  @$pb.TagNumber(1)
  Role get role => $_getN(0);
  @$pb.TagNumber(1)
  set role(Role value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => $_clearField(1);
}

/// Provides data plane functionality related to memberships. A membership is the
/// edge that grants a user a role within an organization.
class MembershipServiceApi {
  final $pb.RpcClient _client;

  MembershipServiceApi(this._client);

  /// Creates a membership (an edge between org <-> user).
  $async.Future<CreateMembershipResponse> createMembership(
          $pb.ClientContext? ctx, CreateMembershipRequest request) =>
      _client.invoke<CreateMembershipResponse>(ctx, 'MembershipService',
          'CreateMembership', request, CreateMembershipResponse());

  /// Fetches a membership.
  $async.Future<GetMembershipResponse> getMembership(
          $pb.ClientContext? ctx, GetMembershipRequest request) =>
      _client.invoke<GetMembershipResponse>(ctx, 'MembershipService',
          'GetMembership', request, GetMembershipResponse());

  /// Updates a membership's mutable properties, e.g. the user's role.
  $async.Future<UpdateMembershipResponse> updateMembership(
          $pb.ClientContext? ctx, UpdateMembershipRequest request) =>
      _client.invoke<UpdateMembershipResponse>(ctx, 'MembershipService',
          'UpdateMembership', request, UpdateMembershipResponse());

  /// Deletes a membership, removing the user from the organization.
  $async.Future<DeleteMembershipResponse> deleteMembership(
          $pb.ClientContext? ctx, DeleteMembershipRequest request) =>
      _client.invoke<DeleteMembershipResponse>(ctx, 'MembershipService',
          'DeleteMembership', request, DeleteMembershipResponse());

  /// Lists the memberships of an organization.
  $async.Future<ListMembershipsResponse> listMemberships(
          $pb.ClientContext? ctx, ListMembershipsRequest request) =>
      _client.invoke<ListMembershipsResponse>(ctx, 'MembershipService',
          'ListMemberships', request, ListMembershipsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
