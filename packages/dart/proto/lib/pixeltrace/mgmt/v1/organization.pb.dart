// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/organization.proto.

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
import 'project.pb.dart' as $3;
import 'types.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Request to create an organization.
class CreateOrganizationRequest extends $pb.GeneratedMessage {
  factory CreateOrganizationRequest({
    OrganizationProps? props,
  }) {
    final result = CreateOrganizationRequest._();
    if (props != null) result.props = props;
    return result;
  }

  CreateOrganizationRequest._();

  factory CreateOrganizationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateOrganizationRequest()..mergeFromBuffer(data, registry);
  factory CreateOrganizationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateOrganizationRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrganizationRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: CreateOrganizationRequest.$_createMessage)
    ..aOM<OrganizationProps>(1, _omitFieldNames ? '' : 'props',
        subBuilder: OrganizationProps.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrganizationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrganizationRequest copyWith(
          void Function(CreateOrganizationRequest) updates) =>
      super.copyWith((message) => updates(message as CreateOrganizationRequest))
          as CreateOrganizationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateOrganizationRequest() / CreateOrganizationRequest.new instead')
  static CreateOrganizationRequest create() => CreateOrganizationRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      CreateOrganizationRequest._();
  @$core.override
  CreateOrganizationRequest createEmptyInstance() =>
      CreateOrganizationRequest._();
  @$core.pragma('dart2js:noInline')
  static CreateOrganizationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrganizationRequest>(
          CreateOrganizationRequest.$_createMessage);
  static CreateOrganizationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  OrganizationProps get props => $_getN(0);
  @$pb.TagNumber(1)
  set props(OrganizationProps value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProps() => $_has(0);
  @$pb.TagNumber(1)
  void clearProps() => $_clearField(1);
  @$pb.TagNumber(1)
  OrganizationProps ensureProps() => $_ensure(0);
}

/// Response to a create-org request.
class CreateOrganizationResponse extends $pb.GeneratedMessage {
  factory CreateOrganizationResponse({
    $0.OrganizationId? id,
    OrganizationProps? props,
  }) {
    final result = CreateOrganizationResponse._();
    if (id != null) result.id = id;
    if (props != null) result.props = props;
    return result;
  }

  CreateOrganizationResponse._();

  factory CreateOrganizationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateOrganizationResponse()..mergeFromBuffer(data, registry);
  factory CreateOrganizationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateOrganizationResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrganizationResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: CreateOrganizationResponse.$_createMessage)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.$_createMessage)
    ..aOM<OrganizationProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: OrganizationProps.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrganizationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrganizationResponse copyWith(
          void Function(CreateOrganizationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateOrganizationResponse))
          as CreateOrganizationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateOrganizationResponse() / CreateOrganizationResponse.new instead')
  static CreateOrganizationResponse create() => CreateOrganizationResponse._();
  static $pb.GeneratedMessage $_createMessage() =>
      CreateOrganizationResponse._();
  @$core.override
  CreateOrganizationResponse createEmptyInstance() =>
      CreateOrganizationResponse._();
  @$core.pragma('dart2js:noInline')
  static CreateOrganizationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrganizationResponse>(
          CreateOrganizationResponse.$_createMessage);
  static CreateOrganizationResponse? _defaultInstance;

  /// Id of the newly created organization.
  @$pb.TagNumber(1)
  $0.OrganizationId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.OrganizationId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.OrganizationId ensureId() => $_ensure(0);

  /// Props of the organization.
  @$pb.TagNumber(2)
  OrganizationProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(OrganizationProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  OrganizationProps ensureProps() => $_ensure(1);
}

/// Request to fetch an organization.
class GetOrganizationRequest extends $pb.GeneratedMessage {
  factory GetOrganizationRequest({
    $0.OrganizationId? id,
  }) {
    final result = GetOrganizationRequest._();
    if (id != null) result.id = id;
    return result;
  }

  GetOrganizationRequest._();

