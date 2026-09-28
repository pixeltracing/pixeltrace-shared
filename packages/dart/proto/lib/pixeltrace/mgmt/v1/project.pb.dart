// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/project.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/duration.pb.dart' as $4;
import '../../../google/protobuf/field_mask.pb.dart' as $1;
import '../../../google/protobuf/timestamp.pb.dart' as $3;
import '../../data/v1/types.pbenum.dart' as $5;
import '../../types/v1/types.pb.dart' as $0;
import 'membership.pbenum.dart' as $6;
import 'project.pbenum.dart';
import 'types.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'project.pbenum.dart';

/// Request to create a project.
class CreateProjectRequest extends $pb.GeneratedMessage {
  factory CreateProjectRequest({
    $0.OrganizationId? orgId,
    $5.DataResidency? dataResidency,
    $5.StorageBackend? storageBackend,
    ProjectProps? props,
  }) {
    final result = create();
    if (orgId != null) result.orgId = orgId;
    if (dataResidency != null) result.dataResidency = dataResidency;
    if (storageBackend != null) result.storageBackend = storageBackend;
    if (props != null) result.props = props;
    return result;
  }

  CreateProjectRequest._();

  factory CreateProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateProjectRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.OrganizationId>(1, _omitFieldNames ? '' : 'orgId',
        subBuilder: $0.OrganizationId.create)
    ..e<$5.DataResidency>(
        2, _omitFieldNames ? '' : 'dataResidency', $pb.PbFieldType.OE,
        defaultOrMaker: $5.DataResidency.DATA_RESIDENCY_UNSPECIFIED,
        valueOf: $5.DataResidency.valueOf,
        enumValues: $5.DataResidency.values)
    ..e<$5.StorageBackend>(
        3, _omitFieldNames ? '' : 'storageBackend', $pb.PbFieldType.OE,
        defaultOrMaker: $5.StorageBackend.STORAGE_BACKEND_UNSPECIFIED,
        valueOf: $5.StorageBackend.valueOf,
        enumValues: $5.StorageBackend.values)
    ..aOM<ProjectProps>(4, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectRequest clone() =>
      CreateProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectRequest copyWith(void Function(CreateProjectRequest) updates) =>
      super.copyWith((message) => updates(message as CreateProjectRequest))
          as CreateProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateProjectRequest create() => CreateProjectRequest._();
  @$core.override
  CreateProjectRequest createEmptyInstance() => create();
  static $pb.PbList<CreateProjectRequest> createRepeated() =>
      $pb.PbList<CreateProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateProjectRequest>(create);
  static CreateProjectRequest? _defaultInstance;

  /// The organization to create the project under.
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

  /// Where the project's data must reside.
  @$pb.TagNumber(2)
  $5.DataResidency get dataResidency => $_getN(1);
  @$pb.TagNumber(2)
  set dataResidency($5.DataResidency value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDataResidency() => $_has(1);
  @$pb.TagNumber(2)
  void clearDataResidency() => $_clearField(2);

  /// Which storage backend the project uses.
  @$pb.TagNumber(3)
  $5.StorageBackend get storageBackend => $_getN(2);
  @$pb.TagNumber(3)
  set storageBackend($5.StorageBackend value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStorageBackend() => $_has(2);
  @$pb.TagNumber(3)
  void clearStorageBackend() => $_clearField(3);

  /// Properties for the new project.
  @$pb.TagNumber(4)
  ProjectProps get props => $_getN(3);
  @$pb.TagNumber(4)
  set props(ProjectProps value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasProps() => $_has(3);
  @$pb.TagNumber(4)
  void clearProps() => $_clearField(4);
  @$pb.TagNumber(4)
  ProjectProps ensureProps() => $_ensure(3);
}

/// Response to a create-project request.
class CreateProjectResponse extends $pb.GeneratedMessage {
  factory CreateProjectResponse({
    Project? project,
  }) {
    final result = create();
    if (project != null) result.project = project;
    return result;
  }

  CreateProjectResponse._();

  factory CreateProjectResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateProjectResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateProjectResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<Project>(1, _omitFieldNames ? '' : 'project',
        subBuilder: Project.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectResponse clone() =>
      CreateProjectResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectResponse copyWith(
          void Function(CreateProjectResponse) updates) =>
      super.copyWith((message) => updates(message as CreateProjectResponse))
          as CreateProjectResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateProjectResponse create() => CreateProjectResponse._();
  @$core.override
  CreateProjectResponse createEmptyInstance() => create();
  static $pb.PbList<CreateProjectResponse> createRepeated() =>
      $pb.PbList<CreateProjectResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateProjectResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateProjectResponse>(create);
  static CreateProjectResponse? _defaultInstance;

  /// The newly created project, including its assigned id.
  @$pb.TagNumber(1)
  Project get project => $_getN(0);
  @$pb.TagNumber(1)
  set project(Project value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProject() => $_has(0);
  @$pb.TagNumber(1)
  void clearProject() => $_clearField(1);
  @$pb.TagNumber(1)
  Project ensureProject() => $_ensure(0);
}

/// Request to fetch a project.
class GetProjectRequest extends $pb.GeneratedMessage {
  factory GetProjectRequest({
    $0.ProjectId? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  GetProjectRequest._();

  factory GetProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProjectRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.ProjectId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectRequest clone() => GetProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectRequest copyWith(void Function(GetProjectRequest) updates) =>
      super.copyWith((message) => updates(message as GetProjectRequest))
          as GetProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProjectRequest create() => GetProjectRequest._();
  @$core.override
  GetProjectRequest createEmptyInstance() => create();
  static $pb.PbList<GetProjectRequest> createRepeated() =>
      $pb.PbList<GetProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProjectRequest>(create);
  static GetProjectRequest? _defaultInstance;

  /// Id of the project to fetch.
  @$pb.TagNumber(1)
  $0.ProjectId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureId() => $_ensure(0);
}

/// Response to a get-project request.
class GetProjectResponse extends $pb.GeneratedMessage {
  factory GetProjectResponse({
    Project? project,
  }) {
    final result = create();
    if (project != null) result.project = project;
    return result;
  }

  GetProjectResponse._();

  factory GetProjectResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProjectResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProjectResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<Project>(1, _omitFieldNames ? '' : 'project',
        subBuilder: Project.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectResponse clone() => GetProjectResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectResponse copyWith(void Function(GetProjectResponse) updates) =>
      super.copyWith((message) => updates(message as GetProjectResponse))
          as GetProjectResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProjectResponse create() => GetProjectResponse._();
  @$core.override
  GetProjectResponse createEmptyInstance() => create();
  static $pb.PbList<GetProjectResponse> createRepeated() =>
      $pb.PbList<GetProjectResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProjectResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProjectResponse>(create);
  static GetProjectResponse? _defaultInstance;

  /// The requested project.
  @$pb.TagNumber(1)
  Project get project => $_getN(0);
  @$pb.TagNumber(1)
  set project(Project value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProject() => $_has(0);
  @$pb.TagNumber(1)
  void clearProject() => $_clearField(1);
  @$pb.TagNumber(1)
  Project ensureProject() => $_ensure(0);
}

/// Request to update a project's properties.
class UpdateProjectRequest extends $pb.GeneratedMessage {
  factory UpdateProjectRequest({
    $0.ProjectId? id,
    ProjectProps? props,
    $1.FieldMask? updateMask,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (props != null) result.props = props;
    if (updateMask != null) result.updateMask = updateMask;
    return result;
  }

  UpdateProjectRequest._();

  factory UpdateProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProjectRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.ProjectId.create)
    ..aOM<ProjectProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectProps.create)
    ..aOM<$1.FieldMask>(3, _omitFieldNames ? '' : 'updateMask',
        subBuilder: $1.FieldMask.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectRequest clone() =>
      UpdateProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectRequest copyWith(void Function(UpdateProjectRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateProjectRequest))
          as UpdateProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProjectRequest create() => UpdateProjectRequest._();
  @$core.override
  UpdateProjectRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProjectRequest> createRepeated() =>
      $pb.PbList<UpdateProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProjectRequest>(create);
  static UpdateProjectRequest? _defaultInstance;

  /// Id of the project to update.
  @$pb.TagNumber(1)
  $0.ProjectId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureId() => $_ensure(0);

  /// The new property values. Only fields named in update_mask are applied.
  @$pb.TagNumber(2)
  ProjectProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(ProjectProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  ProjectProps ensureProps() => $_ensure(1);

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

/// Response to an update-project request.
class UpdateProjectResponse extends $pb.GeneratedMessage {
  factory UpdateProjectResponse({
    Project? project,
  }) {
    final result = create();
    if (project != null) result.project = project;
    return result;
  }

  UpdateProjectResponse._();

  factory UpdateProjectResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProjectResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProjectResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<Project>(1, _omitFieldNames ? '' : 'project',
        subBuilder: Project.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectResponse clone() =>
      UpdateProjectResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectResponse copyWith(
          void Function(UpdateProjectResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateProjectResponse))
          as UpdateProjectResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProjectResponse create() => UpdateProjectResponse._();
  @$core.override
  UpdateProjectResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProjectResponse> createRepeated() =>
      $pb.PbList<UpdateProjectResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProjectResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProjectResponse>(create);
  static UpdateProjectResponse? _defaultInstance;

  /// The project after the update.
  @$pb.TagNumber(1)
  Project get project => $_getN(0);
  @$pb.TagNumber(1)
  set project(Project value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProject() => $_has(0);
  @$pb.TagNumber(1)
  void clearProject() => $_clearField(1);
  @$pb.TagNumber(1)
  Project ensureProject() => $_ensure(0);
}

/// Request to delete a project.
class DeleteProjectRequest extends $pb.GeneratedMessage {
  factory DeleteProjectRequest({
    $0.ProjectId? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  DeleteProjectRequest._();

  factory DeleteProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteProjectRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.ProjectId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectRequest clone() =>
      DeleteProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectRequest copyWith(void Function(DeleteProjectRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteProjectRequest))
          as DeleteProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProjectRequest create() => DeleteProjectRequest._();
  @$core.override
  DeleteProjectRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteProjectRequest> createRepeated() =>
      $pb.PbList<DeleteProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteProjectRequest>(create);
  static DeleteProjectRequest? _defaultInstance;

  /// Id of the project to delete.
  @$pb.TagNumber(1)
  $0.ProjectId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureId() => $_ensure(0);
}

/// Response to a delete-project request.
class DeleteProjectResponse extends $pb.GeneratedMessage {
  factory DeleteProjectResponse() => create();

  DeleteProjectResponse._();

  factory DeleteProjectResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteProjectResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteProjectResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectResponse clone() =>
      DeleteProjectResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectResponse copyWith(
          void Function(DeleteProjectResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteProjectResponse))
          as DeleteProjectResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProjectResponse create() => DeleteProjectResponse._();
  @$core.override
  DeleteProjectResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteProjectResponse> createRepeated() =>
      $pb.PbList<DeleteProjectResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteProjectResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteProjectResponse>(create);
  static DeleteProjectResponse? _defaultInstance;
}

/// Request to issue a new site key for a project.
class CreateSiteKeyRequest extends $pb.GeneratedMessage {
  factory CreateSiteKeyRequest({
    $0.ProjectId? projectId,
    ProjectSiteKeyProps? props,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (props != null) result.props = props;
    return result;
  }

  CreateSiteKeyRequest._();

  factory CreateSiteKeyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSiteKeyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSiteKeyRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<ProjectSiteKeyProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectSiteKeyProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSiteKeyRequest clone() =>
      CreateSiteKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSiteKeyRequest copyWith(void Function(CreateSiteKeyRequest) updates) =>
      super.copyWith((message) => updates(message as CreateSiteKeyRequest))
          as CreateSiteKeyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSiteKeyRequest create() => CreateSiteKeyRequest._();
  @$core.override
  CreateSiteKeyRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSiteKeyRequest> createRepeated() =>
      $pb.PbList<CreateSiteKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSiteKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSiteKeyRequest>(create);
  static CreateSiteKeyRequest? _defaultInstance;

  /// The project to issue the key for.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// Properties for the new site key.
  @$pb.TagNumber(2)
  ProjectSiteKeyProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(ProjectSiteKeyProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  ProjectSiteKeyProps ensureProps() => $_ensure(1);
}

/// Response to a create-site-key request.
class CreateSiteKeyResponse extends $pb.GeneratedMessage {
  factory CreateSiteKeyResponse({
    ProjectSiteKey? siteKey,
  }) {
    final result = create();
    if (siteKey != null) result.siteKey = siteKey;
    return result;
  }

  CreateSiteKeyResponse._();

  factory CreateSiteKeyResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSiteKeyResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSiteKeyResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectSiteKey>(1, _omitFieldNames ? '' : 'siteKey',
        subBuilder: ProjectSiteKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSiteKeyResponse clone() =>
      CreateSiteKeyResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSiteKeyResponse copyWith(
          void Function(CreateSiteKeyResponse) updates) =>
      super.copyWith((message) => updates(message as CreateSiteKeyResponse))
          as CreateSiteKeyResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSiteKeyResponse create() => CreateSiteKeyResponse._();
  @$core.override
  CreateSiteKeyResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSiteKeyResponse> createRepeated() =>
      $pb.PbList<CreateSiteKeyResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSiteKeyResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSiteKeyResponse>(create);
  static CreateSiteKeyResponse? _defaultInstance;

  /// The newly issued site key.
  @$pb.TagNumber(1)
  ProjectSiteKey get siteKey => $_getN(0);
  @$pb.TagNumber(1)
  set siteKey(ProjectSiteKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteKey() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectSiteKey ensureSiteKey() => $_ensure(0);
}

/// Request to fetch a single site key.
class GetSiteKeyRequest extends $pb.GeneratedMessage {
  factory GetSiteKeyRequest({
    $0.ProjectId? projectId,
    $0.SiteKey? key,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (key != null) result.key = key;
    return result;
  }

  GetSiteKeyRequest._();

  factory GetSiteKeyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSiteKeyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSiteKeyRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SiteKey>(2, _omitFieldNames ? '' : 'key',
        subBuilder: $0.SiteKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSiteKeyRequest clone() => GetSiteKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSiteKeyRequest copyWith(void Function(GetSiteKeyRequest) updates) =>
      super.copyWith((message) => updates(message as GetSiteKeyRequest))
          as GetSiteKeyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSiteKeyRequest create() => GetSiteKeyRequest._();
  @$core.override
  GetSiteKeyRequest createEmptyInstance() => create();
  static $pb.PbList<GetSiteKeyRequest> createRepeated() =>
      $pb.PbList<GetSiteKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSiteKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSiteKeyRequest>(create);
  static GetSiteKeyRequest? _defaultInstance;

  /// The project the key belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The site key to fetch.
  @$pb.TagNumber(2)
  $0.SiteKey get key => $_getN(1);
  @$pb.TagNumber(2)
  set key($0.SiteKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SiteKey ensureKey() => $_ensure(1);
}

/// Response to a get-site-key request.
class GetSiteKeyResponse extends $pb.GeneratedMessage {
  factory GetSiteKeyResponse({
    ProjectSiteKey? siteKey,
  }) {
    final result = create();
    if (siteKey != null) result.siteKey = siteKey;
    return result;
  }

  GetSiteKeyResponse._();

  factory GetSiteKeyResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSiteKeyResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSiteKeyResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectSiteKey>(1, _omitFieldNames ? '' : 'siteKey',
        subBuilder: ProjectSiteKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSiteKeyResponse clone() => GetSiteKeyResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSiteKeyResponse copyWith(void Function(GetSiteKeyResponse) updates) =>
      super.copyWith((message) => updates(message as GetSiteKeyResponse))
          as GetSiteKeyResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSiteKeyResponse create() => GetSiteKeyResponse._();
  @$core.override
  GetSiteKeyResponse createEmptyInstance() => create();
  static $pb.PbList<GetSiteKeyResponse> createRepeated() =>
      $pb.PbList<GetSiteKeyResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSiteKeyResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSiteKeyResponse>(create);
  static GetSiteKeyResponse? _defaultInstance;

  /// The requested site key.
  @$pb.TagNumber(1)
  ProjectSiteKey get siteKey => $_getN(0);
  @$pb.TagNumber(1)
  set siteKey(ProjectSiteKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteKey() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectSiteKey ensureSiteKey() => $_ensure(0);
}

/// Request to list a project's site keys.
class ListSiteKeysRequest extends $pb.GeneratedMessage {
  factory ListSiteKeysRequest({
    $0.ProjectId? projectId,
    $2.PageRequest? page,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (page != null) result.page = page;
    return result;
  }

  ListSiteKeysRequest._();

  factory ListSiteKeysRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSiteKeysRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSiteKeysRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$2.PageRequest>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSiteKeysRequest clone() => ListSiteKeysRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSiteKeysRequest copyWith(void Function(ListSiteKeysRequest) updates) =>
      super.copyWith((message) => updates(message as ListSiteKeysRequest))
          as ListSiteKeysRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSiteKeysRequest create() => ListSiteKeysRequest._();
  @$core.override
  ListSiteKeysRequest createEmptyInstance() => create();
  static $pb.PbList<ListSiteKeysRequest> createRepeated() =>
      $pb.PbList<ListSiteKeysRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSiteKeysRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSiteKeysRequest>(create);
  static ListSiteKeysRequest? _defaultInstance;

  /// The project whose site keys to list.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

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

/// Response to a list-site-keys request.
class ListSiteKeysResponse extends $pb.GeneratedMessage {
  factory ListSiteKeysResponse({
    $core.Iterable<ProjectSiteKey>? siteKeys,
    $2.PageResponse? page,
  }) {
    final result = create();
    if (siteKeys != null) result.siteKeys.addAll(siteKeys);
    if (page != null) result.page = page;
    return result;
  }

  ListSiteKeysResponse._();

  factory ListSiteKeysResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSiteKeysResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSiteKeysResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..pc<ProjectSiteKey>(
        1, _omitFieldNames ? '' : 'siteKeys', $pb.PbFieldType.PM,
        subBuilder: ProjectSiteKey.create)
    ..aOM<$2.PageResponse>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSiteKeysResponse clone() =>
      ListSiteKeysResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSiteKeysResponse copyWith(void Function(ListSiteKeysResponse) updates) =>
      super.copyWith((message) => updates(message as ListSiteKeysResponse))
          as ListSiteKeysResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSiteKeysResponse create() => ListSiteKeysResponse._();
  @$core.override
  ListSiteKeysResponse createEmptyInstance() => create();
  static $pb.PbList<ListSiteKeysResponse> createRepeated() =>
      $pb.PbList<ListSiteKeysResponse>();
  @$core.pragma('dart2js:noInline')
  static ListSiteKeysResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSiteKeysResponse>(create);
  static ListSiteKeysResponse? _defaultInstance;

  /// A page of the project's site keys. May be empty before any key is issued.
  @$pb.TagNumber(1)
  $pb.PbList<ProjectSiteKey> get siteKeys => $_getList(0);

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

/// Request to update a site key's mutable properties.
class UpdateSiteKeyRequest extends $pb.GeneratedMessage {
  factory UpdateSiteKeyRequest({
    $0.ProjectId? projectId,
    $0.SiteKey? key,
    ProjectSiteKeyProps? props,
    $1.FieldMask? updateMask,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (key != null) result.key = key;
    if (props != null) result.props = props;
    if (updateMask != null) result.updateMask = updateMask;
    return result;
  }

  UpdateSiteKeyRequest._();

  factory UpdateSiteKeyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSiteKeyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSiteKeyRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SiteKey>(2, _omitFieldNames ? '' : 'key',
        subBuilder: $0.SiteKey.create)
    ..aOM<ProjectSiteKeyProps>(3, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectSiteKeyProps.create)
    ..aOM<$1.FieldMask>(4, _omitFieldNames ? '' : 'updateMask',
        subBuilder: $1.FieldMask.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSiteKeyRequest clone() =>
      UpdateSiteKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSiteKeyRequest copyWith(void Function(UpdateSiteKeyRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateSiteKeyRequest))
          as UpdateSiteKeyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSiteKeyRequest create() => UpdateSiteKeyRequest._();
  @$core.override
  UpdateSiteKeyRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSiteKeyRequest> createRepeated() =>
      $pb.PbList<UpdateSiteKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSiteKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSiteKeyRequest>(create);
  static UpdateSiteKeyRequest? _defaultInstance;

  /// The project the key belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The site key to update.
  @$pb.TagNumber(2)
  $0.SiteKey get key => $_getN(1);
  @$pb.TagNumber(2)
  set key($0.SiteKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SiteKey ensureKey() => $_ensure(1);

  /// The new property values. Only fields named in update_mask are applied.
  @$pb.TagNumber(3)
  ProjectSiteKeyProps get props => $_getN(2);
  @$pb.TagNumber(3)
  set props(ProjectSiteKeyProps value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasProps() => $_has(2);
  @$pb.TagNumber(3)
  void clearProps() => $_clearField(3);
  @$pb.TagNumber(3)
  ProjectSiteKeyProps ensureProps() => $_ensure(2);

  /// Which fields of props to update. If empty, all fields are replaced.
  @$pb.TagNumber(4)
  $1.FieldMask get updateMask => $_getN(3);
  @$pb.TagNumber(4)
  set updateMask($1.FieldMask value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUpdateMask() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateMask() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.FieldMask ensureUpdateMask() => $_ensure(3);
}

/// Response to an update-site-key request.
class UpdateSiteKeyResponse extends $pb.GeneratedMessage {
  factory UpdateSiteKeyResponse({
    ProjectSiteKey? siteKey,
  }) {
    final result = create();
    if (siteKey != null) result.siteKey = siteKey;
    return result;
  }

  UpdateSiteKeyResponse._();

  factory UpdateSiteKeyResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSiteKeyResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSiteKeyResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectSiteKey>(1, _omitFieldNames ? '' : 'siteKey',
        subBuilder: ProjectSiteKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSiteKeyResponse clone() =>
      UpdateSiteKeyResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSiteKeyResponse copyWith(
          void Function(UpdateSiteKeyResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateSiteKeyResponse))
          as UpdateSiteKeyResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSiteKeyResponse create() => UpdateSiteKeyResponse._();
  @$core.override
  UpdateSiteKeyResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSiteKeyResponse> createRepeated() =>
      $pb.PbList<UpdateSiteKeyResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSiteKeyResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSiteKeyResponse>(create);
  static UpdateSiteKeyResponse? _defaultInstance;

  /// The site key after the update.
  @$pb.TagNumber(1)
  ProjectSiteKey get siteKey => $_getN(0);
  @$pb.TagNumber(1)
  set siteKey(ProjectSiteKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteKey() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectSiteKey ensureSiteKey() => $_ensure(0);
}

/// Request to revoke a project's site key.
class RevokeSiteKeyRequest extends $pb.GeneratedMessage {
  factory RevokeSiteKeyRequest({
    $0.ProjectId? projectId,
    $0.SiteKey? key,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (key != null) result.key = key;
    return result;
  }

  RevokeSiteKeyRequest._();

  factory RevokeSiteKeyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RevokeSiteKeyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RevokeSiteKeyRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SiteKey>(2, _omitFieldNames ? '' : 'key',
        subBuilder: $0.SiteKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RevokeSiteKeyRequest clone() =>
      RevokeSiteKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RevokeSiteKeyRequest copyWith(void Function(RevokeSiteKeyRequest) updates) =>
      super.copyWith((message) => updates(message as RevokeSiteKeyRequest))
          as RevokeSiteKeyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RevokeSiteKeyRequest create() => RevokeSiteKeyRequest._();
  @$core.override
  RevokeSiteKeyRequest createEmptyInstance() => create();
  static $pb.PbList<RevokeSiteKeyRequest> createRepeated() =>
      $pb.PbList<RevokeSiteKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static RevokeSiteKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RevokeSiteKeyRequest>(create);
  static RevokeSiteKeyRequest? _defaultInstance;

  /// The project the key belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The site key to revoke.
  @$pb.TagNumber(2)
  $0.SiteKey get key => $_getN(1);
  @$pb.TagNumber(2)
  set key($0.SiteKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SiteKey ensureKey() => $_ensure(1);
}

/// Response to a revoke-site-key request.
class RevokeSiteKeyResponse extends $pb.GeneratedMessage {
  factory RevokeSiteKeyResponse() => create();

  RevokeSiteKeyResponse._();

  factory RevokeSiteKeyResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RevokeSiteKeyResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RevokeSiteKeyResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RevokeSiteKeyResponse clone() =>
      RevokeSiteKeyResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RevokeSiteKeyResponse copyWith(
          void Function(RevokeSiteKeyResponse) updates) =>
      super.copyWith((message) => updates(message as RevokeSiteKeyResponse))
          as RevokeSiteKeyResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RevokeSiteKeyResponse create() => RevokeSiteKeyResponse._();
  @$core.override
  RevokeSiteKeyResponse createEmptyInstance() => create();
  static $pb.PbList<RevokeSiteKeyResponse> createRepeated() =>
      $pb.PbList<RevokeSiteKeyResponse>();
  @$core.pragma('dart2js:noInline')
  static RevokeSiteKeyResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RevokeSiteKeyResponse>(create);
  static RevokeSiteKeyResponse? _defaultInstance;
}

/// Request to define a new tag for a project.
class CreateProjectTagRequest extends $pb.GeneratedMessage {
  factory CreateProjectTagRequest({
    $0.ProjectId? projectId,
    ProjectTagProps? props,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (props != null) result.props = props;
    return result;
  }

  CreateProjectTagRequest._();

  factory CreateProjectTagRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateProjectTagRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateProjectTagRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<ProjectTagProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectTagProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectTagRequest clone() =>
      CreateProjectTagRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectTagRequest copyWith(
          void Function(CreateProjectTagRequest) updates) =>
      super.copyWith((message) => updates(message as CreateProjectTagRequest))
          as CreateProjectTagRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateProjectTagRequest create() => CreateProjectTagRequest._();
  @$core.override
  CreateProjectTagRequest createEmptyInstance() => create();
  static $pb.PbList<CreateProjectTagRequest> createRepeated() =>
      $pb.PbList<CreateProjectTagRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateProjectTagRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateProjectTagRequest>(create);
  static CreateProjectTagRequest? _defaultInstance;

  /// The project to define the tag for.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// Properties for the new tag.
  @$pb.TagNumber(2)
  ProjectTagProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(ProjectTagProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  ProjectTagProps ensureProps() => $_ensure(1);
}

/// Response to a create-project-tag request.
class CreateProjectTagResponse extends $pb.GeneratedMessage {
  factory CreateProjectTagResponse({
    ProjectTag? tag,
  }) {
    final result = create();
    if (tag != null) result.tag = tag;
    return result;
  }

  CreateProjectTagResponse._();

  factory CreateProjectTagResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateProjectTagResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateProjectTagResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectTag>(1, _omitFieldNames ? '' : 'tag',
        subBuilder: ProjectTag.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectTagResponse clone() =>
      CreateProjectTagResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectTagResponse copyWith(
          void Function(CreateProjectTagResponse) updates) =>
      super.copyWith((message) => updates(message as CreateProjectTagResponse))
          as CreateProjectTagResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateProjectTagResponse create() => CreateProjectTagResponse._();
  @$core.override
  CreateProjectTagResponse createEmptyInstance() => create();
  static $pb.PbList<CreateProjectTagResponse> createRepeated() =>
      $pb.PbList<CreateProjectTagResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateProjectTagResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateProjectTagResponse>(create);
  static CreateProjectTagResponse? _defaultInstance;

  /// The newly defined tag, including its assigned id.
  @$pb.TagNumber(1)
  ProjectTag get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag(ProjectTag value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectTag ensureTag() => $_ensure(0);
}

/// Request to list a project's tag definitions.
class ListProjectTagsRequest extends $pb.GeneratedMessage {
  factory ListProjectTagsRequest({
    $0.ProjectId? projectId,
    $core.bool? includeSessionCounts,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (includeSessionCounts != null)
      result.includeSessionCounts = includeSessionCounts;
    return result;
  }

  ListProjectTagsRequest._();

  factory ListProjectTagsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListProjectTagsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectTagsRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOB(2, _omitFieldNames ? '' : 'includeSessionCounts')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectTagsRequest clone() =>
      ListProjectTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectTagsRequest copyWith(
          void Function(ListProjectTagsRequest) updates) =>
      super.copyWith((message) => updates(message as ListProjectTagsRequest))
          as ListProjectTagsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectTagsRequest create() => ListProjectTagsRequest._();
  @$core.override
  ListProjectTagsRequest createEmptyInstance() => create();
  static $pb.PbList<ListProjectTagsRequest> createRepeated() =>
      $pb.PbList<ListProjectTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListProjectTagsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectTagsRequest>(create);
  static ListProjectTagsRequest? _defaultInstance;

  /// The project whose tags to list.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// Include session_counts in the response.
  @$pb.TagNumber(2)
  $core.bool get includeSessionCounts => $_getBF(1);
  @$pb.TagNumber(2)
  set includeSessionCounts($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIncludeSessionCounts() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludeSessionCounts() => $_clearField(2);
}

/// Response to a list-project-tags request.
class ListProjectTagsResponse extends $pb.GeneratedMessage {
  factory ListProjectTagsResponse({
    $core.Iterable<ProjectTag>? tags,
    $core.Iterable<$core.MapEntry<$core.String, $core.int>>? sessionCounts,
  }) {
    final result = create();
    if (tags != null) result.tags.addAll(tags);
    if (sessionCounts != null) result.sessionCounts.addEntries(sessionCounts);
    return result;
  }

  ListProjectTagsResponse._();

  factory ListProjectTagsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListProjectTagsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectTagsResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..pc<ProjectTag>(1, _omitFieldNames ? '' : 'tags', $pb.PbFieldType.PM,
        subBuilder: ProjectTag.create)
    ..m<$core.String, $core.int>(2, _omitFieldNames ? '' : 'sessionCounts',
        entryClassName: 'ListProjectTagsResponse.SessionCountsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OU3,
        packageName: const $pb.PackageName('pixeltrace.mgmt.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectTagsResponse clone() =>
      ListProjectTagsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectTagsResponse copyWith(
          void Function(ListProjectTagsResponse) updates) =>
      super.copyWith((message) => updates(message as ListProjectTagsResponse))
          as ListProjectTagsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectTagsResponse create() => ListProjectTagsResponse._();
  @$core.override
  ListProjectTagsResponse createEmptyInstance() => create();
  static $pb.PbList<ListProjectTagsResponse> createRepeated() =>
      $pb.PbList<ListProjectTagsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListProjectTagsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectTagsResponse>(create);
  static ListProjectTagsResponse? _defaultInstance;

  /// The project's tags, ordered by label. May be empty if none are defined.
  @$pb.TagNumber(1)
  $pb.PbList<ProjectTag> get tags => $_getList(0);

  /// How many of the project's sessions carry each tag. Keyed by the raw id
  /// string of a ProjectTagId, since a proto map key cannot be a message.
  /// Empty unless the request asked for counts, which is not the same as every
  /// tag being unused.
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.int> get sessionCounts => $_getMap(1);
}

/// Request to update a project tag's mutable properties.
class UpdateProjectTagRequest extends $pb.GeneratedMessage {
  factory UpdateProjectTagRequest({
    $0.ProjectId? projectId,
    $0.ProjectTagId? id,
    ProjectTagProps? props,
    $1.FieldMask? updateMask,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (id != null) result.id = id;
    if (props != null) result.props = props;
    if (updateMask != null) result.updateMask = updateMask;
    return result;
  }

  UpdateProjectTagRequest._();

  factory UpdateProjectTagRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProjectTagRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProjectTagRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.ProjectTagId>(2, _omitFieldNames ? '' : 'id',
        subBuilder: $0.ProjectTagId.create)
    ..aOM<ProjectTagProps>(3, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectTagProps.create)
    ..aOM<$1.FieldMask>(4, _omitFieldNames ? '' : 'updateMask',
        subBuilder: $1.FieldMask.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectTagRequest clone() =>
      UpdateProjectTagRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectTagRequest copyWith(
          void Function(UpdateProjectTagRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateProjectTagRequest))
          as UpdateProjectTagRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProjectTagRequest create() => UpdateProjectTagRequest._();
  @$core.override
  UpdateProjectTagRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProjectTagRequest> createRepeated() =>
      $pb.PbList<UpdateProjectTagRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProjectTagRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProjectTagRequest>(create);
  static UpdateProjectTagRequest? _defaultInstance;

  /// The project the tag belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The tag to update.
  @$pb.TagNumber(2)
  $0.ProjectTagId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($0.ProjectTagId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.ProjectTagId ensureId() => $_ensure(1);

  /// The new property values. Only fields named in update_mask are applied.
  @$pb.TagNumber(3)
  ProjectTagProps get props => $_getN(2);
  @$pb.TagNumber(3)
  set props(ProjectTagProps value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasProps() => $_has(2);
  @$pb.TagNumber(3)
  void clearProps() => $_clearField(3);
  @$pb.TagNumber(3)
  ProjectTagProps ensureProps() => $_ensure(2);

  /// Which fields of props to update. If empty, all fields are replaced.
  @$pb.TagNumber(4)
  $1.FieldMask get updateMask => $_getN(3);
  @$pb.TagNumber(4)
  set updateMask($1.FieldMask value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUpdateMask() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateMask() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.FieldMask ensureUpdateMask() => $_ensure(3);
}

/// Response to an update-project-tag request.
class UpdateProjectTagResponse extends $pb.GeneratedMessage {
  factory UpdateProjectTagResponse({
    ProjectTag? tag,
  }) {
    final result = create();
    if (tag != null) result.tag = tag;
    return result;
  }

  UpdateProjectTagResponse._();

  factory UpdateProjectTagResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProjectTagResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProjectTagResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectTag>(1, _omitFieldNames ? '' : 'tag',
        subBuilder: ProjectTag.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectTagResponse clone() =>
      UpdateProjectTagResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectTagResponse copyWith(
          void Function(UpdateProjectTagResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateProjectTagResponse))
          as UpdateProjectTagResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProjectTagResponse create() => UpdateProjectTagResponse._();
  @$core.override
  UpdateProjectTagResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProjectTagResponse> createRepeated() =>
      $pb.PbList<UpdateProjectTagResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProjectTagResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProjectTagResponse>(create);
  static UpdateProjectTagResponse? _defaultInstance;

  /// The tag after the update.
  @$pb.TagNumber(1)
  ProjectTag get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag(ProjectTag value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectTag ensureTag() => $_ensure(0);
}

/// Request to delete a project tag.
class DeleteProjectTagRequest extends $pb.GeneratedMessage {
  factory DeleteProjectTagRequest({
    $0.ProjectId? projectId,
    $0.ProjectTagId? id,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (id != null) result.id = id;
    return result;
  }

  DeleteProjectTagRequest._();

  factory DeleteProjectTagRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteProjectTagRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteProjectTagRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.ProjectTagId>(2, _omitFieldNames ? '' : 'id',
        subBuilder: $0.ProjectTagId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectTagRequest clone() =>
      DeleteProjectTagRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectTagRequest copyWith(
          void Function(DeleteProjectTagRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteProjectTagRequest))
          as DeleteProjectTagRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProjectTagRequest create() => DeleteProjectTagRequest._();
  @$core.override
  DeleteProjectTagRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteProjectTagRequest> createRepeated() =>
      $pb.PbList<DeleteProjectTagRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteProjectTagRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteProjectTagRequest>(create);
  static DeleteProjectTagRequest? _defaultInstance;

  /// The project the tag belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The tag to delete.
  @$pb.TagNumber(2)
  $0.ProjectTagId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($0.ProjectTagId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.ProjectTagId ensureId() => $_ensure(1);
}

/// Response to a delete-project-tag request.
class DeleteProjectTagResponse extends $pb.GeneratedMessage {
  factory DeleteProjectTagResponse({
    $core.int? sessionsUntagged,
  }) {
    final result = create();
    if (sessionsUntagged != null) result.sessionsUntagged = sessionsUntagged;
    return result;
  }

  DeleteProjectTagResponse._();

  factory DeleteProjectTagResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteProjectTagResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteProjectTagResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'sessionsUntagged', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectTagResponse clone() =>
      DeleteProjectTagResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectTagResponse copyWith(
          void Function(DeleteProjectTagResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteProjectTagResponse))
          as DeleteProjectTagResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProjectTagResponse create() => DeleteProjectTagResponse._();
  @$core.override
  DeleteProjectTagResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteProjectTagResponse> createRepeated() =>
      $pb.PbList<DeleteProjectTagResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteProjectTagResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteProjectTagResponse>(create);
  static DeleteProjectTagResponse? _defaultInstance;

  /// How many sessions the tag was removed from.
  @$pb.TagNumber(1)
  $core.int get sessionsUntagged => $_getIZ(0);
  @$pb.TagNumber(1)
  set sessionsUntagged($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionsUntagged() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionsUntagged() => $_clearField(1);
}

/// A project within an organization. The unit that owns ingest traffic.
class Project extends $pb.GeneratedMessage {
  factory Project({
    $0.ProjectId? id,
    $0.OrganizationId? orgId,
    $5.DataResidency? dataResidency,
    $5.StorageBackend? storageBackend,
    ProjectProps? props,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (orgId != null) result.orgId = orgId;
    if (dataResidency != null) result.dataResidency = dataResidency;
    if (storageBackend != null) result.storageBackend = storageBackend;
    if (props != null) result.props = props;
    return result;
  }

  Project._();

  factory Project.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Project.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Project',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.OrganizationId>(2, _omitFieldNames ? '' : 'orgId',
        subBuilder: $0.OrganizationId.create)
    ..e<$5.DataResidency>(
        3, _omitFieldNames ? '' : 'dataResidency', $pb.PbFieldType.OE,
        defaultOrMaker: $5.DataResidency.DATA_RESIDENCY_UNSPECIFIED,
        valueOf: $5.DataResidency.valueOf,
        enumValues: $5.DataResidency.values)
    ..e<$5.StorageBackend>(
        4, _omitFieldNames ? '' : 'storageBackend', $pb.PbFieldType.OE,
        defaultOrMaker: $5.StorageBackend.STORAGE_BACKEND_UNSPECIFIED,
        valueOf: $5.StorageBackend.valueOf,
        enumValues: $5.StorageBackend.values)
    ..aOM<ProjectProps>(5, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Project clone() => Project()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Project copyWith(void Function(Project) updates) =>
      super.copyWith((message) => updates(message as Project)) as Project;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Project create() => Project._();
  @$core.override
  Project createEmptyInstance() => create();
  static $pb.PbList<Project> createRepeated() => $pb.PbList<Project>();
  @$core.pragma('dart2js:noInline')
  static Project getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Project>(create);
  static Project? _defaultInstance;

  /// Id for this project.
  @$pb.TagNumber(1)
  $0.ProjectId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureId() => $_ensure(0);

  /// The organization that owns this project.
  @$pb.TagNumber(2)
  $0.OrganizationId get orgId => $_getN(1);
  @$pb.TagNumber(2)
  set orgId($0.OrganizationId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOrgId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrgId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.OrganizationId ensureOrgId() => $_ensure(1);

  /// Where this project's data resides. Fixed at creation.
  @$pb.TagNumber(3)
  $5.DataResidency get dataResidency => $_getN(2);
  @$pb.TagNumber(3)
  set dataResidency($5.DataResidency value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDataResidency() => $_has(2);
  @$pb.TagNumber(3)
  void clearDataResidency() => $_clearField(3);

  /// Which backend holds this project's data. Fixed at creation.
  @$pb.TagNumber(4)
  $5.StorageBackend get storageBackend => $_getN(3);
  @$pb.TagNumber(4)
  set storageBackend($5.StorageBackend value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStorageBackend() => $_has(3);
  @$pb.TagNumber(4)
  void clearStorageBackend() => $_clearField(4);

  /// Mutable project properties.
  @$pb.TagNumber(5)
  ProjectProps get props => $_getN(4);
  @$pb.TagNumber(5)
  set props(ProjectProps value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasProps() => $_has(4);
  @$pb.TagNumber(5)
  void clearProps() => $_clearField(5);
  @$pb.TagNumber(5)
  ProjectProps ensureProps() => $_ensure(4);
}

/// The mutable properties of a project.
class ProjectProps extends $pb.GeneratedMessage {
  factory ProjectProps({
    $core.String? name,
    $core.bool? recordingDisabled,
    $core.int? discardUnderSeconds,
    $core.int? idleTimeoutSeconds,
    $core.int? retentionDays,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (recordingDisabled != null) result.recordingDisabled = recordingDisabled;
    if (discardUnderSeconds != null)
      result.discardUnderSeconds = discardUnderSeconds;
    if (idleTimeoutSeconds != null)
      result.idleTimeoutSeconds = idleTimeoutSeconds;
    if (retentionDays != null) result.retentionDays = retentionDays;
    return result;
  }

  ProjectProps._();

  factory ProjectProps.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectProps.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectProps',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'recordingDisabled')
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'discardUnderSeconds', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'idleTimeoutSeconds', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'retentionDays', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectProps clone() => ProjectProps()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectProps copyWith(void Function(ProjectProps) updates) =>
      super.copyWith((message) => updates(message as ProjectProps))
          as ProjectProps;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectProps create() => ProjectProps._();
  @$core.override
  ProjectProps createEmptyInstance() => create();
  static $pb.PbList<ProjectProps> createRepeated() =>
      $pb.PbList<ProjectProps>();
  @$core.pragma('dart2js:noInline')
  static ProjectProps getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectProps>(create);
  static ProjectProps? _defaultInstance;

  /// Human-readable display name.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// When true, the ingest plane refuses to start new recording sessions for
  /// this project. Sessions already in flight run to completion. The field is
  /// inverted ("disabled") so the zero value means recording is on.
  @$pb.TagNumber(2)
  $core.bool get recordingDisabled => $_getBF(1);
  @$pb.TagNumber(2)
  set recordingDisabled($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRecordingDisabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecordingDisabled() => $_clearField(2);

  /// Recordings whose captured duration is shorter than this are discarded
  /// automatically.
  @$pb.TagNumber(3)
  $core.int get discardUnderSeconds => $_getIZ(2);
  @$pb.TagNumber(3)
  set discardUnderSeconds($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDiscardUnderSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiscardUnderSeconds() => $_clearField(3);

  /// How long a session of this project may go without media before it is
  /// finalized.
  @$pb.TagNumber(4)
  $core.int get idleTimeoutSeconds => $_getIZ(3);
  @$pb.TagNumber(4)
  set idleTimeoutSeconds($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIdleTimeoutSeconds() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdleTimeoutSeconds() => $_clearField(4);

  /// How long a recording is kept before it is deleted automatically, counted
  /// from when it stopped recording.
  @$pb.TagNumber(5)
  $core.int get retentionDays => $_getIZ(4);
  @$pb.TagNumber(5)
  set retentionDays($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRetentionDays() => $_has(4);
  @$pb.TagNumber(5)
  void clearRetentionDays() => $_clearField(5);
}

/// A site key issued for a project.
class ProjectSiteKey extends $pb.GeneratedMessage {
  factory ProjectSiteKey({
    $0.SiteKey? key,
    ProjectSiteKey_Status? status,
    $3.Timestamp? createdAt,
    $3.Timestamp? revokedAt,
    ProjectSiteKeyProps? props,
  }) {
    final result = create();
    if (key != null) result.key = key;
    if (status != null) result.status = status;
    if (createdAt != null) result.createdAt = createdAt;
    if (revokedAt != null) result.revokedAt = revokedAt;
    if (props != null) result.props = props;
    return result;
  }

  ProjectSiteKey._();

  factory ProjectSiteKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectSiteKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectSiteKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.SiteKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: $0.SiteKey.create)
    ..e<ProjectSiteKey_Status>(
        2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: ProjectSiteKey_Status.UNSPECIFIED,
        valueOf: ProjectSiteKey_Status.valueOf,
        enumValues: ProjectSiteKey_Status.values)
    ..aOM<$3.Timestamp>(3, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'revokedAt',
        subBuilder: $3.Timestamp.create)
    ..aOM<ProjectSiteKeyProps>(5, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectSiteKeyProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectSiteKey clone() => ProjectSiteKey()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectSiteKey copyWith(void Function(ProjectSiteKey) updates) =>
      super.copyWith((message) => updates(message as ProjectSiteKey))
          as ProjectSiteKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectSiteKey create() => ProjectSiteKey._();
  @$core.override
  ProjectSiteKey createEmptyInstance() => create();
  static $pb.PbList<ProjectSiteKey> createRepeated() =>
      $pb.PbList<ProjectSiteKey>();
  @$core.pragma('dart2js:noInline')
  static ProjectSiteKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectSiteKey>(create);
  static ProjectSiteKey? _defaultInstance;

  /// The public site key value.
  @$pb.TagNumber(1)
  $0.SiteKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key($0.SiteKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SiteKey ensureKey() => $_ensure(0);

  /// Current lifecycle state of the key.
  @$pb.TagNumber(2)
  ProjectSiteKey_Status get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(ProjectSiteKey_Status value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  /// When the key was issued.
  @$pb.TagNumber(3)
  $3.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($3.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.Timestamp ensureCreatedAt() => $_ensure(2);

  /// When the key was revoked, if it has been.
  @$pb.TagNumber(4)
  $3.Timestamp get revokedAt => $_getN(3);
  @$pb.TagNumber(4)
  set revokedAt($3.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRevokedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearRevokedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureRevokedAt() => $_ensure(3);

  /// Caller-mutable properties.
  @$pb.TagNumber(5)
  ProjectSiteKeyProps get props => $_getN(4);
  @$pb.TagNumber(5)
  set props(ProjectSiteKeyProps value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasProps() => $_has(4);
  @$pb.TagNumber(5)
  void clearProps() => $_clearField(5);
  @$pb.TagNumber(5)
  ProjectSiteKeyProps ensureProps() => $_ensure(4);
}

/// The mutable properties of a site key.
class ProjectSiteKeyProps extends $pb.GeneratedMessage {
  factory ProjectSiteKeyProps({
    $core.String? label,
  }) {
    final result = create();
    if (label != null) result.label = label;
    return result;
  }

  ProjectSiteKeyProps._();

  factory ProjectSiteKeyProps.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectSiteKeyProps.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectSiteKeyProps',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'label')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectSiteKeyProps clone() => ProjectSiteKeyProps()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectSiteKeyProps copyWith(void Function(ProjectSiteKeyProps) updates) =>
      super.copyWith((message) => updates(message as ProjectSiteKeyProps))
          as ProjectSiteKeyProps;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectSiteKeyProps create() => ProjectSiteKeyProps._();
  @$core.override
  ProjectSiteKeyProps createEmptyInstance() => create();
  static $pb.PbList<ProjectSiteKeyProps> createRepeated() =>
      $pb.PbList<ProjectSiteKeyProps>();
  @$core.pragma('dart2js:noInline')
  static ProjectSiteKeyProps getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectSiteKeyProps>(create);
  static ProjectSiteKeyProps? _defaultInstance;

  /// Human-readable display name.
  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => $_clearField(1);
}

/// A tag defined for a project.
class ProjectTag extends $pb.GeneratedMessage {
  factory ProjectTag({
    $0.ProjectTagId? id,
    $0.ProjectId? projectId,
    $3.Timestamp? createdAt,
    ProjectTagProps? props,
    ProjectTagKind? kind,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (projectId != null) result.projectId = projectId;
    if (createdAt != null) result.createdAt = createdAt;
    if (props != null) result.props = props;
    if (kind != null) result.kind = kind;
    return result;
  }

  ProjectTag._();

  factory ProjectTag.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectTag.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectTag',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectTagId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.ProjectTagId.create)
    ..aOM<$0.ProjectId>(2, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$3.Timestamp>(3, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $3.Timestamp.create)
    ..aOM<ProjectTagProps>(4, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectTagProps.create)
    ..e<ProjectTagKind>(5, _omitFieldNames ? '' : 'kind', $pb.PbFieldType.OE,
        defaultOrMaker: ProjectTagKind.PROJECT_TAG_KIND_UNSPECIFIED,
        valueOf: ProjectTagKind.valueOf,
        enumValues: ProjectTagKind.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectTag clone() => ProjectTag()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectTag copyWith(void Function(ProjectTag) updates) =>
      super.copyWith((message) => updates(message as ProjectTag)) as ProjectTag;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectTag create() => ProjectTag._();
  @$core.override
  ProjectTag createEmptyInstance() => create();
  static $pb.PbList<ProjectTag> createRepeated() => $pb.PbList<ProjectTag>();
  @$core.pragma('dart2js:noInline')
  static ProjectTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectTag>(create);
  static ProjectTag? _defaultInstance;

  /// Id for this tag.
  @$pb.TagNumber(1)
  $0.ProjectTagId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.ProjectTagId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectTagId ensureId() => $_ensure(0);

  /// The project that defines this tag.
  @$pb.TagNumber(2)
  $0.ProjectId get projectId => $_getN(1);
  @$pb.TagNumber(2)
  set projectId($0.ProjectId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.ProjectId ensureProjectId() => $_ensure(1);

  /// When the tag was defined.
  @$pb.TagNumber(3)
  $3.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($3.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.Timestamp ensureCreatedAt() => $_ensure(2);

  /// Caller-mutable properties.
  @$pb.TagNumber(4)
  ProjectTagProps get props => $_getN(3);
  @$pb.TagNumber(4)
  set props(ProjectTagProps value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasProps() => $_has(3);
  @$pb.TagNumber(4)
  void clearProps() => $_clearField(4);
  @$pb.TagNumber(4)
  ProjectTagProps ensureProps() => $_ensure(3);

  /// What kind the tag is. Assigned by the server.
  @$pb.TagNumber(5)
  ProjectTagKind get kind => $_getN(4);
  @$pb.TagNumber(5)
  set kind(ProjectTagKind value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasKind() => $_has(4);
  @$pb.TagNumber(5)
  void clearKind() => $_clearField(5);
}

/// The mutable properties of a project tag.
class ProjectTagProps extends $pb.GeneratedMessage {
  factory ProjectTagProps({
    $core.String? label,
    ProjectTagColor? color,
    $core.String? customHex,
  }) {
    final result = create();
    if (label != null) result.label = label;
    if (color != null) result.color = color;
    if (customHex != null) result.customHex = customHex;
    return result;
  }

  ProjectTagProps._();

  factory ProjectTagProps.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectTagProps.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectTagProps',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'label')
    ..e<ProjectTagColor>(2, _omitFieldNames ? '' : 'color', $pb.PbFieldType.OE,
        defaultOrMaker: ProjectTagColor.PROJECT_TAG_COLOR_UNSPECIFIED,
        valueOf: ProjectTagColor.valueOf,
        enumValues: ProjectTagColor.values)
    ..aOS(3, _omitFieldNames ? '' : 'customHex')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectTagProps clone() => ProjectTagProps()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectTagProps copyWith(void Function(ProjectTagProps) updates) =>
      super.copyWith((message) => updates(message as ProjectTagProps))
          as ProjectTagProps;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectTagProps create() => ProjectTagProps._();
  @$core.override
  ProjectTagProps createEmptyInstance() => create();
  static $pb.PbList<ProjectTagProps> createRepeated() =>
      $pb.PbList<ProjectTagProps>();
  @$core.pragma('dart2js:noInline')
  static ProjectTagProps getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectTagProps>(create);
  static ProjectTagProps? _defaultInstance;

  /// Human-readable label, as displayed. Non-empty, trimmed, and unique within
  /// the project when compared case-insensitively.
  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => $_clearField(1);

  /// The color this tag renders in. Required, even if custom_hex.
  @$pb.TagNumber(2)
  ProjectTagColor get color => $_getN(1);
  @$pb.TagNumber(2)
  set color(ProjectTagColor value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => $_clearField(2);

  /// An exact color to render instead of the palette slot, as lowercase
  /// "#rrggbb". Unset means the slot is used. A client that cannot honor an
  /// arbitrary color falls back to color, which is why that stays required.
  @$pb.TagNumber(3)
  $core.String get customHex => $_getSZ(2);
  @$pb.TagNumber(3)
  set customHex($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCustomHex() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomHex() => $_clearField(3);
}

/// Identifies a project membership: the (project, user) edge.
class ProjectMemberKey extends $pb.GeneratedMessage {
  factory ProjectMemberKey({
    $0.ProjectId? projectId,
    $0.UserId? userId,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (userId != null) result.userId = userId;
    return result;
  }

  ProjectMemberKey._();

  factory ProjectMemberKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectMemberKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectMemberKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.UserId>(2, _omitFieldNames ? '' : 'userId',
        subBuilder: $0.UserId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectMemberKey clone() => ProjectMemberKey()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectMemberKey copyWith(void Function(ProjectMemberKey) updates) =>
      super.copyWith((message) => updates(message as ProjectMemberKey))
          as ProjectMemberKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectMemberKey create() => ProjectMemberKey._();
  @$core.override
  ProjectMemberKey createEmptyInstance() => create();
  static $pb.PbList<ProjectMemberKey> createRepeated() =>
      $pb.PbList<ProjectMemberKey>();
  @$core.pragma('dart2js:noInline')
  static ProjectMemberKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectMemberKey>(create);
  static ProjectMemberKey? _defaultInstance;

  /// The project endpoint of the edge.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

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

/// A project membership: the edge granting a user a role scoped to a project.
class ProjectMember extends $pb.GeneratedMessage {
  factory ProjectMember({
    ProjectMemberKey? key,
    ProjectMemberProps? props,
  }) {
    final result = create();
    if (key != null) result.key = key;
    if (props != null) result.props = props;
    return result;
  }

  ProjectMember._();

  factory ProjectMember.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectMember.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectMember',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectMemberKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: ProjectMemberKey.create)
    ..aOM<ProjectMemberProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectMemberProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectMember clone() => ProjectMember()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectMember copyWith(void Function(ProjectMember) updates) =>
      super.copyWith((message) => updates(message as ProjectMember))
          as ProjectMember;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectMember create() => ProjectMember._();
  @$core.override
  ProjectMember createEmptyInstance() => create();
  static $pb.PbList<ProjectMember> createRepeated() =>
      $pb.PbList<ProjectMember>();
  @$core.pragma('dart2js:noInline')
  static ProjectMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectMember>(create);
  static ProjectMember? _defaultInstance;

  /// The (project, user) edge this membership represents.
  @$pb.TagNumber(1)
  ProjectMemberKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(ProjectMemberKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectMemberKey ensureKey() => $_ensure(0);

  /// Mutable membership properties.
  @$pb.TagNumber(2)
  ProjectMemberProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(ProjectMemberProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  ProjectMemberProps ensureProps() => $_ensure(1);
}

/// The mutable properties of a project membership.
class ProjectMemberProps extends $pb.GeneratedMessage {
  factory ProjectMemberProps({
    $6.Role? role,
  }) {
    final result = create();
    if (role != null) result.role = role;
    return result;
  }

  ProjectMemberProps._();

  factory ProjectMemberProps.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProjectMemberProps.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectMemberProps',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..e<$6.Role>(1, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: $6.Role.ROLE_UNSPECIFIED,
        valueOf: $6.Role.valueOf,
        enumValues: $6.Role.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectMemberProps clone() => ProjectMemberProps()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProjectMemberProps copyWith(void Function(ProjectMemberProps) updates) =>
      super.copyWith((message) => updates(message as ProjectMemberProps))
          as ProjectMemberProps;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectMemberProps create() => ProjectMemberProps._();
  @$core.override
  ProjectMemberProps createEmptyInstance() => create();
  static $pb.PbList<ProjectMemberProps> createRepeated() =>
      $pb.PbList<ProjectMemberProps>();
  @$core.pragma('dart2js:noInline')
  static ProjectMemberProps getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectMemberProps>(create);
  static ProjectMemberProps? _defaultInstance;

  /// The role granted to the user on the project.
  @$pb.TagNumber(1)
  $6.Role get role => $_getN(0);
  @$pb.TagNumber(1)
  set role($6.Role value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => $_clearField(1);
}

/// Request to assign a user a role on a project.
class AssignProjectMemberRequest extends $pb.GeneratedMessage {
  factory AssignProjectMemberRequest({
    ProjectMemberKey? key,
    ProjectMemberProps? props,
  }) {
    final result = create();
    if (key != null) result.key = key;
    if (props != null) result.props = props;
    return result;
  }

  AssignProjectMemberRequest._();

  factory AssignProjectMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssignProjectMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssignProjectMemberRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectMemberKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: ProjectMemberKey.create)
    ..aOM<ProjectMemberProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectMemberProps.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignProjectMemberRequest clone() =>
      AssignProjectMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignProjectMemberRequest copyWith(
          void Function(AssignProjectMemberRequest) updates) =>
      super.copyWith(
              (message) => updates(message as AssignProjectMemberRequest))
          as AssignProjectMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignProjectMemberRequest create() => AssignProjectMemberRequest._();
  @$core.override
  AssignProjectMemberRequest createEmptyInstance() => create();
  static $pb.PbList<AssignProjectMemberRequest> createRepeated() =>
      $pb.PbList<AssignProjectMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static AssignProjectMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssignProjectMemberRequest>(create);
  static AssignProjectMemberRequest? _defaultInstance;

  /// The project <-> user edge to create.
  @$pb.TagNumber(1)
  ProjectMemberKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(ProjectMemberKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectMemberKey ensureKey() => $_ensure(0);

  /// Properties for the new project membership.
  @$pb.TagNumber(2)
  ProjectMemberProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(ProjectMemberProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  ProjectMemberProps ensureProps() => $_ensure(1);
}

/// Response to an assign-project-member request.
class AssignProjectMemberResponse extends $pb.GeneratedMessage {
  factory AssignProjectMemberResponse({
    ProjectMember? member,
  }) {
    final result = create();
    if (member != null) result.member = member;
    return result;
  }

  AssignProjectMemberResponse._();

  factory AssignProjectMemberResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssignProjectMemberResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssignProjectMemberResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectMember>(1, _omitFieldNames ? '' : 'member',
        subBuilder: ProjectMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignProjectMemberResponse clone() =>
      AssignProjectMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignProjectMemberResponse copyWith(
          void Function(AssignProjectMemberResponse) updates) =>
      super.copyWith(
              (message) => updates(message as AssignProjectMemberResponse))
          as AssignProjectMemberResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignProjectMemberResponse create() =>
      AssignProjectMemberResponse._();
  @$core.override
  AssignProjectMemberResponse createEmptyInstance() => create();
  static $pb.PbList<AssignProjectMemberResponse> createRepeated() =>
      $pb.PbList<AssignProjectMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static AssignProjectMemberResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssignProjectMemberResponse>(create);
  static AssignProjectMemberResponse? _defaultInstance;

  /// The newly created project membership.
  @$pb.TagNumber(1)
  ProjectMember get member => $_getN(0);
  @$pb.TagNumber(1)
  set member(ProjectMember value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearMember() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectMember ensureMember() => $_ensure(0);
}

/// Request to fetch a project membership.
class GetProjectMemberRequest extends $pb.GeneratedMessage {
  factory GetProjectMemberRequest({
    ProjectMemberKey? key,
  }) {
    final result = create();
    if (key != null) result.key = key;
    return result;
  }

  GetProjectMemberRequest._();

  factory GetProjectMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProjectMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProjectMemberRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectMemberKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: ProjectMemberKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectMemberRequest clone() =>
      GetProjectMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectMemberRequest copyWith(
          void Function(GetProjectMemberRequest) updates) =>
      super.copyWith((message) => updates(message as GetProjectMemberRequest))
          as GetProjectMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProjectMemberRequest create() => GetProjectMemberRequest._();
  @$core.override
  GetProjectMemberRequest createEmptyInstance() => create();
  static $pb.PbList<GetProjectMemberRequest> createRepeated() =>
      $pb.PbList<GetProjectMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProjectMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProjectMemberRequest>(create);
  static GetProjectMemberRequest? _defaultInstance;

  /// The project membership to fetch.
  @$pb.TagNumber(1)
  ProjectMemberKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(ProjectMemberKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectMemberKey ensureKey() => $_ensure(0);
}

/// Response to a get-project-member request.
class GetProjectMemberResponse extends $pb.GeneratedMessage {
  factory GetProjectMemberResponse({
    ProjectMember? member,
  }) {
    final result = create();
    if (member != null) result.member = member;
    return result;
  }

  GetProjectMemberResponse._();

  factory GetProjectMemberResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProjectMemberResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProjectMemberResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectMember>(1, _omitFieldNames ? '' : 'member',
        subBuilder: ProjectMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectMemberResponse clone() =>
      GetProjectMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectMemberResponse copyWith(
          void Function(GetProjectMemberResponse) updates) =>
      super.copyWith((message) => updates(message as GetProjectMemberResponse))
          as GetProjectMemberResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProjectMemberResponse create() => GetProjectMemberResponse._();
  @$core.override
  GetProjectMemberResponse createEmptyInstance() => create();
  static $pb.PbList<GetProjectMemberResponse> createRepeated() =>
      $pb.PbList<GetProjectMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProjectMemberResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProjectMemberResponse>(create);
  static GetProjectMemberResponse? _defaultInstance;

  /// The requested project membership.
  @$pb.TagNumber(1)
  ProjectMember get member => $_getN(0);
  @$pb.TagNumber(1)
  set member(ProjectMember value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearMember() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectMember ensureMember() => $_ensure(0);
}

/// Request to update a project membership's properties.
class UpdateProjectMemberRequest extends $pb.GeneratedMessage {
  factory UpdateProjectMemberRequest({
    ProjectMemberKey? key,
    ProjectMemberProps? props,
    $1.FieldMask? updateMask,
  }) {
    final result = create();
    if (key != null) result.key = key;
    if (props != null) result.props = props;
    if (updateMask != null) result.updateMask = updateMask;
    return result;
  }

  UpdateProjectMemberRequest._();

  factory UpdateProjectMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProjectMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProjectMemberRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectMemberKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: ProjectMemberKey.create)
    ..aOM<ProjectMemberProps>(2, _omitFieldNames ? '' : 'props',
        subBuilder: ProjectMemberProps.create)
    ..aOM<$1.FieldMask>(3, _omitFieldNames ? '' : 'updateMask',
        subBuilder: $1.FieldMask.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectMemberRequest clone() =>
      UpdateProjectMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectMemberRequest copyWith(
          void Function(UpdateProjectMemberRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateProjectMemberRequest))
          as UpdateProjectMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProjectMemberRequest create() => UpdateProjectMemberRequest._();
  @$core.override
  UpdateProjectMemberRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProjectMemberRequest> createRepeated() =>
      $pb.PbList<UpdateProjectMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProjectMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProjectMemberRequest>(create);
  static UpdateProjectMemberRequest? _defaultInstance;

  /// The project membership to update.
  @$pb.TagNumber(1)
  ProjectMemberKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(ProjectMemberKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectMemberKey ensureKey() => $_ensure(0);

  /// The new property values. Only fields named in update_mask are applied.
  @$pb.TagNumber(2)
  ProjectMemberProps get props => $_getN(1);
  @$pb.TagNumber(2)
  set props(ProjectMemberProps value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProps() => $_has(1);
  @$pb.TagNumber(2)
  void clearProps() => $_clearField(2);
  @$pb.TagNumber(2)
  ProjectMemberProps ensureProps() => $_ensure(1);

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

/// Response to an update-project-member request.
class UpdateProjectMemberResponse extends $pb.GeneratedMessage {
  factory UpdateProjectMemberResponse({
    ProjectMember? member,
  }) {
    final result = create();
    if (member != null) result.member = member;
    return result;
  }

  UpdateProjectMemberResponse._();

  factory UpdateProjectMemberResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProjectMemberResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProjectMemberResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectMember>(1, _omitFieldNames ? '' : 'member',
        subBuilder: ProjectMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectMemberResponse clone() =>
      UpdateProjectMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectMemberResponse copyWith(
          void Function(UpdateProjectMemberResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateProjectMemberResponse))
          as UpdateProjectMemberResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProjectMemberResponse create() =>
      UpdateProjectMemberResponse._();
  @$core.override
  UpdateProjectMemberResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProjectMemberResponse> createRepeated() =>
      $pb.PbList<UpdateProjectMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProjectMemberResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProjectMemberResponse>(create);
  static UpdateProjectMemberResponse? _defaultInstance;

  /// The project membership after the update.
  @$pb.TagNumber(1)
  ProjectMember get member => $_getN(0);
  @$pb.TagNumber(1)
  set member(ProjectMember value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearMember() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectMember ensureMember() => $_ensure(0);
}

/// Request to remove a user's role on a project.
class RemoveProjectMemberRequest extends $pb.GeneratedMessage {
  factory RemoveProjectMemberRequest({
    ProjectMemberKey? key,
  }) {
    final result = create();
    if (key != null) result.key = key;
    return result;
  }

  RemoveProjectMemberRequest._();

  factory RemoveProjectMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveProjectMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveProjectMemberRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<ProjectMemberKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: ProjectMemberKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveProjectMemberRequest clone() =>
      RemoveProjectMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveProjectMemberRequest copyWith(
          void Function(RemoveProjectMemberRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveProjectMemberRequest))
          as RemoveProjectMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveProjectMemberRequest create() => RemoveProjectMemberRequest._();
  @$core.override
  RemoveProjectMemberRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveProjectMemberRequest> createRepeated() =>
      $pb.PbList<RemoveProjectMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveProjectMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveProjectMemberRequest>(create);
  static RemoveProjectMemberRequest? _defaultInstance;

  /// The project membership to remove.
  @$pb.TagNumber(1)
  ProjectMemberKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(ProjectMemberKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  ProjectMemberKey ensureKey() => $_ensure(0);
}

/// Response to a remove-project-member request.
class RemoveProjectMemberResponse extends $pb.GeneratedMessage {
  factory RemoveProjectMemberResponse() => create();

  RemoveProjectMemberResponse._();

  factory RemoveProjectMemberResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveProjectMemberResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveProjectMemberResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveProjectMemberResponse clone() =>
      RemoveProjectMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveProjectMemberResponse copyWith(
          void Function(RemoveProjectMemberResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveProjectMemberResponse))
          as RemoveProjectMemberResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveProjectMemberResponse create() =>
      RemoveProjectMemberResponse._();
  @$core.override
  RemoveProjectMemberResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveProjectMemberResponse> createRepeated() =>
      $pb.PbList<RemoveProjectMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveProjectMemberResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveProjectMemberResponse>(create);
  static RemoveProjectMemberResponse? _defaultInstance;
}

/// Request to list a project's members.
class ListProjectMembersRequest extends $pb.GeneratedMessage {
  factory ListProjectMembersRequest({
    $0.ProjectId? projectId,
    $2.PageRequest? page,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (page != null) result.page = page;
    return result;
  }

  ListProjectMembersRequest._();

  factory ListProjectMembersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListProjectMembersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectMembersRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$2.PageRequest>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectMembersRequest clone() =>
      ListProjectMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectMembersRequest copyWith(
          void Function(ListProjectMembersRequest) updates) =>
      super.copyWith((message) => updates(message as ListProjectMembersRequest))
          as ListProjectMembersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectMembersRequest create() => ListProjectMembersRequest._();
  @$core.override
  ListProjectMembersRequest createEmptyInstance() => create();
  static $pb.PbList<ListProjectMembersRequest> createRepeated() =>
      $pb.PbList<ListProjectMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListProjectMembersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectMembersRequest>(create);
  static ListProjectMembersRequest? _defaultInstance;

  /// The project whose members to list.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

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

/// Response to a list-project-members request.
class ListProjectMembersResponse extends $pb.GeneratedMessage {
  factory ListProjectMembersResponse({
    $core.Iterable<ProjectMember>? members,
    $2.PageResponse? page,
  }) {
    final result = create();
    if (members != null) result.members.addAll(members);
    if (page != null) result.page = page;
    return result;
  }

  ListProjectMembersResponse._();

  factory ListProjectMembersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListProjectMembersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectMembersResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..pc<ProjectMember>(1, _omitFieldNames ? '' : 'members', $pb.PbFieldType.PM,
        subBuilder: ProjectMember.create)
    ..aOM<$2.PageResponse>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectMembersResponse clone() =>
      ListProjectMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectMembersResponse copyWith(
          void Function(ListProjectMembersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListProjectMembersResponse))
          as ListProjectMembersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectMembersResponse create() => ListProjectMembersResponse._();
  @$core.override
  ListProjectMembersResponse createEmptyInstance() => create();
  static $pb.PbList<ListProjectMembersResponse> createRepeated() =>
      $pb.PbList<ListProjectMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListProjectMembersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectMembersResponse>(create);
  static ListProjectMembersResponse? _defaultInstance;

  /// A page of the project's members. May be empty if no role overrides are set.
  @$pb.TagNumber(1)
  $pb.PbList<ProjectMember> get members => $_getList(0);

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

/// A recorded session (a "recording") captured for a project.
class Session extends $pb.GeneratedMessage {
  factory Session({
    $0.SessionId? id,
    $0.ProjectId? projectId,
    $0.SiteKey? siteKey,
    Session_Status? status,
    SessionProps? props,
    $0.SessionPublisherInfo? publisherInfo,
    SessionAttributes? attributes,
    $core.bool? seen,
    LiveTransport? liveTransport,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (projectId != null) result.projectId = projectId;
    if (siteKey != null) result.siteKey = siteKey;
    if (status != null) result.status = status;
    if (props != null) result.props = props;
    if (publisherInfo != null) result.publisherInfo = publisherInfo;
    if (attributes != null) result.attributes = attributes;
    if (seen != null) result.seen = seen;
    if (liveTransport != null) result.liveTransport = liveTransport;
    return result;
  }

  Session._();

  factory Session.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Session.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Session',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.SessionId>(1, _omitFieldNames ? '' : 'id',
        subBuilder: $0.SessionId.create)
    ..aOM<$0.ProjectId>(2, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SiteKey>(3, _omitFieldNames ? '' : 'siteKey',
        subBuilder: $0.SiteKey.create)
    ..e<Session_Status>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: Session_Status.UNSPECIFIED,
        valueOf: Session_Status.valueOf,
        enumValues: Session_Status.values)
    ..aOM<SessionProps>(5, _omitFieldNames ? '' : 'props',
        subBuilder: SessionProps.create)
    ..aOM<$0.SessionPublisherInfo>(6, _omitFieldNames ? '' : 'publisherInfo',
        subBuilder: $0.SessionPublisherInfo.create)
    ..aOM<SessionAttributes>(7, _omitFieldNames ? '' : 'attributes',
        subBuilder: SessionAttributes.create)
    ..aOB(8, _omitFieldNames ? '' : 'seen')
    ..e<LiveTransport>(
        9, _omitFieldNames ? '' : 'liveTransport', $pb.PbFieldType.OE,
        defaultOrMaker: LiveTransport.LIVE_TRANSPORT_UNSPECIFIED,
        valueOf: LiveTransport.valueOf,
        enumValues: LiveTransport.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Session clone() => Session()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Session copyWith(void Function(Session) updates) =>
      super.copyWith((message) => updates(message as Session)) as Session;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Session create() => Session._();
  @$core.override
  Session createEmptyInstance() => create();
  static $pb.PbList<Session> createRepeated() => $pb.PbList<Session>();
  @$core.pragma('dart2js:noInline')
  static Session getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Session>(create);
  static Session? _defaultInstance;

  /// Id for this session.
  @$pb.TagNumber(1)
  $0.SessionId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($0.SessionId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SessionId ensureId() => $_ensure(0);

  /// The project this session was captured for.
  @$pb.TagNumber(2)
  $0.ProjectId get projectId => $_getN(1);
  @$pb.TagNumber(2)
  set projectId($0.ProjectId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.ProjectId ensureProjectId() => $_ensure(1);

  /// The site key the session was ingested with.
  @$pb.TagNumber(3)
  $0.SiteKey get siteKey => $_getN(2);
  @$pb.TagNumber(3)
  set siteKey($0.SiteKey value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSiteKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearSiteKey() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.SiteKey ensureSiteKey() => $_ensure(2);

  /// Current lifecycle state of the recording.
  @$pb.TagNumber(4)
  Session_Status get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(Session_Status value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  /// Caller-mutable properties.
  @$pb.TagNumber(5)
  SessionProps get props => $_getN(4);
  @$pb.TagNumber(5)
  set props(SessionProps value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasProps() => $_has(4);
  @$pb.TagNumber(5)
  void clearProps() => $_clearField(5);
  @$pb.TagNumber(5)
  SessionProps ensureProps() => $_ensure(4);

  /// Client-reported attributes of the publishing client.
  @$pb.TagNumber(6)
  $0.SessionPublisherInfo get publisherInfo => $_getN(5);
  @$pb.TagNumber(6)
  set publisherInfo($0.SessionPublisherInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPublisherInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearPublisherInfo() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.SessionPublisherInfo ensurePublisherInfo() => $_ensure(5);

  /// Immutable attributes of this session.
  @$pb.TagNumber(7)
  SessionAttributes get attributes => $_getN(6);
  @$pb.TagNumber(7)
  set attributes(SessionAttributes value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAttributes() => $_has(6);
  @$pb.TagNumber(7)
  void clearAttributes() => $_clearField(7);
  @$pb.TagNumber(7)
  SessionAttributes ensureAttributes() => $_ensure(6);

  /// Whether the calling user has seen this session. Per-user state, since one
  /// user's "seen" state does not influence another's.
  @$pb.TagNumber(8)
  $core.bool get seen => $_getBF(7);
  @$pb.TagNumber(8)
  set seen($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSeen() => $_has(7);
  @$pb.TagNumber(8)
  void clearSeen() => $_clearField(8);

  /// How the session's media reaches a live viewer.
  @$pb.TagNumber(9)
  LiveTransport get liveTransport => $_getN(8);
  @$pb.TagNumber(9)
  set liveTransport(LiveTransport value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasLiveTransport() => $_has(8);
  @$pb.TagNumber(9)
  void clearLiveTransport() => $_clearField(9);
}

class SessionProps extends $pb.GeneratedMessage {
  factory SessionProps({
    $core.Iterable<$0.ProjectTagId>? tagIds,
  }) {
    final result = create();
    if (tagIds != null) result.tagIds.addAll(tagIds);
    return result;
  }

  SessionProps._();

  factory SessionProps.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SessionProps.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionProps',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..pc<$0.ProjectTagId>(
        1, _omitFieldNames ? '' : 'tagIds', $pb.PbFieldType.PM,
        subBuilder: $0.ProjectTagId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionProps clone() => SessionProps()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionProps copyWith(void Function(SessionProps) updates) =>
      super.copyWith((message) => updates(message as SessionProps))
          as SessionProps;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionProps create() => SessionProps._();
  @$core.override
  SessionProps createEmptyInstance() => create();
  static $pb.PbList<SessionProps> createRepeated() =>
      $pb.PbList<SessionProps>();
  @$core.pragma('dart2js:noInline')
  static SessionProps getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionProps>(create);
  static SessionProps? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.ProjectTagId> get tagIds => $_getList(0);
}

class SessionTagUpdate extends $pb.GeneratedMessage {
  factory SessionTagUpdate({
    $core.Iterable<$0.ProjectTagId>? add,
    $core.Iterable<$0.ProjectTagId>? remove,
  }) {
    final result = create();
    if (add != null) result.add.addAll(add);
    if (remove != null) result.remove.addAll(remove);
    return result;
  }

  SessionTagUpdate._();

  factory SessionTagUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SessionTagUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionTagUpdate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..pc<$0.ProjectTagId>(1, _omitFieldNames ? '' : 'add', $pb.PbFieldType.PM,
        subBuilder: $0.ProjectTagId.create)
    ..pc<$0.ProjectTagId>(
        2, _omitFieldNames ? '' : 'remove', $pb.PbFieldType.PM,
        subBuilder: $0.ProjectTagId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionTagUpdate clone() => SessionTagUpdate()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionTagUpdate copyWith(void Function(SessionTagUpdate) updates) =>
      super.copyWith((message) => updates(message as SessionTagUpdate))
          as SessionTagUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionTagUpdate create() => SessionTagUpdate._();
  @$core.override
  SessionTagUpdate createEmptyInstance() => create();
  static $pb.PbList<SessionTagUpdate> createRepeated() =>
      $pb.PbList<SessionTagUpdate>();
  @$core.pragma('dart2js:noInline')
  static SessionTagUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionTagUpdate>(create);
  static SessionTagUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.ProjectTagId> get add => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$0.ProjectTagId> get remove => $_getList(1);
}

/// The non-mutable bag of attributes associated with a particular session.
class SessionAttributes extends $pb.GeneratedMessage {
  factory SessionAttributes({
    $3.Timestamp? startedAt,
    $3.Timestamp? endedAt,
    $4.Duration? duration,
    $fixnum.Int64? sizeBytes,
    $core.String? country,
    $core.String? browser,
    $core.String? os,
    $core.String? deviceType,
    $core.String? userAgent,
    $core.int? clientTcpRttMs,
    $3.Timestamp? deletedAt,
    Sparkline? activity,
  }) {
    final result = create();
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (duration != null) result.duration = duration;
    if (sizeBytes != null) result.sizeBytes = sizeBytes;
    if (country != null) result.country = country;
    if (browser != null) result.browser = browser;
    if (os != null) result.os = os;
    if (deviceType != null) result.deviceType = deviceType;
    if (userAgent != null) result.userAgent = userAgent;
    if (clientTcpRttMs != null) result.clientTcpRttMs = clientTcpRttMs;
    if (deletedAt != null) result.deletedAt = deletedAt;
    if (activity != null) result.activity = activity;
    return result;
  }

  SessionAttributes._();

  factory SessionAttributes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SessionAttributes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionAttributes',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$3.Timestamp>(1, _omitFieldNames ? '' : 'startedAt',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'endedAt',
        subBuilder: $3.Timestamp.create)
    ..aOM<$4.Duration>(3, _omitFieldNames ? '' : 'duration',
        subBuilder: $4.Duration.create)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'sizeBytes', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'country')
    ..aOS(6, _omitFieldNames ? '' : 'browser')
    ..aOS(7, _omitFieldNames ? '' : 'os')
    ..aOS(8, _omitFieldNames ? '' : 'deviceType')
    ..aOS(9, _omitFieldNames ? '' : 'userAgent')
    ..a<$core.int>(
        10, _omitFieldNames ? '' : 'clientTcpRttMs', $pb.PbFieldType.OU3)
    ..aOM<$3.Timestamp>(11, _omitFieldNames ? '' : 'deletedAt',
        subBuilder: $3.Timestamp.create)
    ..aOM<Sparkline>(12, _omitFieldNames ? '' : 'activity',
        subBuilder: Sparkline.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionAttributes clone() => SessionAttributes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionAttributes copyWith(void Function(SessionAttributes) updates) =>
      super.copyWith((message) => updates(message as SessionAttributes))
          as SessionAttributes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionAttributes create() => SessionAttributes._();
  @$core.override
  SessionAttributes createEmptyInstance() => create();
  static $pb.PbList<SessionAttributes> createRepeated() =>
      $pb.PbList<SessionAttributes>();
  @$core.pragma('dart2js:noInline')
  static SessionAttributes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionAttributes>(create);
  static SessionAttributes? _defaultInstance;

  /// When the session began recording.
  @$pb.TagNumber(1)
  $3.Timestamp get startedAt => $_getN(0);
  @$pb.TagNumber(1)
  set startedAt($3.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStartedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartedAt() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Timestamp ensureStartedAt() => $_ensure(0);

  /// When the session stopped recording, if it has. Unset while RECORDING.
  @$pb.TagNumber(2)
  $3.Timestamp get endedAt => $_getN(1);
  @$pb.TagNumber(2)
  set endedAt($3.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEndedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndedAt() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureEndedAt() => $_ensure(1);

  /// Duration of the captured media. Unset until the recording is READY.
  @$pb.TagNumber(3)
  $4.Duration get duration => $_getN(2);
  @$pb.TagNumber(3)
  set duration($4.Duration value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => $_clearField(3);
  @$pb.TagNumber(3)
  $4.Duration ensureDuration() => $_ensure(2);

  /// Total size of the captured media in bytes. Zero until parts are written.
  @$pb.TagNumber(4)
  $fixnum.Int64 get sizeBytes => $_getI64(3);
  @$pb.TagNumber(4)
  set sizeBytes($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSizeBytes() => $_has(3);
  @$pb.TagNumber(4)
  void clearSizeBytes() => $_clearField(4);

  /// ISO 3166-1 alpha-2 country code of the publisher. "T1" means Tor.
  @$pb.TagNumber(5)
  $core.String get country => $_getSZ(4);
  @$pb.TagNumber(5)
  set country($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCountry() => $_has(4);
  @$pb.TagNumber(5)
  void clearCountry() => $_clearField(5);

  /// Browser family parsed from the User-Agent, e.g. "Chrome".
  @$pb.TagNumber(6)
  $core.String get browser => $_getSZ(5);
  @$pb.TagNumber(6)
  set browser($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBrowser() => $_has(5);
  @$pb.TagNumber(6)
  void clearBrowser() => $_clearField(6);

  /// OS family parsed from the User-Agent, e.g. "macOS".
  @$pb.TagNumber(7)
  $core.String get os => $_getSZ(6);
  @$pb.TagNumber(7)
  set os($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOs() => $_has(6);
  @$pb.TagNumber(7)
  void clearOs() => $_clearField(7);

  /// Coarse form factor: "desktop", "mobile", or "tablet".
  @$pb.TagNumber(8)
  $core.String get deviceType => $_getSZ(7);
  @$pb.TagNumber(8)
  set deviceType($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDeviceType() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeviceType() => $_clearField(8);

  /// The raw User-Agent header, kept verbatim.
  @$pb.TagNumber(9)
  $core.String get userAgent => $_getSZ(8);
  @$pb.TagNumber(9)
  set userAgent($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUserAgent() => $_has(8);
  @$pb.TagNumber(9)
  void clearUserAgent() => $_clearField(9);

  /// [One sample of] the client-to-edge TCP round-trip time in milliseconds.
  @$pb.TagNumber(10)
  $core.int get clientTcpRttMs => $_getIZ(9);
  @$pb.TagNumber(10)
  set clientTcpRttMs($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasClientTcpRttMs() => $_has(9);
  @$pb.TagNumber(10)
  void clearClientTcpRttMs() => $_clearField(10);

  /// When the session was deleted, if it has been.
  @$pb.TagNumber(11)
  $3.Timestamp get deletedAt => $_getN(10);
  @$pb.TagNumber(11)
  set deletedAt($3.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasDeletedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearDeletedAt() => $_clearField(11);
  @$pb.TagNumber(11)
  $3.Timestamp ensureDeletedAt() => $_ensure(10);

  /// How active the recording was over its length. Unset when it was never
  /// measured, which is not the same as measured and found still.
  @$pb.TagNumber(12)
  Sparkline get activity => $_getN(11);
  @$pb.TagNumber(12)
  set activity(Sparkline value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasActivity() => $_has(11);
  @$pb.TagNumber(12)
  void clearActivity() => $_clearField(12);
  @$pb.TagNumber(12)
  Sparkline ensureActivity() => $_ensure(11);
}

/// A coarse activity curve over a recording, for display as a sparkline.
///
/// Relative by construction: it says where a recording was busy compared with its
/// own quietest and busiest moments, and carries no meaning between one recording
/// and another.
class Sparkline extends $pb.GeneratedMessage {
  factory Sparkline({
    $core.List<$core.int>? points,
  }) {
    final result = create();
    if (points != null) result.points = points;
    return result;
  }

  Sparkline._();

  factory Sparkline.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Sparkline.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Sparkline',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'points', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sparkline clone() => Sparkline()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sparkline copyWith(void Function(Sparkline) updates) =>
      super.copyWith((message) => updates(message as Sparkline)) as Sparkline;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sparkline create() => Sparkline._();
  @$core.override
  Sparkline createEmptyInstance() => create();
  static $pb.PbList<Sparkline> createRepeated() => $pb.PbList<Sparkline>();
  @$core.pragma('dart2js:noInline')
  static Sparkline getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sparkline>(create);
  static Sparkline? _defaultInstance;

  /// One sample per point, scaled 0..255 against the recording's own peak,
  /// evenly spaced over its presentation timeline.
  @$pb.TagNumber(1)
  $core.List<$core.int> get points => $_getN(0);
  @$pb.TagNumber(1)
  set points($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoints() => $_clearField(1);
}

/// Request to list a project's recorded sessions.
class ListSessionsRequest extends $pb.GeneratedMessage {
  factory ListSessionsRequest({
    $0.ProjectId? projectId,
    $2.PageRequest? page,
    $core.bool? unseenOnly,
    $core.Iterable<$0.ProjectTagId>? tagIds,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (page != null) result.page = page;
    if (unseenOnly != null) result.unseenOnly = unseenOnly;
    if (tagIds != null) result.tagIds.addAll(tagIds);
    return result;
  }

  ListSessionsRequest._();

  factory ListSessionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSessionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSessionsRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$2.PageRequest>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageRequest.create)
    ..aOB(3, _omitFieldNames ? '' : 'unseenOnly')
    ..pc<$0.ProjectTagId>(
        4, _omitFieldNames ? '' : 'tagIds', $pb.PbFieldType.PM,
        subBuilder: $0.ProjectTagId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSessionsRequest clone() => ListSessionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSessionsRequest copyWith(void Function(ListSessionsRequest) updates) =>
      super.copyWith((message) => updates(message as ListSessionsRequest))
          as ListSessionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSessionsRequest create() => ListSessionsRequest._();
  @$core.override
  ListSessionsRequest createEmptyInstance() => create();
  static $pb.PbList<ListSessionsRequest> createRepeated() =>
      $pb.PbList<ListSessionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSessionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSessionsRequest>(create);
  static ListSessionsRequest? _defaultInstance;

  /// The project whose sessions to list.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

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

  /// Return only the sessions the calling user has not seen. The default
  /// returns every session, each annotated with Session.seen.
  @$pb.TagNumber(3)
  $core.bool get unseenOnly => $_getBF(2);
  @$pb.TagNumber(3)
  set unseenOnly($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnseenOnly() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnseenOnly() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$0.ProjectTagId> get tagIds => $_getList(3);
}

/// Response to a list-sessions request.
class ListSessionsResponse extends $pb.GeneratedMessage {
  factory ListSessionsResponse({
    $core.Iterable<Session>? sessions,
    $2.PageResponse? page,
  }) {
    final result = create();
    if (sessions != null) result.sessions.addAll(sessions);
    if (page != null) result.page = page;
    return result;
  }

  ListSessionsResponse._();

  factory ListSessionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSessionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSessionsResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..pc<Session>(1, _omitFieldNames ? '' : 'sessions', $pb.PbFieldType.PM,
        subBuilder: Session.create)
    ..aOM<$2.PageResponse>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSessionsResponse clone() =>
      ListSessionsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSessionsResponse copyWith(void Function(ListSessionsResponse) updates) =>
      super.copyWith((message) => updates(message as ListSessionsResponse))
          as ListSessionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSessionsResponse create() => ListSessionsResponse._();
  @$core.override
  ListSessionsResponse createEmptyInstance() => create();
  static $pb.PbList<ListSessionsResponse> createRepeated() =>
      $pb.PbList<ListSessionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListSessionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSessionsResponse>(create);
  static ListSessionsResponse? _defaultInstance;

  /// A page of the project's sessions. May be empty if none have been recorded,
  /// and may be shorter than the page size requested.
  @$pb.TagNumber(1)
  $pb.PbList<Session> get sessions => $_getList(0);

  /// Pagination cursor for fetching the next page. Check page.next_page_token
  /// to determine if the listing is finished (keep paging while it is set).
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

/// Request to list a project's live (still-recording) sessions.
class ListLiveSessionsRequest extends $pb.GeneratedMessage {
  factory ListLiveSessionsRequest({
    $0.ProjectId? projectId,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    return result;
  }

  ListLiveSessionsRequest._();

  factory ListLiveSessionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListLiveSessionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListLiveSessionsRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListLiveSessionsRequest clone() =>
      ListLiveSessionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListLiveSessionsRequest copyWith(
          void Function(ListLiveSessionsRequest) updates) =>
      super.copyWith((message) => updates(message as ListLiveSessionsRequest))
          as ListLiveSessionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLiveSessionsRequest create() => ListLiveSessionsRequest._();
  @$core.override
  ListLiveSessionsRequest createEmptyInstance() => create();
  static $pb.PbList<ListLiveSessionsRequest> createRepeated() =>
      $pb.PbList<ListLiveSessionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListLiveSessionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListLiveSessionsRequest>(create);
  static ListLiveSessionsRequest? _defaultInstance;

  /// The project whose live sessions to list.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);
}

/// Response to a list-live-sessions request. Not paginated: live sessions are
/// bounded by how many recordings run at once, so every one is returned.
class ListLiveSessionsResponse extends $pb.GeneratedMessage {
  factory ListLiveSessionsResponse({
    $core.Iterable<Session>? sessions,
  }) {
    final result = create();
    if (sessions != null) result.sessions.addAll(sessions);
    return result;
  }

  ListLiveSessionsResponse._();

  factory ListLiveSessionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListLiveSessionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListLiveSessionsResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..pc<Session>(1, _omitFieldNames ? '' : 'sessions', $pb.PbFieldType.PM,
        subBuilder: Session.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListLiveSessionsResponse clone() =>
      ListLiveSessionsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListLiveSessionsResponse copyWith(
          void Function(ListLiveSessionsResponse) updates) =>
      super.copyWith((message) => updates(message as ListLiveSessionsResponse))
          as ListLiveSessionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLiveSessionsResponse create() => ListLiveSessionsResponse._();
  @$core.override
  ListLiveSessionsResponse createEmptyInstance() => create();
  static $pb.PbList<ListLiveSessionsResponse> createRepeated() =>
      $pb.PbList<ListLiveSessionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListLiveSessionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListLiveSessionsResponse>(create);
  static ListLiveSessionsResponse? _defaultInstance;

  /// The project's live sessions, newest started first. Each has status
  /// RECORDING, so ended_at and duration are unset.
  @$pb.TagNumber(1)
  $pb.PbList<Session> get sessions => $_getList(0);
}

/// Request to fetch a single session.
class GetSessionRequest extends $pb.GeneratedMessage {
  factory GetSessionRequest({
    $0.ProjectId? projectId,
    $0.SessionId? id,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (id != null) result.id = id;
    return result;
  }

  GetSessionRequest._();

  factory GetSessionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSessionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSessionRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'id',
        subBuilder: $0.SessionId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionRequest clone() => GetSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionRequest copyWith(void Function(GetSessionRequest) updates) =>
      super.copyWith((message) => updates(message as GetSessionRequest))
          as GetSessionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSessionRequest create() => GetSessionRequest._();
  @$core.override
  GetSessionRequest createEmptyInstance() => create();
  static $pb.PbList<GetSessionRequest> createRepeated() =>
      $pb.PbList<GetSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSessionRequest>(create);
  static GetSessionRequest? _defaultInstance;

  /// The project the session belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The session to fetch.
  @$pb.TagNumber(2)
  $0.SessionId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($0.SessionId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SessionId ensureId() => $_ensure(1);
}

/// Response to a get-session request.
class GetSessionResponse extends $pb.GeneratedMessage {
  factory GetSessionResponse({
    Session? session,
  }) {
    final result = create();
    if (session != null) result.session = session;
    return result;
  }

  GetSessionResponse._();

  factory GetSessionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSessionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSessionResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<Session>(1, _omitFieldNames ? '' : 'session',
        subBuilder: Session.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionResponse clone() => GetSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionResponse copyWith(void Function(GetSessionResponse) updates) =>
      super.copyWith((message) => updates(message as GetSessionResponse))
          as GetSessionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSessionResponse create() => GetSessionResponse._();
  @$core.override
  GetSessionResponse createEmptyInstance() => create();
  static $pb.PbList<GetSessionResponse> createRepeated() =>
      $pb.PbList<GetSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSessionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSessionResponse>(create);
  static GetSessionResponse? _defaultInstance;

  /// The requested session.
  @$pb.TagNumber(1)
  Session get session => $_getN(0);
  @$pb.TagNumber(1)
  set session(Session value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);
  @$pb.TagNumber(1)
  Session ensureSession() => $_ensure(0);
}

/// Request to update a session's mutable properties.
class UpdateSessionRequest extends $pb.GeneratedMessage {
  factory UpdateSessionRequest({
    $0.ProjectId? projectId,
    $0.SessionId? id,
    SessionTagUpdate? tags,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (id != null) result.id = id;
    if (tags != null) result.tags = tags;
    return result;
  }

  UpdateSessionRequest._();

  factory UpdateSessionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSessionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSessionRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'id',
        subBuilder: $0.SessionId.create)
    ..aOM<SessionTagUpdate>(3, _omitFieldNames ? '' : 'tags',
        subBuilder: SessionTagUpdate.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSessionRequest clone() =>
      UpdateSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSessionRequest copyWith(void Function(UpdateSessionRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateSessionRequest))
          as UpdateSessionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSessionRequest create() => UpdateSessionRequest._();
  @$core.override
  UpdateSessionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSessionRequest> createRepeated() =>
      $pb.PbList<UpdateSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSessionRequest>(create);
  static UpdateSessionRequest? _defaultInstance;

  /// The project the session belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The session to update.
  @$pb.TagNumber(2)
  $0.SessionId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($0.SessionId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SessionId ensureId() => $_ensure(1);

  @$pb.TagNumber(3)
  SessionTagUpdate get tags => $_getN(2);
  @$pb.TagNumber(3)
  set tags(SessionTagUpdate value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTags() => $_has(2);
  @$pb.TagNumber(3)
  void clearTags() => $_clearField(3);
  @$pb.TagNumber(3)
  SessionTagUpdate ensureTags() => $_ensure(2);
}

/// Response to an update-session request.
class UpdateSessionResponse extends $pb.GeneratedMessage {
  factory UpdateSessionResponse({
    Session? session,
  }) {
    final result = create();
    if (session != null) result.session = session;
    return result;
  }

  UpdateSessionResponse._();

  factory UpdateSessionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSessionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSessionResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<Session>(1, _omitFieldNames ? '' : 'session',
        subBuilder: Session.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSessionResponse clone() =>
      UpdateSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSessionResponse copyWith(
          void Function(UpdateSessionResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateSessionResponse))
          as UpdateSessionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSessionResponse create() => UpdateSessionResponse._();
  @$core.override
  UpdateSessionResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSessionResponse> createRepeated() =>
      $pb.PbList<UpdateSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSessionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSessionResponse>(create);
  static UpdateSessionResponse? _defaultInstance;

  /// The session after the update.
  @$pb.TagNumber(1)
  Session get session => $_getN(0);
  @$pb.TagNumber(1)
  set session(Session value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);
  @$pb.TagNumber(1)
  Session ensureSession() => $_ensure(0);
}

/// Request to delete a session and its captured media.
class DeleteSessionRequest extends $pb.GeneratedMessage {
  factory DeleteSessionRequest({
    $0.ProjectId? projectId,
    $0.SessionId? id,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (id != null) result.id = id;
    return result;
  }

  DeleteSessionRequest._();

  factory DeleteSessionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteSessionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteSessionRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'id',
        subBuilder: $0.SessionId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSessionRequest clone() =>
      DeleteSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSessionRequest copyWith(void Function(DeleteSessionRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteSessionRequest))
          as DeleteSessionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSessionRequest create() => DeleteSessionRequest._();
  @$core.override
  DeleteSessionRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSessionRequest> createRepeated() =>
      $pb.PbList<DeleteSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteSessionRequest>(create);
  static DeleteSessionRequest? _defaultInstance;

  /// The project the session belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The session to delete.
  @$pb.TagNumber(2)
  $0.SessionId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($0.SessionId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SessionId ensureId() => $_ensure(1);
}

/// Response to a delete-session request.
class DeleteSessionResponse extends $pb.GeneratedMessage {
  factory DeleteSessionResponse() => create();

  DeleteSessionResponse._();

  factory DeleteSessionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteSessionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteSessionResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSessionResponse clone() =>
      DeleteSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSessionResponse copyWith(
          void Function(DeleteSessionResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteSessionResponse))
          as DeleteSessionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSessionResponse create() => DeleteSessionResponse._();
  @$core.override
  DeleteSessionResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteSessionResponse> createRepeated() =>
      $pb.PbList<DeleteSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteSessionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteSessionResponse>(create);
  static DeleteSessionResponse? _defaultInstance;
}

/// Request to list a project's deleted-but-restorable sessions.
class ListDeletedSessionsRequest extends $pb.GeneratedMessage {
  factory ListDeletedSessionsRequest({
    $0.ProjectId? projectId,
    $2.PageRequest? page,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (page != null) result.page = page;
    return result;
  }

  ListDeletedSessionsRequest._();

  factory ListDeletedSessionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeletedSessionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeletedSessionsRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$2.PageRequest>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeletedSessionsRequest clone() =>
      ListDeletedSessionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeletedSessionsRequest copyWith(
          void Function(ListDeletedSessionsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListDeletedSessionsRequest))
          as ListDeletedSessionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeletedSessionsRequest create() => ListDeletedSessionsRequest._();
  @$core.override
  ListDeletedSessionsRequest createEmptyInstance() => create();
  static $pb.PbList<ListDeletedSessionsRequest> createRepeated() =>
      $pb.PbList<ListDeletedSessionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListDeletedSessionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeletedSessionsRequest>(create);
  static ListDeletedSessionsRequest? _defaultInstance;

  /// The project whose deleted sessions to list.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

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

/// Response to a list-deleted-sessions request.
class ListDeletedSessionsResponse extends $pb.GeneratedMessage {
  factory ListDeletedSessionsResponse({
    $core.Iterable<Session>? sessions,
    $2.PageResponse? page,
  }) {
    final result = create();
    if (sessions != null) result.sessions.addAll(sessions);
    if (page != null) result.page = page;
    return result;
  }

  ListDeletedSessionsResponse._();

  factory ListDeletedSessionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeletedSessionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeletedSessionsResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..pc<Session>(1, _omitFieldNames ? '' : 'sessions', $pb.PbFieldType.PM,
        subBuilder: Session.create)
    ..aOM<$2.PageResponse>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeletedSessionsResponse clone() =>
      ListDeletedSessionsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeletedSessionsResponse copyWith(
          void Function(ListDeletedSessionsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListDeletedSessionsResponse))
          as ListDeletedSessionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeletedSessionsResponse create() =>
      ListDeletedSessionsResponse._();
  @$core.override
  ListDeletedSessionsResponse createEmptyInstance() => create();
  static $pb.PbList<ListDeletedSessionsResponse> createRepeated() =>
      $pb.PbList<ListDeletedSessionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListDeletedSessionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeletedSessionsResponse>(create);
  static ListDeletedSessionsResponse? _defaultInstance;

  /// A page of the project's deleted sessions, most recently deleted first.
  @$pb.TagNumber(1)
  $pb.PbList<Session> get sessions => $_getList(0);

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

/// Request to undo a session's deletion.
class RestoreSessionRequest extends $pb.GeneratedMessage {
  factory RestoreSessionRequest({
    $0.ProjectId? projectId,
    $0.SessionId? id,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (id != null) result.id = id;
    return result;
  }

  RestoreSessionRequest._();

  factory RestoreSessionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RestoreSessionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RestoreSessionRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'id',
        subBuilder: $0.SessionId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestoreSessionRequest clone() =>
      RestoreSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestoreSessionRequest copyWith(
          void Function(RestoreSessionRequest) updates) =>
      super.copyWith((message) => updates(message as RestoreSessionRequest))
          as RestoreSessionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestoreSessionRequest create() => RestoreSessionRequest._();
  @$core.override
  RestoreSessionRequest createEmptyInstance() => create();
  static $pb.PbList<RestoreSessionRequest> createRepeated() =>
      $pb.PbList<RestoreSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static RestoreSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RestoreSessionRequest>(create);
  static RestoreSessionRequest? _defaultInstance;

  /// The project the session belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The session to restore.
  @$pb.TagNumber(2)
  $0.SessionId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($0.SessionId value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SessionId ensureId() => $_ensure(1);
}

/// Response to a restore-session request.
class RestoreSessionResponse extends $pb.GeneratedMessage {
  factory RestoreSessionResponse({
    Session? session,
  }) {
    final result = create();
    if (session != null) result.session = session;
    return result;
  }

  RestoreSessionResponse._();

  factory RestoreSessionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RestoreSessionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RestoreSessionResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<Session>(1, _omitFieldNames ? '' : 'session',
        subBuilder: Session.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestoreSessionResponse clone() =>
      RestoreSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestoreSessionResponse copyWith(
          void Function(RestoreSessionResponse) updates) =>
      super.copyWith((message) => updates(message as RestoreSessionResponse))
          as RestoreSessionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestoreSessionResponse create() => RestoreSessionResponse._();
  @$core.override
  RestoreSessionResponse createEmptyInstance() => create();
  static $pb.PbList<RestoreSessionResponse> createRepeated() =>
      $pb.PbList<RestoreSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static RestoreSessionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RestoreSessionResponse>(create);
  static RestoreSessionResponse? _defaultInstance;

  /// The restored session, as it now reads.
  @$pb.TagNumber(1)
  Session get session => $_getN(0);
  @$pb.TagNumber(1)
  set session(Session value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);
  @$pb.TagNumber(1)
  Session ensureSession() => $_ensure(0);
}

/// How many of a project's sessions the calling user has not seen.
class UnseenSessionCount extends $pb.GeneratedMessage {
  factory UnseenSessionCount({
    $core.int? count,
    $core.bool? capped,
  }) {
    final result = create();
    if (count != null) result.count = count;
    if (capped != null) result.capped = capped;
    return result;
  }

  UnseenSessionCount._();

  factory UnseenSessionCount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnseenSessionCount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnseenSessionCount',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..aOB(2, _omitFieldNames ? '' : 'capped')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnseenSessionCount clone() => UnseenSessionCount()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnseenSessionCount copyWith(void Function(UnseenSessionCount) updates) =>
      super.copyWith((message) => updates(message as UnseenSessionCount))
          as UnseenSessionCount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnseenSessionCount create() => UnseenSessionCount._();
  @$core.override
  UnseenSessionCount createEmptyInstance() => create();
  static $pb.PbList<UnseenSessionCount> createRepeated() =>
      $pb.PbList<UnseenSessionCount>();
  @$core.pragma('dart2js:noInline')
  static UnseenSessionCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnseenSessionCount>(create);
  static UnseenSessionCount? _defaultInstance;

  /// The number of unseen sessions, or the server's display cap when capped.
  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  /// True when the count stopped at the server's display cap: there are at
  /// least count unseen sessions, and the caller should render "count+".
  @$pb.TagNumber(2)
  $core.bool get capped => $_getBF(1);
  @$pb.TagNumber(2)
  set capped($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCapped() => $_has(1);
  @$pb.TagNumber(2)
  void clearCapped() => $_clearField(2);
}

/// Request to mark sessions seen, or unseen, by the calling user.
class MarkSessionsSeenRequest extends $pb.GeneratedMessage {
  factory MarkSessionsSeenRequest({
    $0.ProjectId? projectId,
    $core.Iterable<$0.SessionId>? ids,
    $core.bool? seen,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (ids != null) result.ids.addAll(ids);
    if (seen != null) result.seen = seen;
    return result;
  }

  MarkSessionsSeenRequest._();

  factory MarkSessionsSeenRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarkSessionsSeenRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarkSessionsSeenRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..pc<$0.SessionId>(2, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.PM,
        subBuilder: $0.SessionId.create)
    ..aOB(3, _omitFieldNames ? '' : 'seen')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkSessionsSeenRequest clone() =>
      MarkSessionsSeenRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkSessionsSeenRequest copyWith(
          void Function(MarkSessionsSeenRequest) updates) =>
      super.copyWith((message) => updates(message as MarkSessionsSeenRequest))
          as MarkSessionsSeenRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkSessionsSeenRequest create() => MarkSessionsSeenRequest._();
  @$core.override
  MarkSessionsSeenRequest createEmptyInstance() => create();
  static $pb.PbList<MarkSessionsSeenRequest> createRepeated() =>
      $pb.PbList<MarkSessionsSeenRequest>();
  @$core.pragma('dart2js:noInline')
  static MarkSessionsSeenRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarkSessionsSeenRequest>(create);
  static MarkSessionsSeenRequest? _defaultInstance;

  /// The project the sessions belong to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The sessions to mark. Ids naming a session that does not exist are
  /// ignored. The server rejects a request carrying more than 1000 ids.
  @$pb.TagNumber(2)
  $pb.PbList<$0.SessionId> get ids => $_getList(1);

  /// Mark the sessions seen, or unseen when false.
  @$pb.TagNumber(3)
  $core.bool get seen => $_getBF(2);
  @$pb.TagNumber(3)
  set seen($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSeen() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeen() => $_clearField(3);
}

/// Response to a mark-sessions-seen request.
class MarkSessionsSeenResponse extends $pb.GeneratedMessage {
  factory MarkSessionsSeenResponse({
    UnseenSessionCount? unseen,
  }) {
    final result = create();
    if (unseen != null) result.unseen = unseen;
    return result;
  }

  MarkSessionsSeenResponse._();

  factory MarkSessionsSeenResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarkSessionsSeenResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarkSessionsSeenResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<UnseenSessionCount>(1, _omitFieldNames ? '' : 'unseen',
        subBuilder: UnseenSessionCount.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkSessionsSeenResponse clone() =>
      MarkSessionsSeenResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkSessionsSeenResponse copyWith(
          void Function(MarkSessionsSeenResponse) updates) =>
      super.copyWith((message) => updates(message as MarkSessionsSeenResponse))
          as MarkSessionsSeenResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkSessionsSeenResponse create() => MarkSessionsSeenResponse._();
  @$core.override
  MarkSessionsSeenResponse createEmptyInstance() => create();
  static $pb.PbList<MarkSessionsSeenResponse> createRepeated() =>
      $pb.PbList<MarkSessionsSeenResponse>();
  @$core.pragma('dart2js:noInline')
  static MarkSessionsSeenResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarkSessionsSeenResponse>(create);
  static MarkSessionsSeenResponse? _defaultInstance;

  /// The unseen count after the marks were applied, so a caller that updated
  /// its view optimistically can reconcile without a second round trip.
  @$pb.TagNumber(1)
  UnseenSessionCount get unseen => $_getN(0);
  @$pb.TagNumber(1)
  set unseen(UnseenSessionCount value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUnseen() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnseen() => $_clearField(1);
  @$pb.TagNumber(1)
  UnseenSessionCount ensureUnseen() => $_ensure(0);
}

/// Request to mark every one of a project's sessions seen by the calling user.
class MarkAllSessionsSeenRequest extends $pb.GeneratedMessage {
  factory MarkAllSessionsSeenRequest({
    $0.ProjectId? projectId,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    return result;
  }

  MarkAllSessionsSeenRequest._();

  factory MarkAllSessionsSeenRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarkAllSessionsSeenRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarkAllSessionsSeenRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkAllSessionsSeenRequest clone() =>
      MarkAllSessionsSeenRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkAllSessionsSeenRequest copyWith(
          void Function(MarkAllSessionsSeenRequest) updates) =>
      super.copyWith(
              (message) => updates(message as MarkAllSessionsSeenRequest))
          as MarkAllSessionsSeenRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkAllSessionsSeenRequest create() => MarkAllSessionsSeenRequest._();
  @$core.override
  MarkAllSessionsSeenRequest createEmptyInstance() => create();
  static $pb.PbList<MarkAllSessionsSeenRequest> createRepeated() =>
      $pb.PbList<MarkAllSessionsSeenRequest>();
  @$core.pragma('dart2js:noInline')
  static MarkAllSessionsSeenRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarkAllSessionsSeenRequest>(create);
  static MarkAllSessionsSeenRequest? _defaultInstance;

  /// The project whose sessions to mark seen.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);
}

/// Response to a mark-all-sessions-seen request. There is deliberately no
/// mark-all-unseen: seen state is stored as a per-user bitset over the project's
/// sessions, in which "all seen" is a constant-size run but "all unseen" is not.
class MarkAllSessionsSeenResponse extends $pb.GeneratedMessage {
  factory MarkAllSessionsSeenResponse({
    UnseenSessionCount? unseen,
  }) {
    final result = create();
    if (unseen != null) result.unseen = unseen;
    return result;
  }

  MarkAllSessionsSeenResponse._();

  factory MarkAllSessionsSeenResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarkAllSessionsSeenResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarkAllSessionsSeenResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<UnseenSessionCount>(1, _omitFieldNames ? '' : 'unseen',
        subBuilder: UnseenSessionCount.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkAllSessionsSeenResponse clone() =>
      MarkAllSessionsSeenResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkAllSessionsSeenResponse copyWith(
          void Function(MarkAllSessionsSeenResponse) updates) =>
      super.copyWith(
              (message) => updates(message as MarkAllSessionsSeenResponse))
          as MarkAllSessionsSeenResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkAllSessionsSeenResponse create() =>
      MarkAllSessionsSeenResponse._();
  @$core.override
  MarkAllSessionsSeenResponse createEmptyInstance() => create();
  static $pb.PbList<MarkAllSessionsSeenResponse> createRepeated() =>
      $pb.PbList<MarkAllSessionsSeenResponse>();
  @$core.pragma('dart2js:noInline')
  static MarkAllSessionsSeenResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarkAllSessionsSeenResponse>(create);
  static MarkAllSessionsSeenResponse? _defaultInstance;

  /// The unseen count after the mark. Zero, absent a concurrent recording.
  @$pb.TagNumber(1)
  UnseenSessionCount get unseen => $_getN(0);
  @$pb.TagNumber(1)
  set unseen(UnseenSessionCount value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUnseen() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnseen() => $_clearField(1);
  @$pb.TagNumber(1)
  UnseenSessionCount ensureUnseen() => $_ensure(0);
}

/// Request for the calling user's unseen count in a project.
class GetUnseenSessionCountRequest extends $pb.GeneratedMessage {
  factory GetUnseenSessionCountRequest({
    $0.ProjectId? projectId,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    return result;
  }

  GetUnseenSessionCountRequest._();

  factory GetUnseenSessionCountRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUnseenSessionCountRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUnseenSessionCountRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUnseenSessionCountRequest clone() =>
      GetUnseenSessionCountRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUnseenSessionCountRequest copyWith(
          void Function(GetUnseenSessionCountRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetUnseenSessionCountRequest))
          as GetUnseenSessionCountRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUnseenSessionCountRequest create() =>
      GetUnseenSessionCountRequest._();
  @$core.override
  GetUnseenSessionCountRequest createEmptyInstance() => create();
  static $pb.PbList<GetUnseenSessionCountRequest> createRepeated() =>
      $pb.PbList<GetUnseenSessionCountRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUnseenSessionCountRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUnseenSessionCountRequest>(create);
  static GetUnseenSessionCountRequest? _defaultInstance;

  /// The project to count unseen sessions in.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);
}

/// Response to a get-unseen-session-count request.
class GetUnseenSessionCountResponse extends $pb.GeneratedMessage {
  factory GetUnseenSessionCountResponse({
    UnseenSessionCount? unseen,
  }) {
    final result = create();
    if (unseen != null) result.unseen = unseen;
    return result;
  }

  GetUnseenSessionCountResponse._();

  factory GetUnseenSessionCountResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUnseenSessionCountResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUnseenSessionCountResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<UnseenSessionCount>(1, _omitFieldNames ? '' : 'unseen',
        subBuilder: UnseenSessionCount.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUnseenSessionCountResponse clone() =>
      GetUnseenSessionCountResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUnseenSessionCountResponse copyWith(
          void Function(GetUnseenSessionCountResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetUnseenSessionCountResponse))
          as GetUnseenSessionCountResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUnseenSessionCountResponse create() =>
      GetUnseenSessionCountResponse._();
  @$core.override
  GetUnseenSessionCountResponse createEmptyInstance() => create();
  static $pb.PbList<GetUnseenSessionCountResponse> createRepeated() =>
      $pb.PbList<GetUnseenSessionCountResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUnseenSessionCountResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUnseenSessionCountResponse>(create);
  static GetUnseenSessionCountResponse? _defaultInstance;

  /// The calling user's unseen count.
  @$pb.TagNumber(1)
  UnseenSessionCount get unseen => $_getN(0);
  @$pb.TagNumber(1)
  set unseen(UnseenSessionCount value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUnseen() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnseen() => $_clearField(1);
  @$pb.TagNumber(1)
  UnseenSessionCount ensureUnseen() => $_ensure(0);
}

/// Request to delete every session of a project.
class ClearSessionsRequest extends $pb.GeneratedMessage {
  factory ClearSessionsRequest({
    $0.ProjectId? projectId,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    return result;
  }

  ClearSessionsRequest._();

  factory ClearSessionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClearSessionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClearSessionsRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearSessionsRequest clone() =>
      ClearSessionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearSessionsRequest copyWith(void Function(ClearSessionsRequest) updates) =>
      super.copyWith((message) => updates(message as ClearSessionsRequest))
          as ClearSessionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClearSessionsRequest create() => ClearSessionsRequest._();
  @$core.override
  ClearSessionsRequest createEmptyInstance() => create();
  static $pb.PbList<ClearSessionsRequest> createRepeated() =>
      $pb.PbList<ClearSessionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ClearSessionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClearSessionsRequest>(create);
  static ClearSessionsRequest? _defaultInstance;

  /// The project whose sessions to delete.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);
}

/// Response to a clear-sessions request.
class ClearSessionsResponse extends $pb.GeneratedMessage {
  factory ClearSessionsResponse() => create();

  ClearSessionsResponse._();

  factory ClearSessionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClearSessionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClearSessionsResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearSessionsResponse clone() =>
      ClearSessionsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearSessionsResponse copyWith(
          void Function(ClearSessionsResponse) updates) =>
      super.copyWith((message) => updates(message as ClearSessionsResponse))
          as ClearSessionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClearSessionsResponse create() => ClearSessionsResponse._();
  @$core.override
  ClearSessionsResponse createEmptyInstance() => create();
  static $pb.PbList<ClearSessionsResponse> createRepeated() =>
      $pb.PbList<ClearSessionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ClearSessionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClearSessionsResponse>(create);
  static ClearSessionsResponse? _defaultInstance;
}

/// Request for a playback URL for a session's recording.
class GetSessionPlaybackUrlRequest extends $pb.GeneratedMessage {
  factory GetSessionPlaybackUrlRequest({
    $0.ProjectId? projectId,
    $0.SessionId? sessionId,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  GetSessionPlaybackUrlRequest._();

  factory GetSessionPlaybackUrlRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSessionPlaybackUrlRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSessionPlaybackUrlRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionPlaybackUrlRequest clone() =>
      GetSessionPlaybackUrlRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionPlaybackUrlRequest copyWith(
          void Function(GetSessionPlaybackUrlRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetSessionPlaybackUrlRequest))
          as GetSessionPlaybackUrlRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSessionPlaybackUrlRequest create() =>
      GetSessionPlaybackUrlRequest._();
  @$core.override
  GetSessionPlaybackUrlRequest createEmptyInstance() => create();
  static $pb.PbList<GetSessionPlaybackUrlRequest> createRepeated() =>
      $pb.PbList<GetSessionPlaybackUrlRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSessionPlaybackUrlRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSessionPlaybackUrlRequest>(create);
  static GetSessionPlaybackUrlRequest? _defaultInstance;

  /// The project the session belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The session to play back. Must have finished recording.
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

/// Response to a get-session-playback-url request.
class GetSessionPlaybackUrlResponse extends $pb.GeneratedMessage {
  factory GetSessionPlaybackUrlResponse({
    $core.String? playlistUrl,
    $3.Timestamp? expiresAt,
  }) {
    final result = create();
    if (playlistUrl != null) result.playlistUrl = playlistUrl;
    if (expiresAt != null) result.expiresAt = expiresAt;
    return result;
  }

  GetSessionPlaybackUrlResponse._();

  factory GetSessionPlaybackUrlResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSessionPlaybackUrlResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSessionPlaybackUrlResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playlistUrl')
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'expiresAt',
        subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionPlaybackUrlResponse clone() =>
      GetSessionPlaybackUrlResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionPlaybackUrlResponse copyWith(
          void Function(GetSessionPlaybackUrlResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetSessionPlaybackUrlResponse))
          as GetSessionPlaybackUrlResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSessionPlaybackUrlResponse create() =>
      GetSessionPlaybackUrlResponse._();
  @$core.override
  GetSessionPlaybackUrlResponse createEmptyInstance() => create();
  static $pb.PbList<GetSessionPlaybackUrlResponse> createRepeated() =>
      $pb.PbList<GetSessionPlaybackUrlResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSessionPlaybackUrlResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSessionPlaybackUrlResponse>(create);
  static GetSessionPlaybackUrlResponse? _defaultInstance;

  /// Fully-qualified playlist URL.
  @$pb.TagNumber(1)
  $core.String get playlistUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set playlistUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlaylistUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaylistUrl() => $_clearField(1);

  /// When playlist_url stops working.
  @$pb.TagNumber(2)
  $3.Timestamp get expiresAt => $_getN(1);
  @$pb.TagNumber(2)
  set expiresAt($3.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasExpiresAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresAt() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureExpiresAt() => $_ensure(1);
}

/// Request to watch a session that is currently recording.
class WatchLiveSessionRequest extends $pb.GeneratedMessage {
  factory WatchLiveSessionRequest({
    $0.ProjectId? projectId,
    $0.SessionId? sessionId,
    $core.String? sdpOffer,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (sessionId != null) result.sessionId = sessionId;
    if (sdpOffer != null) result.sdpOffer = sdpOffer;
    return result;
  }

  WatchLiveSessionRequest._();

  factory WatchLiveSessionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WatchLiveSessionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchLiveSessionRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOM<$0.ProjectId>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: $0.ProjectId.create)
    ..aOM<$0.SessionId>(2, _omitFieldNames ? '' : 'sessionId',
        subBuilder: $0.SessionId.create)
    ..aOS(3, _omitFieldNames ? '' : 'sdpOffer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchLiveSessionRequest clone() =>
      WatchLiveSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchLiveSessionRequest copyWith(
          void Function(WatchLiveSessionRequest) updates) =>
      super.copyWith((message) => updates(message as WatchLiveSessionRequest))
          as WatchLiveSessionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchLiveSessionRequest create() => WatchLiveSessionRequest._();
  @$core.override
  WatchLiveSessionRequest createEmptyInstance() => create();
  static $pb.PbList<WatchLiveSessionRequest> createRepeated() =>
      $pb.PbList<WatchLiveSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static WatchLiveSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchLiveSessionRequest>(create);
  static WatchLiveSessionRequest? _defaultInstance;

  /// The project the session belongs to.
  @$pb.TagNumber(1)
  $0.ProjectId get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId($0.ProjectId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ProjectId ensureProjectId() => $_ensure(0);

  /// The session to watch. Must still be recording.
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

  /// The viewer's SDP offer, from a peer connection carrying one recvonly
  /// video transceiver and with ICE gathering complete. Required for a
  /// LIVE_TRANSPORT_SFU session, ignored otherwise.
  @$pb.TagNumber(3)
  $core.String get sdpOffer => $_getSZ(2);
  @$pb.TagNumber(3)
  set sdpOffer($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSdpOffer() => $_has(2);
  @$pb.TagNumber(3)
  void clearSdpOffer() => $_clearField(3);
}

/// Response to a watch-live-session request. Exactly one of the two is set,
/// according to the session's live_transport.
class WatchLiveSessionResponse extends $pb.GeneratedMessage {
  factory WatchLiveSessionResponse({
    $core.String? sdpAnswer,
    LiveView? liveView,
  }) {
    final result = create();
    if (sdpAnswer != null) result.sdpAnswer = sdpAnswer;
    if (liveView != null) result.liveView = liveView;
    return result;
  }

  WatchLiveSessionResponse._();

  factory WatchLiveSessionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WatchLiveSessionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchLiveSessionResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sdpAnswer')
    ..aOM<LiveView>(2, _omitFieldNames ? '' : 'liveView',
        subBuilder: LiveView.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchLiveSessionResponse clone() =>
      WatchLiveSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchLiveSessionResponse copyWith(
          void Function(WatchLiveSessionResponse) updates) =>
      super.copyWith((message) => updates(message as WatchLiveSessionResponse))
          as WatchLiveSessionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchLiveSessionResponse create() => WatchLiveSessionResponse._();
  @$core.override
  WatchLiveSessionResponse createEmptyInstance() => create();
  static $pb.PbList<WatchLiveSessionResponse> createRepeated() =>
      $pb.PbList<WatchLiveSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static WatchLiveSessionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchLiveSessionResponse>(create);
  static WatchLiveSessionResponse? _defaultInstance;

  /// The SDP answer to apply as the viewer's remote description.
  @$pb.TagNumber(1)
  $core.String get sdpAnswer => $_getSZ(0);
  @$pb.TagNumber(1)
  set sdpAnswer($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSdpAnswer() => $_has(0);
  @$pb.TagNumber(1)
  void clearSdpAnswer() => $_clearField(1);

  /// Where to open a WebSocket for a LIVE_TRANSPORT_UPLOAD session.
  @$pb.TagNumber(2)
  LiveView get liveView => $_getN(1);
  @$pb.TagNumber(2)
  set liveView(LiveView value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLiveView() => $_has(1);
  @$pb.TagNumber(2)
  void clearLiveView() => $_clearField(2);
  @$pb.TagNumber(2)
  LiveView ensureLiveView() => $_ensure(1);
}

/// A viewer's attachment to an uploading session's live relay. The relay socket
/// carries no credential; session.read on WatchLiveSession is the whole
/// authorization decision.
class LiveView extends $pb.GeneratedMessage {
  factory LiveView({
    $core.String? relayUrl,
  }) {
    final result = create();
    if (relayUrl != null) result.relayUrl = relayUrl;
    return result;
  }

  LiveView._();

  factory LiveView.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LiveView.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LiveView',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.mgmt.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'relayUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LiveView clone() => LiveView()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LiveView copyWith(void Function(LiveView) updates) =>
      super.copyWith((message) => updates(message as LiveView)) as LiveView;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LiveView create() => LiveView._();
  @$core.override
  LiveView createEmptyInstance() => create();
  static $pb.PbList<LiveView> createRepeated() => $pb.PbList<LiveView>();
  @$core.pragma('dart2js:noInline')
  static LiveView getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LiveView>(create);
  static LiveView? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get relayUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set relayUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRelayUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelayUrl() => $_clearField(1);
}

/// Provides data plane functionality related to projects.
class ProjectServiceApi {
  final $pb.RpcClient _client;

  ProjectServiceApi(this._client);

  /// Creates a new project within an organization.
  $async.Future<CreateProjectResponse> createProject(
          $pb.ClientContext? ctx, CreateProjectRequest request) =>
      _client.invoke<CreateProjectResponse>(ctx, 'ProjectService',
          'CreateProject', request, CreateProjectResponse());

  /// Fetches a project.
  $async.Future<GetProjectResponse> getProject(
          $pb.ClientContext? ctx, GetProjectRequest request) =>
      _client.invoke<GetProjectResponse>(
          ctx, 'ProjectService', 'GetProject', request, GetProjectResponse());

  /// Updates a project's mutable properties.
  $async.Future<UpdateProjectResponse> updateProject(
          $pb.ClientContext? ctx, UpdateProjectRequest request) =>
      _client.invoke<UpdateProjectResponse>(ctx, 'ProjectService',
          'UpdateProject', request, UpdateProjectResponse());

  /// Deletes a project.
  $async.Future<DeleteProjectResponse> deleteProject(
          $pb.ClientContext? ctx, DeleteProjectRequest request) =>
      _client.invoke<DeleteProjectResponse>(ctx, 'ProjectService',
          'DeleteProject', request, DeleteProjectResponse());

  /// Issues a new site key for a project.
  $async.Future<CreateSiteKeyResponse> createSiteKey(
          $pb.ClientContext? ctx, CreateSiteKeyRequest request) =>
      _client.invoke<CreateSiteKeyResponse>(ctx, 'ProjectService',
          'CreateSiteKey', request, CreateSiteKeyResponse());

  /// Fetches a single site key belonging to a project.
  $async.Future<GetSiteKeyResponse> getSiteKey(
          $pb.ClientContext? ctx, GetSiteKeyRequest request) =>
      _client.invoke<GetSiteKeyResponse>(
          ctx, 'ProjectService', 'GetSiteKey', request, GetSiteKeyResponse());

  /// Lists the site keys issued for a project.
  $async.Future<ListSiteKeysResponse> listSiteKeys(
          $pb.ClientContext? ctx, ListSiteKeysRequest request) =>
      _client.invoke<ListSiteKeysResponse>(ctx, 'ProjectService',
          'ListSiteKeys', request, ListSiteKeysResponse());

  /// Updates a site key's mutable properties.
  $async.Future<UpdateSiteKeyResponse> updateSiteKey(
          $pb.ClientContext? ctx, UpdateSiteKeyRequest request) =>
      _client.invoke<UpdateSiteKeyResponse>(ctx, 'ProjectService',
          'UpdateSiteKey', request, UpdateSiteKeyResponse());

  /// Revokes an existing site key.
  $async.Future<RevokeSiteKeyResponse> revokeSiteKey(
          $pb.ClientContext? ctx, RevokeSiteKeyRequest request) =>
      _client.invoke<RevokeSiteKeyResponse>(ctx, 'ProjectService',
          'RevokeSiteKey', request, RevokeSiteKeyResponse());

  /// Defines a new tag for a project.
  $async.Future<CreateProjectTagResponse> createProjectTag(
          $pb.ClientContext? ctx, CreateProjectTagRequest request) =>
      _client.invoke<CreateProjectTagResponse>(ctx, 'ProjectService',
          'CreateProjectTag', request, CreateProjectTagResponse());

  /// Lists the tags defined for a project.
  $async.Future<ListProjectTagsResponse> listProjectTags(
          $pb.ClientContext? ctx, ListProjectTagsRequest request) =>
      _client.invoke<ListProjectTagsResponse>(ctx, 'ProjectService',
          'ListProjectTags', request, ListProjectTagsResponse());

  /// Updates a project tag's mutable properties.
  $async.Future<UpdateProjectTagResponse> updateProjectTag(
          $pb.ClientContext? ctx, UpdateProjectTagRequest request) =>
      _client.invoke<UpdateProjectTagResponse>(ctx, 'ProjectService',
          'UpdateProjectTag', request, UpdateProjectTagResponse());

  /// Deletes a project tag, removing it from every session carrying it.
  $async.Future<DeleteProjectTagResponse> deleteProjectTag(
          $pb.ClientContext? ctx, DeleteProjectTagRequest request) =>
      _client.invoke<DeleteProjectTagResponse>(ctx, 'ProjectService',
          'DeleteProjectTag', request, DeleteProjectTagResponse());

  /// Assigns a user a role on a project (creates the edge).
  $async.Future<AssignProjectMemberResponse> assignProjectMember(
          $pb.ClientContext? ctx, AssignProjectMemberRequest request) =>
      _client.invoke<AssignProjectMemberResponse>(ctx, 'ProjectService',
          'AssignProjectMember', request, AssignProjectMemberResponse());

  /// Fetches a user's role on a project.
  $async.Future<GetProjectMemberResponse> getProjectMember(
          $pb.ClientContext? ctx, GetProjectMemberRequest request) =>
      _client.invoke<GetProjectMemberResponse>(ctx, 'ProjectService',
          'GetProjectMember', request, GetProjectMemberResponse());

  /// Updates a project member's role.
  $async.Future<UpdateProjectMemberResponse> updateProjectMember(
          $pb.ClientContext? ctx, UpdateProjectMemberRequest request) =>
      _client.invoke<UpdateProjectMemberResponse>(ctx, 'ProjectService',
          'UpdateProjectMember', request, UpdateProjectMemberResponse());

  /// Removes a user's role on a project (deletes the edge).
  $async.Future<RemoveProjectMemberResponse> removeProjectMember(
          $pb.ClientContext? ctx, RemoveProjectMemberRequest request) =>
      _client.invoke<RemoveProjectMemberResponse>(ctx, 'ProjectService',
          'RemoveProjectMember', request, RemoveProjectMemberResponse());

  /// Lists the members (role overrides) of a project.
  $async.Future<ListProjectMembersResponse> listProjectMembers(
          $pb.ClientContext? ctx, ListProjectMembersRequest request) =>
      _client.invoke<ListProjectMembersResponse>(ctx, 'ProjectService',
          'ListProjectMembers', request, ListProjectMembersResponse());

  /// Lists the recorded sessions belonging to a project.
  $async.Future<ListSessionsResponse> listSessions(
          $pb.ClientContext? ctx, ListSessionsRequest request) =>
      _client.invoke<ListSessionsResponse>(ctx, 'ProjectService',
          'ListSessions', request, ListSessionsResponse());

  /// Lists the project's sessions that are currently being recorded ("live").
  $async.Future<ListLiveSessionsResponse> listLiveSessions(
          $pb.ClientContext? ctx, ListLiveSessionsRequest request) =>
      _client.invoke<ListLiveSessionsResponse>(ctx, 'ProjectService',
          'ListLiveSessions', request, ListLiveSessionsResponse());

  /// Fetches a single recorded session belonging to a project.
  $async.Future<GetSessionResponse> getSession(
          $pb.ClientContext? ctx, GetSessionRequest request) =>
      _client.invoke<GetSessionResponse>(
          ctx, 'ProjectService', 'GetSession', request, GetSessionResponse());

  /// Updates a session's mutable properties.
  $async.Future<UpdateSessionResponse> updateSession(
          $pb.ClientContext? ctx, UpdateSessionRequest request) =>
      _client.invoke<UpdateSessionResponse>(ctx, 'ProjectService',
          'UpdateSession', request, UpdateSessionResponse());

  /// Deletes a recorded session and its captured media.
  $async.Future<DeleteSessionResponse> deleteSession(
          $pb.ClientContext? ctx, DeleteSessionRequest request) =>
      _client.invoke<DeleteSessionResponse>(ctx, 'ProjectService',
          'DeleteSession', request, DeleteSessionResponse());

  /// Lists the deleted sessions of a project that can still be restored.
  $async.Future<ListDeletedSessionsResponse> listDeletedSessions(
          $pb.ClientContext? ctx, ListDeletedSessionsRequest request) =>
      _client.invoke<ListDeletedSessionsResponse>(ctx, 'ProjectService',
          'ListDeletedSessions', request, ListDeletedSessionsResponse());

  /// Undoes a session's deletion, before its captured media is deleted.
  $async.Future<RestoreSessionResponse> restoreSession(
          $pb.ClientContext? ctx, RestoreSessionRequest request) =>
      _client.invoke<RestoreSessionResponse>(ctx, 'ProjectService',
          'RestoreSession', request, RestoreSessionResponse());

  /// Marks sessions seen, or unseen, by the calling user.
  $async.Future<MarkSessionsSeenResponse> markSessionsSeen(
          $pb.ClientContext? ctx, MarkSessionsSeenRequest request) =>
      _client.invoke<MarkSessionsSeenResponse>(ctx, 'ProjectService',
          'MarkSessionsSeen', request, MarkSessionsSeenResponse());

  /// Marks every one of a project's sessions seen by the calling user.
  $async.Future<MarkAllSessionsSeenResponse> markAllSessionsSeen(
          $pb.ClientContext? ctx, MarkAllSessionsSeenRequest request) =>
      _client.invoke<MarkAllSessionsSeenResponse>(ctx, 'ProjectService',
          'MarkAllSessionsSeen', request, MarkAllSessionsSeenResponse());

  /// Counts the project's sessions the calling user has not seen.
  $async.Future<GetUnseenSessionCountResponse> getUnseenSessionCount(
          $pb.ClientContext? ctx, GetUnseenSessionCountRequest request) =>
      _client.invoke<GetUnseenSessionCountResponse>(ctx, 'ProjectService',
          'GetUnseenSessionCount', request, GetUnseenSessionCountResponse());

  /// Deletes every recorded session of a project and their captured media.
  $async.Future<ClearSessionsResponse> clearSessions(
          $pb.ClientContext? ctx, ClearSessionsRequest request) =>
      _client.invoke<ClearSessionsResponse>(ctx, 'ProjectService',
          'ClearSessions', request, ClearSessionsResponse());

  /// Returns a URL for playing back a session's recording.
  $async.Future<GetSessionPlaybackUrlResponse> getSessionPlaybackUrl(
          $pb.ClientContext? ctx, GetSessionPlaybackUrlRequest request) =>
      _client.invoke<GetSessionPlaybackUrlResponse>(ctx, 'ProjectService',
          'GetSessionPlaybackUrl', request, GetSessionPlaybackUrlResponse());

  /// Attaches a viewer to a session that is currently recording, so it can
  /// watch the capture live.
  $async.Future<WatchLiveSessionResponse> watchLiveSession(
          $pb.ClientContext? ctx, WatchLiveSessionRequest request) =>
      _client.invoke<WatchLiveSessionResponse>(ctx, 'ProjectService',
          'WatchLiveSession', request, WatchLiveSessionResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
