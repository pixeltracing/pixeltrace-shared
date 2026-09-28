// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/organization.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/field_mask.pb.dart' as $1;
import '../../types/v1/types.pb.dart' as $0;
import 'project.pb.dart' as $3;
import 'types.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Request to create an organization.
class CreateOrganizationRequest extends $pb.GeneratedMessage {
  factory CreateOrganizationRequest({
    OrganizationProps? props,
  }) {
    final result = create();
    if (props != null) result.props = props;
    return result;
  }

  CreateOrganizationRequest._();

  factory CreateOrganizationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateOrganizationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrganizationRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<OrganizationProps>(1, _omitFieldNames ? '' : 'props',
        subBuilder: OrganizationProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrganizationRequest clone() =>
      CreateOrganizationRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrganizationRequest copyWith(
          void Function(CreateOrganizationRequest) updates) =>
      super.copyWith((message) => updates(message as CreateOrganizationRequest))
          as CreateOrganizationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOrganizationRequest create() => CreateOrganizationRequest._();
  @$core.override
  CreateOrganizationRequest createEmptyInstance() => create();
  static $pb.PbList<CreateOrganizationRequest> createRepeated() =>
      $pb.PbList<CreateOrganizationRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateOrganizationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrganizationRequest>(create);
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
    final result = create();
    if (id != null) result.id = id;
    if (props != null) result.props = props;
    return result;
  }

  CreateOrganizationResponse._();

  factory CreateOrganizationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateOrganizationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrganizationResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.create)
    ..aOM<OrganizationProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: OrganizationProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrganizationResponse clone() =>
      CreateOrganizationResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrganizationResponse copyWith(
          void Function(CreateOrganizationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateOrganizationResponse))
          as CreateOrganizationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOrganizationResponse create() => CreateOrganizationResponse._();
  @$core.override
  CreateOrganizationResponse createEmptyInstance() => create();
  static $pb.PbList<CreateOrganizationResponse> createRepeated() =>
      $pb.PbList<CreateOrganizationResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateOrganizationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrganizationResponse>(create);
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
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  GetOrganizationRequest._();

  factory GetOrganizationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetOrganizationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetOrganizationRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrganizationRequest clone() =>
      GetOrganizationRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrganizationRequest copyWith(
          void Function(GetOrganizationRequest) updates) =>
      super.copyWith((message) => updates(message as GetOrganizationRequest))
          as GetOrganizationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOrganizationRequest create() => GetOrganizationRequest._();
  @$core.override
  GetOrganizationRequest createEmptyInstance() => create();
  static $pb.PbList<GetOrganizationRequest> createRepeated() =>
      $pb.PbList<GetOrganizationRequest>();
  @$core.pragma('dart2js:noInline')
  static GetOrganizationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetOrganizationRequest>(create);
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
    final result = create();
    if (organization != null) result.organization = organization;
    return result;
  }

  GetOrganizationResponse._();

  factory GetOrganizationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetOrganizationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetOrganizationResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<Organization>(1, _omitFieldNames ? '' : 'organization',
        subBuilder: Organization.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrganizationResponse clone() =>
      GetOrganizationResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrganizationResponse copyWith(
          void Function(GetOrganizationResponse) updates) =>
      super.copyWith((message) => updates(message as GetOrganizationResponse))
          as GetOrganizationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOrganizationResponse create() => GetOrganizationResponse._();
  @$core.override
  GetOrganizationResponse createEmptyInstance() => create();
  static $pb.PbList<GetOrganizationResponse> createRepeated() =>
      $pb.PbList<GetOrganizationResponse>();
  @$core.pragma('dart2js:noInline')
  static GetOrganizationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetOrganizationResponse>(create);
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
    final result = create();
    if (id != null) result.id = id;
    if (props != null) result.props = props;
    if (updateMask != null) result.updateMask = updateMask;
    return result;
  }

  UpdateOrganizationRequest._();

  factory UpdateOrganizationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateOrganizationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateOrganizationRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.create)
    ..aOM<OrganizationProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: OrganizationProps.create)
    ..aOM<$1.FieldMask>(3, _omitFieldNames ? '' : 'updateMask',
        subBuilder: $1.FieldMask.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrganizationRequest clone() =>
      UpdateOrganizationRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrganizationRequest copyWith(
          void Function(UpdateOrganizationRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateOrganizationRequest))
          as UpdateOrganizationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateOrganizationRequest create() => UpdateOrganizationRequest._();
  @$core.override
  UpdateOrganizationRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateOrganizationRequest> createRepeated() =>
      $pb.PbList<UpdateOrganizationRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateOrganizationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateOrganizationRequest>(create);
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
    final result = create();
    if (organization != null) result.organization = organization;
    return result;
  }

  UpdateOrganizationResponse._();

  factory UpdateOrganizationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateOrganizationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateOrganizationResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<Organization>(1, _omitFieldNames ? '' : 'organization',
        subBuilder: Organization.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrganizationResponse clone() =>
      UpdateOrganizationResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrganizationResponse copyWith(
          void Function(UpdateOrganizationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateOrganizationResponse))
          as UpdateOrganizationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateOrganizationResponse create() => UpdateOrganizationResponse._();
  @$core.override
  UpdateOrganizationResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateOrganizationResponse> createRepeated() =>
      $pb.PbList<UpdateOrganizationResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateOrganizationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateOrganizationResponse>(create);
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
    final result = create();
    if (id != null) result.id = id;
    if (dangerouslyAllowProjectDeletion != null)
      result.dangerouslyAllowProjectDeletion = dangerouslyAllowProjectDeletion;
    return result;
  }

  DeleteOrganizationRequest._();

  factory DeleteOrganizationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteOrganizationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteOrganizationRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.create)
    ..aOB(2, _omitFieldNames ? '' : 'dangerouslyAllowProjectDeletion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrganizationRequest clone() =>
      DeleteOrganizationRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrganizationRequest copyWith(
          void Function(DeleteOrganizationRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteOrganizationRequest))
          as DeleteOrganizationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteOrganizationRequest create() => DeleteOrganizationRequest._();
  @$core.override
  DeleteOrganizationRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteOrganizationRequest> createRepeated() =>
      $pb.PbList<DeleteOrganizationRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteOrganizationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteOrganizationRequest>(create);
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
  factory DeleteOrganizationResponse() => create();

  DeleteOrganizationResponse._();

  factory DeleteOrganizationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteOrganizationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteOrganizationResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrganizationResponse clone() =>
      DeleteOrganizationResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrganizationResponse copyWith(
          void Function(DeleteOrganizationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteOrganizationResponse))
          as DeleteOrganizationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteOrganizationResponse create() => DeleteOrganizationResponse._();
  @$core.override
  DeleteOrganizationResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteOrganizationResponse> createRepeated() =>
      $pb.PbList<DeleteOrganizationResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteOrganizationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteOrganizationResponse>(create);
  static DeleteOrganizationResponse? _defaultInstance;
}