  factory GetOrganizationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetOrganizationRequest()..mergeFromBuffer(data, registry);
  factory GetOrganizationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetOrganizationRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetOrganizationRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: GetOrganizationRequest.$_createMessage)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrganizationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrganizationRequest copyWith(
          void Function(GetOrganizationRequest) updates) =>
      super.copyWith((message) => updates(message as GetOrganizationRequest))
          as GetOrganizationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetOrganizationRequest() / GetOrganizationRequest.new instead')
  static GetOrganizationRequest create() => GetOrganizationRequest._();
  static $pb.GeneratedMessage $_createMessage() => GetOrganizationRequest._();
  @$core.override
  GetOrganizationRequest createEmptyInstance() => GetOrganizationRequest._();
  @$core.pragma('dart2js:noInline')
  static GetOrganizationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetOrganizationRequest>(
          GetOrganizationRequest.$_createMessage);
  static GetOrganizationRequest? _defaultInstance;

  /// Id of the organization to fetch.
  @$pb.TagNumber(1)
  $0.OrganizationId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.OrganizationId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.OrganizationId ensureId() => $_ensure(0);
}

/// Response to a get-organization request.
class GetOrganizationResponse extends $pb.GeneratedMessage {
  factory GetOrganizationResponse({
    Organization? organization,
  }) {
    final result = GetOrganizationResponse._();
    if (organization != null) result.organization = organization;
    return result;
  }

  GetOrganizationResponse._();

  factory GetOrganizationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetOrganizationResponse()..mergeFromBuffer(data, registry);
  factory GetOrganizationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetOrganizationResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetOrganizationResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: GetOrganizationResponse.$_createMessage)
    ..aOM<Organization>(1, _omitFieldNames ? '' : 'organization',
        subBuilder: Organization.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrganizationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrganizationResponse copyWith(
          void Function(GetOrganizationResponse) updates) =>
      super.copyWith((message) => updates(message as GetOrganizationResponse))
          as GetOrganizationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetOrganizationResponse() / GetOrganizationResponse.new instead')
  static GetOrganizationResponse create() => GetOrganizationResponse._();
  static $pb.GeneratedMessage $_createMessage() => GetOrganizationResponse._();
  @$core.override
  GetOrganizationResponse createEmptyInstance() => GetOrganizationResponse._();
  @$core.pragma('dart2js:noInline')
  static GetOrganizationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetOrganizationResponse>(
          GetOrganizationResponse.$_createMessage);
  static GetOrganizationResponse? _defaultInstance;

  /// The requested organization.
  @$pb.TagNumber(1)
  Organization get organization => $_getN(0);
  @$pb.TagNumber(1)
  set organization(Organization value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOrganization() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrganization() => $_clearField(1);
  @$pb.TagNumber(1)
  Organization ensureOrganization() => $_ensure(0);
}

/// Request to update an organization's properties.
class UpdateOrganizationRequest extends $pb.GeneratedMessage {
  factory UpdateOrganizationRequest({
    $0.OrganizationId? id,
    OrganizationProps? props,
    $1.FieldMask? updateMask,
  }) {
    final result = UpdateOrganizationRequest._();
    if (id != null) result.id = id;
    if (props != null) result.props = props;
    if (updateMask != null) result.updateMask = updateMask;
    return result;
  }

  UpdateOrganizationRequest._();

  factory UpdateOrganizationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateOrganizationRequest()..mergeFromBuffer(data, registry);
  factory UpdateOrganizationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateOrganizationRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateOrganizationRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: UpdateOrganizationRequest.$_createMessage)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.$_createMessage)
    ..aOM<OrganizationProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: OrganizationProps.$_createMessage)
    ..aOM<$1.FieldMask>(3, _omitFieldNames ? '' : 'updateMask',
        subBuilder: $1.FieldMask.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrganizationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrganizationRequest copyWith(
          void Function(UpdateOrganizationRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateOrganizationRequest))
          as UpdateOrganizationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use UpdateOrganizationRequest() / UpdateOrganizationRequest.new instead')
  static UpdateOrganizationRequest create() => UpdateOrganizationRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      UpdateOrganizationRequest._();
  @$core.override
  UpdateOrganizationRequest createEmptyInstance() =>
      UpdateOrganizationRequest._();
  @$core.pragma('dart2js:noInline')
  static UpdateOrganizationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateOrganizationRequest>(
          UpdateOrganizationRequest.$_createMessage);
  static UpdateOrganizationRequest? _defaultInstance;

  /// Id of the organization to update.
  @$pb.TagNumber(1)
  $0.OrganizationId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.OrganizationId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.OrganizationId ensureId() => $_ensure(0);

  /// The new property values. Only fields named in update_mask are applied.
  @$pb.TagNumber(2)
  OrganizationProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(OrganizationProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  OrganizationProps ensureProps() => $_ensure(1);

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

/// Response to an update-organization request.
class UpdateOrganizationResponse extends $pb.GeneratedMessage {
  factory UpdateOrganizationResponse({
    Organization? organization,
  }) {
    final result = UpdateOrganizationResponse._();
    if (organization != null) result.organization = organization;
    return result;
  }

  UpdateOrganizationResponse._();

  factory UpdateOrganizationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateOrganizationResponse()..mergeFromBuffer(data, registry);
  factory UpdateOrganizationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateOrganizationResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateOrganizationResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: UpdateOrganizationResponse.$_createMessage)
    ..aOM<Organization>(1, _omitFieldNames ? '' : 'organization',
        subBuilder: Organization.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrganizationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrganizationResponse copyWith(
          void Function(UpdateOrganizationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateOrganizationResponse))
          as UpdateOrganizationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use UpdateOrganizationResponse() / UpdateOrganizationResponse.new instead')
  static UpdateOrganizationResponse create() => UpdateOrganizationResponse._();
  static $pb.GeneratedMessage $_createMessage() =>
      UpdateOrganizationResponse._();
  @$core.override
  UpdateOrganizationResponse createEmptyInstance() =>
      UpdateOrganizationResponse._();
  @$core.pragma('dart2js:noInline')
  static UpdateOrganizationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateOrganizationResponse>(
          UpdateOrganizationResponse.$_createMessage);
  static UpdateOrganizationResponse? _defaultInstance;

  /// The organization after the update.
  @$pb.TagNumber(1)
  Organization get organization => $_getN(0);
  @$pb.TagNumber(1)
  set organization(Organization value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOrganization() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrganization() => $_clearField(1);
  @$pb.TagNumber(1)
  Organization ensureOrganization() => $_ensure(0);
}

/// Request to delete an organization.
class DeleteOrganizationRequest extends $pb.GeneratedMessage {
  factory DeleteOrganizationRequest({
    $0.OrganizationId? id,
    $core.bool? dangerouslyAllowProjectDeletion,
  }) {
    final result = DeleteOrganizationRequest._();
    if (id != null) result.id = id;
    if (dangerouslyAllowProjectDeletion != null)
      result.dangerouslyAllowProjectDeletion = dangerouslyAllowProjectDeletion;
    return result;
  }

  DeleteOrganizationRequest._();

  factory DeleteOrganizationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteOrganizationRequest()..mergeFromBuffer(data, registry);
  factory DeleteOrganizationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteOrganizationRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteOrganizationRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: DeleteOrganizationRequest.$_createMessage)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.$_createMessage)
    ..aOB(2, _omitFieldNames ? '' : 'dangerouslyAllowProjectDeletion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrganizationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrganizationRequest copyWith(
          void Function(DeleteOrganizationRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteOrganizationRequest))
          as DeleteOrganizationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use DeleteOrganizationRequest() / DeleteOrganizationRequest.new instead')
  static DeleteOrganizationRequest create() => DeleteOrganizationRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      DeleteOrganizationRequest._();
  @$core.override
  DeleteOrganizationRequest createEmptyInstance() =>
      DeleteOrganizationRequest._();
  @$core.pragma('dart2js:noInline')
  static DeleteOrganizationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteOrganizationRequest>(
          DeleteOrganizationRequest.$_createMessage);
  static DeleteOrganizationRequest? _defaultInstance;

  /// Id of the organization to delete.
  @$pb.TagNumber(1)
  $0.OrganizationId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.OrganizationId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.OrganizationId ensureId() => $_ensure(0);

  /// Cascade-delete every project and its data in the organization, instead of
  /// rejecting the delete while projects remain.
  @$pb.TagNumber(2)
  $core.bool get dangerouslyAllowProjectDeletion => $_getBF(1);
  @$pb.TagNumber(2)
  set dangerouslyAllowProjectDeletion($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDangerouslyAllowProjectDeletion() => $_has(1);
  @$pb.TagNumber(2)
  void clearDangerouslyAllowProjectDeletion() => $_clearField(2);
}

/// Response to a delete-organization request.
class DeleteOrganizationResponse extends $pb.GeneratedMessage {
  factory DeleteOrganizationResponse() => DeleteOrganizationResponse._();

  DeleteOrganizationResponse._();

  factory DeleteOrganizationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteOrganizationResponse()..mergeFromBuffer(data, registry);
  factory DeleteOrganizationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteOrganizationResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteOrganizationResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: DeleteOrganizationResponse.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrganizationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrganizationResponse copyWith(
          void Function(DeleteOrganizationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteOrganizationResponse))
          as DeleteOrganizationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use DeleteOrganizationResponse() / DeleteOrganizationResponse.new instead')
  static DeleteOrganizationResponse create() => DeleteOrganizationResponse._();
  static $pb.GeneratedMessage $_createMessage() =>
      DeleteOrganizationResponse._();
  @$core.override
  DeleteOrganizationResponse createEmptyInstance() =>
      DeleteOrganizationResponse._();
  @$core.pragma('dart2js:noInline')
  static DeleteOrganizationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteOrganizationResponse>(
          DeleteOrganizationResponse.$_createMessage);
  static DeleteOrganizationResponse? _defaultInstance;
}

/// Request to list the projects belonging to an organization.
class ListProjectsRequest extends $pb.GeneratedMessage {
  factory ListProjectsRequest({
    $0.OrganizationId? orgId,
    $2.PageRequest? page,
  }) {
    final result = ListProjectsRequest._();
    if (orgId != null) result.orgId = orgId;
    if (page != null) result.page = page;
    return result;
  }

  ListProjectsRequest._();

  factory ListProjectsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListProjectsRequest()..mergeFromBuffer(data, registry);
  factory ListProjectsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListProjectsRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectsRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: ListProjectsRequest.$_createMessage)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'orgId',
        subBuilder: $0.OrganizationId.$_createMessage)
    ..aOM<$2.PageRequest>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageRequest.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsRequest copyWith(void Function(ListProjectsRequest) updates) =>
      super.copyWith((message) => updates(message as ListProjectsRequest))
          as ListProjectsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use ListProjectsRequest() / ListProjectsRequest.new instead')
  static ListProjectsRequest create() => ListProjectsRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListProjectsRequest._();
  @$core.override
  ListProjectsRequest createEmptyInstance() => ListProjectsRequest._();
  @$core.pragma('dart2js:noInline')
  static ListProjectsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectsRequest>(
          ListProjectsRequest.$_createMessage);
  static ListProjectsRequest? _defaultInstance;

  /// The organization whose projects to list.
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

/// Response to a list-projects request.
class ListProjectsResponse extends $pb.GeneratedMessage {
  factory ListProjectsResponse({
    $core.Iterable<$3.Project>? projects,
    $2.PageResponse? page,
  }) {
    final result = ListProjectsResponse._();
    if (projects != null) result.projects.addAll(projects);
    if (page != null) result.page = page;
    return result;
  }

  ListProjectsResponse._();

  factory ListProjectsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListProjectsResponse()..mergeFromBuffer(data, registry);
  factory ListProjectsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListProjectsResponse()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectsResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: ListProjectsResponse.$_createMessage)
    ..pPM<$3.Project>(1, _omitFieldNames ? '' : 'projects',
        subBuilder: $3.Project.$_createMessage)
    ..aOM<$2.PageResponse>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageResponse.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsResponse copyWith(void Function(ListProjectsResponse) updates) =>
      super.copyWith((message) => updates(message as ListProjectsResponse))
          as ListProjectsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListProjectsResponse() / ListProjectsResponse.new instead')
  static ListProjectsResponse create() => ListProjectsResponse._();
  static $pb.GeneratedMessage $_createMessage() => ListProjectsResponse._();
  @$core.override
  ListProjectsResponse createEmptyInstance() => ListProjectsResponse._();
  @$core.pragma('dart2js:noInline')
  static ListProjectsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectsResponse>(
          ListProjectsResponse.$_createMessage);
  static ListProjectsResponse? _defaultInstance;

  /// A page of the organization's projects. May be empty if none exist.
  @$pb.TagNumber(1)
  $pb.PbList<$3.Project> get projects => $_getList(0);

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

/// A tenant organization. The top-level owner of projects and billing.
class Organization extends $pb.GeneratedMessage {
  factory Organization({
    $0.OrganizationId? id,
    OrganizationProps? props,
  }) {
    final result = Organization._();
    if (id != null) result.id = id;
    if (props != null) result.props = props;
    return result;
  }

  Organization._();

  factory Organization.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Organization()..mergeFromBuffer(data, registry);
  factory Organization.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Organization()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Organization',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: Organization.$_createMessage)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.$_createMessage)
    ..aOM<OrganizationProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: OrganizationProps.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Organization clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Organization copyWith(void Function(Organization) updates) =>
      super.copyWith((message) => updates(message as Organization))
          as Organization;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use Organization() / Organization.new instead')
  static Organization create() => Organization._();
  static $pb.GeneratedMessage $_createMessage() => Organization._();
  @$core.override
  Organization createEmptyInstance() => Organization._();
  @$core.pragma('dart2js:noInline')
  static Organization getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Organization>(
          Organization.$_createMessage);
  static Organization? _defaultInstance;

  /// Id of this organization.
  @$pb.TagNumber(1)
  $0.OrganizationId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.OrganizationId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.OrganizationId ensureId() => $_ensure(0);

  /// Mutable org properties.
  @$pb.TagNumber(2)
  OrganizationProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(OrganizationProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  OrganizationProps ensureProps() => $_ensure(1);
}

/// The mutable properties of an organization.
class OrganizationProps extends $pb.GeneratedMessage {
  factory OrganizationProps({
    $core.String? name,
  }) {
    final result = OrganizationProps._();
    if (name != null) result.name = name;
    return result;
  }

  OrganizationProps._();

  factory OrganizationProps.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      OrganizationProps()..mergeFromBuffer(data, registry);
  factory OrganizationProps.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      OrganizationProps()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrganizationProps',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: OrganizationProps.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrganizationProps clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrganizationProps copyWith(void Function(OrganizationProps) updates) =>
      super.copyWith((message) => updates(message as OrganizationProps))
          as OrganizationProps;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use OrganizationProps() / OrganizationProps.new instead')
  static OrganizationProps create() => OrganizationProps._();
  static $pb.GeneratedMessage $_createMessage() => OrganizationProps._();
  @$core.override
  OrganizationProps createEmptyInstance() => OrganizationProps._();
  @$core.pragma('dart2js:noInline')
  static OrganizationProps getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrganizationProps>(
          OrganizationProps.$_createMessage);
  static OrganizationProps? _defaultInstance;

  /// Human-readable display name.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

/// Provides data plane functionality related to organizations.
class OrganizationServiceApi {
  final $pb.RpcClient _client;

  OrganizationServiceApi(this._client);

  /// Creates an organization.
  $async.Future<CreateOrganizationResponse> createOrganization(
          $pb.ClientContext? ctx, CreateOrganizationRequest request) =>
      _client.invoke<CreateOrganizationResponse>(ctx, 'OrganizationService',
          'CreateOrganization', request, CreateOrganizationResponse());

  /// Fetches an organization.
  $async.Future<GetOrganizationResponse> getOrganization(
          $pb.ClientContext? ctx, GetOrganizationRequest request) =>
      _client.invoke<GetOrganizationResponse>(ctx, 'OrganizationService',
          'GetOrganization', request, GetOrganizationResponse());

  /// Updates an organization's mutable properties.
  $async.Future<UpdateOrganizationResponse> updateOrganization(
          $pb.ClientContext? ctx, UpdateOrganizationRequest request) =>
      _client.invoke<UpdateOrganizationResponse>(ctx, 'OrganizationService',
          'UpdateOrganization', request, UpdateOrganizationResponse());

  /// Deletes an organization.
  $async.Future<DeleteOrganizationResponse> deleteOrganization(
          $pb.ClientContext? ctx, DeleteOrganizationRequest request) =>
      _client.invoke<DeleteOrganizationResponse>(ctx, 'OrganizationService',
          'DeleteOrganization', request, DeleteOrganizationResponse());

  /// Lists the projects belonging to an organization.
  $async.Future<ListProjectsResponse> listProjects(
          $pb.ClientContext? ctx, ListProjectsRequest request) =>
      _client.invoke<ListProjectsResponse>(ctx, 'OrganizationService',
          'ListProjects', request, ListProjectsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