/// Request to list the projects belonging to an organization.
class ListProjectsRequest extends $pb.GeneratedMessage {
  factory ListProjectsRequest({
    $0.OrganizationId? orgId,
    $2.PageRequest? page,
  }) {
    final result = create();
    if (orgId != null) result.orgId = orgId;
    if (page != null) result.page = page;
    return result;
  }

  ListProjectsRequest._();

  factory ListProjectsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListProjectsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectsRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'orgId',
        subBuilder: $0.OrganizationId.create)
    ..aOM<$2.PageRequest>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsRequest clone() => ListProjectsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsRequest copyWith(void Function(ListProjectsRequest) updates) =>
      super.copyWith((message) => updates(message as ListProjectsRequest))
          as ListProjectsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectsRequest create() => ListProjectsRequest._();
  @$core.override
  ListProjectsRequest createEmptyInstance() => create();
  static $pb.PbList<ListProjectsRequest> createRepeated() =>
      $pb.PbList<ListProjectsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListProjectsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectsRequest>(create);
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
    final result = create();
    if (projects != null) result.projects.addAll(projects);
    if (page != null) result.page = page;
    return result;
  }

  ListProjectsResponse._();

  factory ListProjectsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListProjectsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectsResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..pc<$3.Project>(1, _omitFieldNames ? '' : 'projects', $pb.PbFieldType.PM,
        subBuilder: $3.Project.create)
    ..aOM<$2.PageResponse>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsResponse clone() =>
      ListProjectsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsResponse copyWith(void Function(ListProjectsResponse) updates) =>
      super.copyWith((message) => updates(message as ListProjectsResponse))
          as ListProjectsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectsResponse create() => ListProjectsResponse._();
  @$core.override
  ListProjectsResponse createEmptyInstance() => create();
  static $pb.PbList<ListProjectsResponse> createRepeated() =>
      $pb.PbList<ListProjectsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListProjectsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectsResponse>(create);
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
    final result = create();
    if (id != null) result.id = id;
    if (props != null) result.props = props;
    return result;
  }

  Organization._();

  factory Organization.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Organization.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Organization',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.OrganizationId.create)
    ..aOM<OrganizationProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: OrganizationProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Organization clone() => Organization()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Organization copyWith(void Function(Organization) updates) =>
      super.copyWith((message) => updates(message as Organization))
          as Organization;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Organization create() => Organization._();
  @$core.override
  Organization createEmptyInstance() => create();
  static $pb.PbList<Organization> createRepeated() =>
      $pb.PbList<Organization>();
  @$core.pragma('dart2js:noInline')
  static Organization getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Organization>(create);
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
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  OrganizationProps._();

  factory OrganizationProps.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OrganizationProps.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrganizationProps',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrganizationProps clone() => OrganizationProps()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrganizationProps copyWith(void Function(OrganizationProps) updates) =>
      super.copyWith((message) => updates(message as OrganizationProps))
          as OrganizationProps;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrganizationProps create() => OrganizationProps._();
  @$core.override
  OrganizationProps createEmptyInstance() => create();
  static $pb.PbList<OrganizationProps> createRepeated() =>
      $pb.PbList<OrganizationProps>();
  @$core.pragma('dart2js:noInline')
  static OrganizationProps getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OrganizationProps>(create);
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
