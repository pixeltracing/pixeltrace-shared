// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/project.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../../google/protobuf/duration.pbjson.dart' as $4;
import '../../../google/protobuf/field_mask.pbjson.dart' as $1;
import '../../../google/protobuf/timestamp.pbjson.dart' as $3;
import '../../types/v1/types.pbjson.dart' as $0;
import 'types.pbjson.dart' as $2;

@$core.Deprecated('Use projectTagKindDescriptor instead')
const ProjectTagKind$json = {
  '1': 'ProjectTagKind',
  '2': [
    {'1': 'PROJECT_TAG_KIND_UNSPECIFIED', '2': 0},
    {'1': 'PROJECT_TAG_KIND_CUSTOM', '2': 1},
    {'1': 'PROJECT_TAG_KIND_PINNED', '2': 2},
    {'1': 'PROJECT_TAG_KIND_FLAGGED', '2': 3},
  ],
};

/// Descriptor for `ProjectTagKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List projectTagKindDescriptor = $convert.base64Decode(
    'Cg5Qcm9qZWN0VGFnS2luZBIgChxQUk9KRUNUX1RBR19LSU5EX1VOU1BFQ0lGSUVEEAASGwoXUF'
    'JPSkVDVF9UQUdfS0lORF9DVVNUT00QARIbChdQUk9KRUNUX1RBR19LSU5EX1BJTk5FRBACEhwK'
    'GFBST0pFQ1RfVEFHX0tJTkRfRkxBR0dFRBAD');

@$core.Deprecated('Use projectTagColorDescriptor instead')
const ProjectTagColor$json = {
  '1': 'ProjectTagColor',
  '2': [
    {'1': 'PROJECT_TAG_COLOR_UNSPECIFIED', '2': 0},
    {'1': 'PROJECT_TAG_COLOR_NONE', '2': 1},
    {'1': 'PROJECT_TAG_COLOR_BLACK', '2': 2},
    {'1': 'PROJECT_TAG_COLOR_WHITE', '2': 3},
    {'1': 'PROJECT_TAG_COLOR_GRAY', '2': 4},
    {'1': 'PROJECT_TAG_COLOR_RED', '2': 5},
    {'1': 'PROJECT_TAG_COLOR_ORANGE', '2': 6},
    {'1': 'PROJECT_TAG_COLOR_YELLOW', '2': 7},
    {'1': 'PROJECT_TAG_COLOR_GREEN', '2': 8},
    {'1': 'PROJECT_TAG_COLOR_CYAN', '2': 9},
    {'1': 'PROJECT_TAG_COLOR_BLUE', '2': 10},
    {'1': 'PROJECT_TAG_COLOR_INDIGO', '2': 11},
    {'1': 'PROJECT_TAG_COLOR_PURPLE', '2': 12},
    {'1': 'PROJECT_TAG_COLOR_MAGENTA', '2': 13},
  ],
};

/// Descriptor for `ProjectTagColor`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List projectTagColorDescriptor = $convert.base64Decode(
    'Cg9Qcm9qZWN0VGFnQ29sb3ISIQodUFJPSkVDVF9UQUdfQ09MT1JfVU5TUEVDSUZJRUQQABIaCh'
    'ZQUk9KRUNUX1RBR19DT0xPUl9OT05FEAESGwoXUFJPSkVDVF9UQUdfQ09MT1JfQkxBQ0sQAhIb'
    'ChdQUk9KRUNUX1RBR19DT0xPUl9XSElURRADEhoKFlBST0pFQ1RfVEFHX0NPTE9SX0dSQVkQBB'
    'IZChVQUk9KRUNUX1RBR19DT0xPUl9SRUQQBRIcChhQUk9KRUNUX1RBR19DT0xPUl9PUkFOR0UQ'
    'BhIcChhQUk9KRUNUX1RBR19DT0xPUl9ZRUxMT1cQBxIbChdQUk9KRUNUX1RBR19DT0xPUl9HUk'
    'VFThAIEhoKFlBST0pFQ1RfVEFHX0NPTE9SX0NZQU4QCRIaChZQUk9KRUNUX1RBR19DT0xPUl9C'
    'TFVFEAoSHAoYUFJPSkVDVF9UQUdfQ09MT1JfSU5ESUdPEAsSHAoYUFJPSkVDVF9UQUdfQ09MT1'
    'JfUFVSUExFEAwSHQoZUFJPSkVDVF9UQUdfQ09MT1JfTUFHRU5UQRAN');

@$core.Deprecated('Use liveTransportDescriptor instead')
const LiveTransport$json = {
  '1': 'LiveTransport',
  '2': [
    {'1': 'LIVE_TRANSPORT_UNSPECIFIED', '2': 0},
    {'1': 'LIVE_TRANSPORT_SFU', '2': 1},
    {'1': 'LIVE_TRANSPORT_UPLOAD', '2': 2},
  ],
};

/// Descriptor for `LiveTransport`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List liveTransportDescriptor = $convert.base64Decode(
    'Cg1MaXZlVHJhbnNwb3J0Eh4KGkxJVkVfVFJBTlNQT1JUX1VOU1BFQ0lGSUVEEAASFgoSTElWRV'
    '9UUkFOU1BPUlRfU0ZVEAESGQoVTElWRV9UUkFOU1BPUlRfVVBMT0FEEAI=');

@$core.Deprecated('Use createProjectRequestDescriptor instead')
const CreateProjectRequest$json = {
  '1': 'CreateProjectRequest',
  '2': [
    {
      '1': 'org_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.OrganizationId',
      '10': 'orgId'
    },
    {
      '1': 'data_residency',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.data.v1.DataResidency',
      '10': 'dataResidency'
    },
    {
      '1': 'storage_backend',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.data.v1.StorageBackend',
      '10': 'storageBackend'
    },
    {
      '1': 'props',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `CreateProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProjectRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQcm9qZWN0UmVxdWVzdBI6CgZvcmdfaWQYASABKAsyIy5waXhlbHRyYWNlLnR5cG'
    'VzLnYxLk9yZ2FuaXphdGlvbklkUgVvcmdJZBJICg5kYXRhX3Jlc2lkZW5jeRgCIAEoDjIhLnBp'
    'eGVsdHJhY2UuZGF0YS52MS5EYXRhUmVzaWRlbmN5Ug1kYXRhUmVzaWRlbmN5EksKD3N0b3JhZ2'
    'VfYmFja2VuZBgDIAEoDjIiLnBpeGVsdHJhY2UuZGF0YS52MS5TdG9yYWdlQmFja2VuZFIOc3Rv'
    'cmFnZUJhY2tlbmQSNgoFcHJvcHMYBCABKAsyIC5waXhlbHRyYWNlLm1nbXQudjEuUHJvamVjdF'
    'Byb3BzUgVwcm9wcw==');

@$core.Deprecated('Use createProjectResponseDescriptor instead')
const CreateProjectResponse$json = {
  '1': 'CreateProjectResponse',
  '2': [
    {
      '1': 'project',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Project',
      '10': 'project'
    },
  ],
};

/// Descriptor for `CreateProjectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProjectResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQcm9qZWN0UmVzcG9uc2USNQoHcHJvamVjdBgBIAEoCzIbLnBpeGVsdHJhY2UubW'
    'dtdC52MS5Qcm9qZWN0Ugdwcm9qZWN0');

@$core.Deprecated('Use getProjectRequestDescriptor instead')
const GetProjectRequest$json = {
  '1': 'GetProjectRequest',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'id'
    },
  ],
};

/// Descriptor for `GetProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProjectRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQcm9qZWN0UmVxdWVzdBIuCgJpZBgBIAEoCzIeLnBpeGVsdHJhY2UudHlwZXMudjEuUH'
    'JvamVjdElkUgJpZA==');

@$core.Deprecated('Use getProjectResponseDescriptor instead')
const GetProjectResponse$json = {
  '1': 'GetProjectResponse',
  '2': [
    {
      '1': 'project',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Project',
      '10': 'project'
    },
  ],
};

/// Descriptor for `GetProjectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProjectResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQcm9qZWN0UmVzcG9uc2USNQoHcHJvamVjdBgBIAEoCzIbLnBpeGVsdHJhY2UubWdtdC'
    '52MS5Qcm9qZWN0Ugdwcm9qZWN0');

@$core.Deprecated('Use updateProjectRequestDescriptor instead')
const UpdateProjectRequest$json = {
  '1': 'UpdateProjectRequest',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'id'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectProps',
      '10': 'props'
    },
    {
      '1': 'update_mask',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.FieldMask',
      '10': 'updateMask'
    },
  ],
};

/// Descriptor for `UpdateProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProjectRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQcm9qZWN0UmVxdWVzdBIuCgJpZBgBIAEoCzIeLnBpeGVsdHJhY2UudHlwZXMudj'
    'EuUHJvamVjdElkUgJpZBI2CgVwcm9wcxgCIAEoCzIgLnBpeGVsdHJhY2UubWdtdC52MS5Qcm9q'
    'ZWN0UHJvcHNSBXByb3BzEjsKC3VwZGF0ZV9tYXNrGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLk'
    'ZpZWxkTWFza1IKdXBkYXRlTWFzaw==');

@$core.Deprecated('Use updateProjectResponseDescriptor instead')
const UpdateProjectResponse$json = {
  '1': 'UpdateProjectResponse',
  '2': [
    {
      '1': 'project',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Project',
      '10': 'project'
    },
  ],
};

/// Descriptor for `UpdateProjectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProjectResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQcm9qZWN0UmVzcG9uc2USNQoHcHJvamVjdBgBIAEoCzIbLnBpeGVsdHJhY2UubW'
    'dtdC52MS5Qcm9qZWN0Ugdwcm9qZWN0');

@$core.Deprecated('Use deleteProjectRequestDescriptor instead')
const DeleteProjectRequest$json = {
  '1': 'DeleteProjectRequest',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'id'
    },
  ],
};

/// Descriptor for `DeleteProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProjectRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVQcm9qZWN0UmVxdWVzdBIuCgJpZBgBIAEoCzIeLnBpeGVsdHJhY2UudHlwZXMudj'
    'EuUHJvamVjdElkUgJpZA==');

@$core.Deprecated('Use deleteProjectResponseDescriptor instead')
const DeleteProjectResponse$json = {
  '1': 'DeleteProjectResponse',
};

/// Descriptor for `DeleteProjectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProjectResponseDescriptor =
    $convert.base64Decode('ChVEZWxldGVQcm9qZWN0UmVzcG9uc2U=');

@$core.Deprecated('Use createSiteKeyRequestDescriptor instead')
const CreateSiteKeyRequest$json = {
  '1': 'CreateSiteKeyRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectSiteKeyProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `CreateSiteKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSiteKeyRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVTaXRlS2V5UmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cmFjZS'
    '50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBI9CgVwcm9wcxgCIAEoCzInLnBpeGVsdHJh'
    'Y2UubWdtdC52MS5Qcm9qZWN0U2l0ZUtleVByb3BzUgVwcm9wcw==');

@$core.Deprecated('Use createSiteKeyResponseDescriptor instead')
const CreateSiteKeyResponse$json = {
  '1': 'CreateSiteKeyResponse',
  '2': [
    {
      '1': 'site_key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectSiteKey',
      '10': 'siteKey'
    },
  ],
};

/// Descriptor for `CreateSiteKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSiteKeyResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVTaXRlS2V5UmVzcG9uc2USPQoIc2l0ZV9rZXkYASABKAsyIi5waXhlbHRyYWNlLm'
    '1nbXQudjEuUHJvamVjdFNpdGVLZXlSB3NpdGVLZXk=');

@$core.Deprecated('Use getSiteKeyRequestDescriptor instead')
const GetSiteKeyRequest$json = {
  '1': 'GetSiteKeyRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'key',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'key'
    },
  ],
};

/// Descriptor for `GetSiteKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSiteKeyRequestDescriptor = $convert.base64Decode(
    'ChFHZXRTaXRlS2V5UmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cmFjZS50eX'
    'Blcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIuCgNrZXkYAiABKAsyHC5waXhlbHRyYWNlLnR5'
    'cGVzLnYxLlNpdGVLZXlSA2tleQ==');

@$core.Deprecated('Use getSiteKeyResponseDescriptor instead')
const GetSiteKeyResponse$json = {
  '1': 'GetSiteKeyResponse',
  '2': [
    {
      '1': 'site_key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectSiteKey',
      '10': 'siteKey'
    },
  ],
};

/// Descriptor for `GetSiteKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSiteKeyResponseDescriptor = $convert.base64Decode(
    'ChJHZXRTaXRlS2V5UmVzcG9uc2USPQoIc2l0ZV9rZXkYASABKAsyIi5waXhlbHRyYWNlLm1nbX'
    'QudjEuUHJvamVjdFNpdGVLZXlSB3NpdGVLZXk=');

@$core.Deprecated('Use listSiteKeysRequestDescriptor instead')
const ListSiteKeysRequest$json = {
  '1': 'ListSiteKeysRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.PageRequest',
      '10': 'page'
    },
  ],
};

/// Descriptor for `ListSiteKeysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSiteKeysRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0U2l0ZUtleXNSZXF1ZXN0Ej0KCnByb2plY3RfaWQYASABKAsyHi5waXhlbHRyYWNlLn'
    'R5cGVzLnYxLlByb2plY3RJZFIJcHJvamVjdElkEjMKBHBhZ2UYAiABKAsyHy5waXhlbHRyYWNl'
    'Lm1nbXQudjEuUGFnZVJlcXVlc3RSBHBhZ2U=');

@$core.Deprecated('Use listSiteKeysResponseDescriptor instead')
const ListSiteKeysResponse$json = {
  '1': 'ListSiteKeysResponse',
  '2': [
    {
      '1': 'site_keys',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectSiteKey',
      '10': 'siteKeys'
    },
    {
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.PageResponse',
      '10': 'page'
    },
  ],
};

/// Descriptor for `ListSiteKeysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSiteKeysResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0U2l0ZUtleXNSZXNwb25zZRI/CglzaXRlX2tleXMYASADKAsyIi5waXhlbHRyYWNlLm'
    '1nbXQudjEuUHJvamVjdFNpdGVLZXlSCHNpdGVLZXlzEjQKBHBhZ2UYAiABKAsyIC5waXhlbHRy'
    'YWNlLm1nbXQudjEuUGFnZVJlc3BvbnNlUgRwYWdl');

@$core.Deprecated('Use updateSiteKeyRequestDescriptor instead')
const UpdateSiteKeyRequest$json = {
  '1': 'UpdateSiteKeyRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'key',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'key'
    },
    {
      '1': 'props',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectSiteKeyProps',
      '10': 'props'
    },
    {
      '1': 'update_mask',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.FieldMask',
      '10': 'updateMask'
    },
  ],
};

/// Descriptor for `UpdateSiteKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSiteKeyRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVTaXRlS2V5UmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cmFjZS'
    '50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIuCgNrZXkYAiABKAsyHC5waXhlbHRyYWNl'
    'LnR5cGVzLnYxLlNpdGVLZXlSA2tleRI9CgVwcm9wcxgDIAEoCzInLnBpeGVsdHJhY2UubWdtdC'
    '52MS5Qcm9qZWN0U2l0ZUtleVByb3BzUgVwcm9wcxI7Cgt1cGRhdGVfbWFzaxgEIAEoCzIaLmdv'
    'b2dsZS5wcm90b2J1Zi5GaWVsZE1hc2tSCnVwZGF0ZU1hc2s=');

@$core.Deprecated('Use updateSiteKeyResponseDescriptor instead')
const UpdateSiteKeyResponse$json = {
  '1': 'UpdateSiteKeyResponse',
  '2': [
    {
      '1': 'site_key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectSiteKey',
      '10': 'siteKey'
    },
  ],
};

/// Descriptor for `UpdateSiteKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSiteKeyResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVTaXRlS2V5UmVzcG9uc2USPQoIc2l0ZV9rZXkYASABKAsyIi5waXhlbHRyYWNlLm'
    '1nbXQudjEuUHJvamVjdFNpdGVLZXlSB3NpdGVLZXk=');

@$core.Deprecated('Use revokeSiteKeyRequestDescriptor instead')
const RevokeSiteKeyRequest$json = {
  '1': 'RevokeSiteKeyRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'key',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'key'
    },
  ],
};

/// Descriptor for `RevokeSiteKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revokeSiteKeyRequestDescriptor = $convert.base64Decode(
    'ChRSZXZva2VTaXRlS2V5UmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cmFjZS'
    '50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIuCgNrZXkYAiABKAsyHC5waXhlbHRyYWNl'
    'LnR5cGVzLnYxLlNpdGVLZXlSA2tleQ==');

@$core.Deprecated('Use revokeSiteKeyResponseDescriptor instead')
const RevokeSiteKeyResponse$json = {
  '1': 'RevokeSiteKeyResponse',
};

/// Descriptor for `RevokeSiteKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revokeSiteKeyResponseDescriptor =
    $convert.base64Decode('ChVSZXZva2VTaXRlS2V5UmVzcG9uc2U=');

@$core.Deprecated('Use createProjectTagRequestDescriptor instead')
const CreateProjectTagRequest$json = {
  '1': 'CreateProjectTagRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectTagProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `CreateProjectTagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProjectTagRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVQcm9qZWN0VGFnUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cm'
    'FjZS50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBI5CgVwcm9wcxgCIAEoCzIjLnBpeGVs'
    'dHJhY2UubWdtdC52MS5Qcm9qZWN0VGFnUHJvcHNSBXByb3Bz');

@$core.Deprecated('Use createProjectTagResponseDescriptor instead')
const CreateProjectTagResponse$json = {
  '1': 'CreateProjectTagResponse',
  '2': [
    {
      '1': 'tag',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectTag',
      '10': 'tag'
    },
  ],
};

/// Descriptor for `CreateProjectTagResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProjectTagResponseDescriptor =
    $convert.base64Decode(
        'ChhDcmVhdGVQcm9qZWN0VGFnUmVzcG9uc2USMAoDdGFnGAEgASgLMh4ucGl4ZWx0cmFjZS5tZ2'
        '10LnYxLlByb2plY3RUYWdSA3RhZw==');

@$core.Deprecated('Use listProjectTagsRequestDescriptor instead')
const ListProjectTagsRequest$json = {
  '1': 'ListProjectTagsRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'include_session_counts',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'includeSessionCounts'
    },
  ],
};

/// Descriptor for `ListProjectTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectTagsRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0UHJvamVjdFRhZ3NSZXF1ZXN0Ej0KCnByb2plY3RfaWQYASABKAsyHi5waXhlbHRyYW'
    'NlLnR5cGVzLnYxLlByb2plY3RJZFIJcHJvamVjdElkEjQKFmluY2x1ZGVfc2Vzc2lvbl9jb3Vu'
    'dHMYAiABKAhSFGluY2x1ZGVTZXNzaW9uQ291bnRz');

@$core.Deprecated('Use listProjectTagsResponseDescriptor instead')
const ListProjectTagsResponse$json = {
  '1': 'ListProjectTagsResponse',
  '2': [
    {
      '1': 'tags',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectTag',
      '10': 'tags'
    },
    {
      '1': 'session_counts',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ListProjectTagsResponse.SessionCountsEntry',
      '10': 'sessionCounts'
    },
  ],
  '3': [ListProjectTagsResponse_SessionCountsEntry$json],
};

@$core.Deprecated('Use listProjectTagsResponseDescriptor instead')
const ListProjectTagsResponse_SessionCountsEntry$json = {
  '1': 'SessionCountsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 13, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ListProjectTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectTagsResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0UHJvamVjdFRhZ3NSZXNwb25zZRIyCgR0YWdzGAEgAygLMh4ucGl4ZWx0cmFjZS5tZ2'
    '10LnYxLlByb2plY3RUYWdSBHRhZ3MSZQoOc2Vzc2lvbl9jb3VudHMYAiADKAsyPi5waXhlbHRy'
    'YWNlLm1nbXQudjEuTGlzdFByb2plY3RUYWdzUmVzcG9uc2UuU2Vzc2lvbkNvdW50c0VudHJ5Ug'
    '1zZXNzaW9uQ291bnRzGkAKElNlc3Npb25Db3VudHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIU'
    'CgV2YWx1ZRgCIAEoDVIFdmFsdWU6AjgB');

@$core.Deprecated('Use updateProjectTagRequestDescriptor instead')
const UpdateProjectTagRequest$json = {
  '1': 'UpdateProjectTagRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectTagId',
      '10': 'id'
    },
    {
      '1': 'props',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectTagProps',
      '10': 'props'
    },
    {
      '1': 'update_mask',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.FieldMask',
      '10': 'updateMask'
    },
  ],
};

/// Descriptor for `UpdateProjectTagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProjectTagRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVQcm9qZWN0VGFnUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cm'
    'FjZS50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIxCgJpZBgCIAEoCzIhLnBpeGVsdHJh'
    'Y2UudHlwZXMudjEuUHJvamVjdFRhZ0lkUgJpZBI5CgVwcm9wcxgDIAEoCzIjLnBpeGVsdHJhY2'
    'UubWdtdC52MS5Qcm9qZWN0VGFnUHJvcHNSBXByb3BzEjsKC3VwZGF0ZV9tYXNrGAQgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLkZpZWxkTWFza1IKdXBkYXRlTWFzaw==');

@$core.Deprecated('Use updateProjectTagResponseDescriptor instead')
const UpdateProjectTagResponse$json = {
  '1': 'UpdateProjectTagResponse',
  '2': [
    {
      '1': 'tag',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectTag',
      '10': 'tag'
    },
  ],
};

/// Descriptor for `UpdateProjectTagResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProjectTagResponseDescriptor =
    $convert.base64Decode(
        'ChhVcGRhdGVQcm9qZWN0VGFnUmVzcG9uc2USMAoDdGFnGAEgASgLMh4ucGl4ZWx0cmFjZS5tZ2'
        '10LnYxLlByb2plY3RUYWdSA3RhZw==');

@$core.Deprecated('Use deleteProjectTagRequestDescriptor instead')
const DeleteProjectTagRequest$json = {
  '1': 'DeleteProjectTagRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectTagId',
      '10': 'id'
    },
  ],
};

/// Descriptor for `DeleteProjectTagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProjectTagRequestDescriptor = $convert.base64Decode(
    'ChdEZWxldGVQcm9qZWN0VGFnUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cm'
    'FjZS50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIxCgJpZBgCIAEoCzIhLnBpeGVsdHJh'
    'Y2UudHlwZXMudjEuUHJvamVjdFRhZ0lkUgJpZA==');

@$core.Deprecated('Use deleteProjectTagResponseDescriptor instead')
const DeleteProjectTagResponse$json = {
  '1': 'DeleteProjectTagResponse',
  '2': [
    {
      '1': 'sessions_untagged',
      '3': 1,
      '4': 1,
      '5': 13,
      '10': 'sessionsUntagged'
    },
  ],
};

/// Descriptor for `DeleteProjectTagResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProjectTagResponseDescriptor =
    $convert.base64Decode(
        'ChhEZWxldGVQcm9qZWN0VGFnUmVzcG9uc2USKwoRc2Vzc2lvbnNfdW50YWdnZWQYASABKA1SEH'
        'Nlc3Npb25zVW50YWdnZWQ=');

@$core.Deprecated('Use projectDescriptor instead')
const Project$json = {
  '1': 'Project',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'id'
    },
    {
      '1': 'org_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.OrganizationId',
      '10': 'orgId'
    },
    {
      '1': 'data_residency',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.data.v1.DataResidency',
      '10': 'dataResidency'
    },
    {
      '1': 'storage_backend',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.data.v1.StorageBackend',
      '10': 'storageBackend'
    },
    {
      '1': 'props',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `Project`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectDescriptor = $convert.base64Decode(
    'CgdQcm9qZWN0Ei4KAmlkGAEgASgLMh4ucGl4ZWx0cmFjZS50eXBlcy52MS5Qcm9qZWN0SWRSAm'
    'lkEjoKBm9yZ19pZBgCIAEoCzIjLnBpeGVsdHJhY2UudHlwZXMudjEuT3JnYW5pemF0aW9uSWRS'
    'BW9yZ0lkEkgKDmRhdGFfcmVzaWRlbmN5GAMgASgOMiEucGl4ZWx0cmFjZS5kYXRhLnYxLkRhdG'
    'FSZXNpZGVuY3lSDWRhdGFSZXNpZGVuY3kSSwoPc3RvcmFnZV9iYWNrZW5kGAQgASgOMiIucGl4'
    'ZWx0cmFjZS5kYXRhLnYxLlN0b3JhZ2VCYWNrZW5kUg5zdG9yYWdlQmFja2VuZBI2CgVwcm9wcx'
    'gFIAEoCzIgLnBpeGVsdHJhY2UubWdtdC52MS5Qcm9qZWN0UHJvcHNSBXByb3Bz');

@$core.Deprecated('Use projectPropsDescriptor instead')
const ProjectProps$json = {
  '1': 'ProjectProps',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'recording_disabled',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'recordingDisabled'
    },
    {
      '1': 'discard_under_seconds',
      '3': 3,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'discardUnderSeconds',
      '17': true
    },
    {
      '1': 'idle_timeout_seconds',
      '3': 4,
      '4': 1,
      '5': 13,
      '9': 1,
      '10': 'idleTimeoutSeconds',
      '17': true
    },
    {
      '1': 'retention_days',
      '3': 5,
      '4': 1,
      '5': 13,
      '9': 2,
      '10': 'retentionDays',
      '17': true
    },
  ],
  '8': [
    {'1': '_discard_under_seconds'},
    {'1': '_idle_timeout_seconds'},
    {'1': '_retention_days'},
  ],
};

/// Descriptor for `ProjectProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectPropsDescriptor = $convert.base64Decode(
    'CgxQcm9qZWN0UHJvcHMSEgoEbmFtZRgBIAEoCVIEbmFtZRItChJyZWNvcmRpbmdfZGlzYWJsZW'
    'QYAiABKAhSEXJlY29yZGluZ0Rpc2FibGVkEjcKFWRpc2NhcmRfdW5kZXJfc2Vjb25kcxgDIAEo'
    'DUgAUhNkaXNjYXJkVW5kZXJTZWNvbmRziAEBEjUKFGlkbGVfdGltZW91dF9zZWNvbmRzGAQgAS'
    'gNSAFSEmlkbGVUaW1lb3V0U2Vjb25kc4gBARIqCg5yZXRlbnRpb25fZGF5cxgFIAEoDUgCUg1y'
    'ZXRlbnRpb25EYXlziAEBQhgKFl9kaXNjYXJkX3VuZGVyX3NlY29uZHNCFwoVX2lkbGVfdGltZW'
    '91dF9zZWNvbmRzQhEKD19yZXRlbnRpb25fZGF5cw==');

@$core.Deprecated('Use projectSiteKeyDescriptor instead')
const ProjectSiteKey$json = {
  '1': 'ProjectSiteKey',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'key'
    },
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.mgmt.v1.ProjectSiteKey.Status',
      '10': 'status'
    },
    {
      '1': 'created_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'revoked_at',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'revokedAt'
    },
    {
      '1': 'props',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectSiteKeyProps',
      '10': 'props'
    },
  ],
  '4': [ProjectSiteKey_Status$json],
};

@$core.Deprecated('Use projectSiteKeyDescriptor instead')
const ProjectSiteKey_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'ACTIVE', '2': 1},
    {'1': 'REVOKED', '2': 2},
  ],
};

/// Descriptor for `ProjectSiteKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectSiteKeyDescriptor = $convert.base64Decode(
    'Cg5Qcm9qZWN0U2l0ZUtleRIuCgNrZXkYASABKAsyHC5waXhlbHRyYWNlLnR5cGVzLnYxLlNpdG'
    'VLZXlSA2tleRJBCgZzdGF0dXMYAiABKA4yKS5waXhlbHRyYWNlLm1nbXQudjEuUHJvamVjdFNp'
    'dGVLZXkuU3RhdHVzUgZzdGF0dXMSOQoKY3JlYXRlZF9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5CgpyZXZva2VkX2F0GAQgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcFIJcmV2b2tlZEF0Ej0KBXByb3BzGAUgASgLMicucGl4ZWx0cmFjZS'
    '5tZ210LnYxLlByb2plY3RTaXRlS2V5UHJvcHNSBXByb3BzIjIKBlN0YXR1cxIPCgtVTlNQRUNJ'
    'RklFRBAAEgoKBkFDVElWRRABEgsKB1JFVk9LRUQQAg==');

@$core.Deprecated('Use projectSiteKeyPropsDescriptor instead')
const ProjectSiteKeyProps$json = {
  '1': 'ProjectSiteKeyProps',
  '2': [
    {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
  ],
};

/// Descriptor for `ProjectSiteKeyProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectSiteKeyPropsDescriptor =
    $convert.base64Decode(
        'ChNQcm9qZWN0U2l0ZUtleVByb3BzEhQKBWxhYmVsGAEgASgJUgVsYWJlbA==');

@$core.Deprecated('Use projectTagDescriptor instead')
const ProjectTag$json = {
  '1': 'ProjectTag',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectTagId',
      '10': 'id'
    },
    {
      '1': 'project_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'created_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'props',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectTagProps',
      '10': 'props'
    },
    {
      '1': 'kind',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.mgmt.v1.ProjectTagKind',
      '10': 'kind'
    },
  ],
};

/// Descriptor for `ProjectTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectTagDescriptor = $convert.base64Decode(
    'CgpQcm9qZWN0VGFnEjEKAmlkGAEgASgLMiEucGl4ZWx0cmFjZS50eXBlcy52MS5Qcm9qZWN0VG'
    'FnSWRSAmlkEj0KCnByb2plY3RfaWQYAiABKAsyHi5waXhlbHRyYWNlLnR5cGVzLnYxLlByb2pl'
    'Y3RJZFIJcHJvamVjdElkEjkKCmNyZWF0ZWRfYXQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wUgljcmVhdGVkQXQSOQoFcHJvcHMYBCABKAsyIy5waXhlbHRyYWNlLm1nbXQudjEu'
    'UHJvamVjdFRhZ1Byb3BzUgVwcm9wcxI2CgRraW5kGAUgASgOMiIucGl4ZWx0cmFjZS5tZ210Ln'
    'YxLlByb2plY3RUYWdLaW5kUgRraW5k');

@$core.Deprecated('Use projectTagPropsDescriptor instead')
const ProjectTagProps$json = {
  '1': 'ProjectTagProps',
  '2': [
    {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
    {
      '1': 'color',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.mgmt.v1.ProjectTagColor',
      '10': 'color'
    },
    {
      '1': 'custom_hex',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'customHex',
      '17': true
    },
  ],
  '8': [
    {'1': '_custom_hex'},
  ],
};

/// Descriptor for `ProjectTagProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectTagPropsDescriptor = $convert.base64Decode(
    'Cg9Qcm9qZWN0VGFnUHJvcHMSFAoFbGFiZWwYASABKAlSBWxhYmVsEjkKBWNvbG9yGAIgASgOMi'
    'MucGl4ZWx0cmFjZS5tZ210LnYxLlByb2plY3RUYWdDb2xvclIFY29sb3ISIgoKY3VzdG9tX2hl'
    'eBgDIAEoCUgAUgljdXN0b21IZXiIAQFCDQoLX2N1c3RvbV9oZXg=');

@$core.Deprecated('Use projectMemberKeyDescriptor instead')
const ProjectMemberKey$json = {
  '1': 'ProjectMemberKey',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'user_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.UserId',
      '10': 'userId'
    },
  ],
};

/// Descriptor for `ProjectMemberKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectMemberKeyDescriptor = $convert.base64Decode(
    'ChBQcm9qZWN0TWVtYmVyS2V5Ej0KCnByb2plY3RfaWQYASABKAsyHi5waXhlbHRyYWNlLnR5cG'
    'VzLnYxLlByb2plY3RJZFIJcHJvamVjdElkEjQKB3VzZXJfaWQYAiABKAsyGy5waXhlbHRyYWNl'
    'LnR5cGVzLnYxLlVzZXJJZFIGdXNlcklk');

@$core.Deprecated('Use projectMemberDescriptor instead')
const ProjectMember$json = {
  '1': 'ProjectMember',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMemberKey',
      '10': 'key'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMemberProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `ProjectMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectMemberDescriptor = $convert.base64Decode(
    'Cg1Qcm9qZWN0TWVtYmVyEjYKA2tleRgBIAEoCzIkLnBpeGVsdHJhY2UubWdtdC52MS5Qcm9qZW'
    'N0TWVtYmVyS2V5UgNrZXkSPAoFcHJvcHMYAiABKAsyJi5waXhlbHRyYWNlLm1nbXQudjEuUHJv'
    'amVjdE1lbWJlclByb3BzUgVwcm9wcw==');

@$core.Deprecated('Use projectMemberPropsDescriptor instead')
const ProjectMemberProps$json = {
  '1': 'ProjectMemberProps',
  '2': [
    {
      '1': 'role',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.mgmt.v1.Role',
      '10': 'role'
    },
  ],
};

/// Descriptor for `ProjectMemberProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectMemberPropsDescriptor = $convert.base64Decode(
    'ChJQcm9qZWN0TWVtYmVyUHJvcHMSLAoEcm9sZRgBIAEoDjIYLnBpeGVsdHJhY2UubWdtdC52MS'
    '5Sb2xlUgRyb2xl');

@$core.Deprecated('Use assignProjectMemberRequestDescriptor instead')
const AssignProjectMemberRequest$json = {
  '1': 'AssignProjectMemberRequest',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMemberKey',
      '10': 'key'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMemberProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `AssignProjectMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignProjectMemberRequestDescriptor =
    $convert.base64Decode(
        'ChpBc3NpZ25Qcm9qZWN0TWVtYmVyUmVxdWVzdBI2CgNrZXkYASABKAsyJC5waXhlbHRyYWNlLm'
        '1nbXQudjEuUHJvamVjdE1lbWJlcktleVIDa2V5EjwKBXByb3BzGAIgASgLMiYucGl4ZWx0cmFj'
        'ZS5tZ210LnYxLlByb2plY3RNZW1iZXJQcm9wc1IFcHJvcHM=');

@$core.Deprecated('Use assignProjectMemberResponseDescriptor instead')
const AssignProjectMemberResponse$json = {
  '1': 'AssignProjectMemberResponse',
  '2': [
    {
      '1': 'member',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMember',
      '10': 'member'
    },
  ],
};

/// Descriptor for `AssignProjectMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignProjectMemberResponseDescriptor =
    $convert.base64Decode(
        'ChtBc3NpZ25Qcm9qZWN0TWVtYmVyUmVzcG9uc2USOQoGbWVtYmVyGAEgASgLMiEucGl4ZWx0cm'
        'FjZS5tZ210LnYxLlByb2plY3RNZW1iZXJSBm1lbWJlcg==');

@$core.Deprecated('Use getProjectMemberRequestDescriptor instead')
const GetProjectMemberRequest$json = {
  '1': 'GetProjectMemberRequest',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMemberKey',
      '10': 'key'
    },
  ],
};

/// Descriptor for `GetProjectMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProjectMemberRequestDescriptor =
    $convert.base64Decode(
        'ChdHZXRQcm9qZWN0TWVtYmVyUmVxdWVzdBI2CgNrZXkYASABKAsyJC5waXhlbHRyYWNlLm1nbX'
        'QudjEuUHJvamVjdE1lbWJlcktleVIDa2V5');

@$core.Deprecated('Use getProjectMemberResponseDescriptor instead')
const GetProjectMemberResponse$json = {
  '1': 'GetProjectMemberResponse',
  '2': [
    {
      '1': 'member',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMember',
      '10': 'member'
    },
  ],
};

/// Descriptor for `GetProjectMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProjectMemberResponseDescriptor =
    $convert.base64Decode(
        'ChhHZXRQcm9qZWN0TWVtYmVyUmVzcG9uc2USOQoGbWVtYmVyGAEgASgLMiEucGl4ZWx0cmFjZS'
        '5tZ210LnYxLlByb2plY3RNZW1iZXJSBm1lbWJlcg==');

@$core.Deprecated('Use updateProjectMemberRequestDescriptor instead')
const UpdateProjectMemberRequest$json = {
  '1': 'UpdateProjectMemberRequest',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMemberKey',
      '10': 'key'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMemberProps',
      '10': 'props'
    },
    {
      '1': 'update_mask',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.FieldMask',
      '10': 'updateMask'
    },
  ],
};

/// Descriptor for `UpdateProjectMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProjectMemberRequestDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVQcm9qZWN0TWVtYmVyUmVxdWVzdBI2CgNrZXkYASABKAsyJC5waXhlbHRyYWNlLm'
    '1nbXQudjEuUHJvamVjdE1lbWJlcktleVIDa2V5EjwKBXByb3BzGAIgASgLMiYucGl4ZWx0cmFj'
    'ZS5tZ210LnYxLlByb2plY3RNZW1iZXJQcm9wc1IFcHJvcHMSOwoLdXBkYXRlX21hc2sYAyABKA'
    'syGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUgp1cGRhdGVNYXNr');

@$core.Deprecated('Use updateProjectMemberResponseDescriptor instead')
const UpdateProjectMemberResponse$json = {
  '1': 'UpdateProjectMemberResponse',
  '2': [
    {
      '1': 'member',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMember',
      '10': 'member'
    },
  ],
};

/// Descriptor for `UpdateProjectMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProjectMemberResponseDescriptor =
    $convert.base64Decode(
        'ChtVcGRhdGVQcm9qZWN0TWVtYmVyUmVzcG9uc2USOQoGbWVtYmVyGAEgASgLMiEucGl4ZWx0cm'
        'FjZS5tZ210LnYxLlByb2plY3RNZW1iZXJSBm1lbWJlcg==');

@$core.Deprecated('Use removeProjectMemberRequestDescriptor instead')
const RemoveProjectMemberRequest$json = {
  '1': 'RemoveProjectMemberRequest',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMemberKey',
      '10': 'key'
    },
  ],
};

/// Descriptor for `RemoveProjectMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeProjectMemberRequestDescriptor =
    $convert.base64Decode(
        'ChpSZW1vdmVQcm9qZWN0TWVtYmVyUmVxdWVzdBI2CgNrZXkYASABKAsyJC5waXhlbHRyYWNlLm'
        '1nbXQudjEuUHJvamVjdE1lbWJlcktleVIDa2V5');

@$core.Deprecated('Use removeProjectMemberResponseDescriptor instead')
const RemoveProjectMemberResponse$json = {
  '1': 'RemoveProjectMemberResponse',
};

/// Descriptor for `RemoveProjectMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeProjectMemberResponseDescriptor =
    $convert.base64Decode('ChtSZW1vdmVQcm9qZWN0TWVtYmVyUmVzcG9uc2U=');

@$core.Deprecated('Use listProjectMembersRequestDescriptor instead')
const ListProjectMembersRequest$json = {
  '1': 'ListProjectMembersRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.PageRequest',
      '10': 'page'
    },
  ],
};

/// Descriptor for `ListProjectMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectMembersRequestDescriptor = $convert.base64Decode(
    'ChlMaXN0UHJvamVjdE1lbWJlcnNSZXF1ZXN0Ej0KCnByb2plY3RfaWQYASABKAsyHi5waXhlbH'
    'RyYWNlLnR5cGVzLnYxLlByb2plY3RJZFIJcHJvamVjdElkEjMKBHBhZ2UYAiABKAsyHy5waXhl'
    'bHRyYWNlLm1nbXQudjEuUGFnZVJlcXVlc3RSBHBhZ2U=');

@$core.Deprecated('Use listProjectMembersResponseDescriptor instead')
const ListProjectMembersResponse$json = {
  '1': 'ListProjectMembersResponse',
  '2': [
    {
      '1': 'members',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.ProjectMember',
      '10': 'members'
    },
    {
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.PageResponse',
      '10': 'page'
    },
  ],
};

/// Descriptor for `ListProjectMembersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectMembersResponseDescriptor =
    $convert.base64Decode(
        'ChpMaXN0UHJvamVjdE1lbWJlcnNSZXNwb25zZRI7CgdtZW1iZXJzGAEgAygLMiEucGl4ZWx0cm'
        'FjZS5tZ210LnYxLlByb2plY3RNZW1iZXJSB21lbWJlcnMSNAoEcGFnZRgCIAEoCzIgLnBpeGVs'
        'dHJhY2UubWdtdC52MS5QYWdlUmVzcG9uc2VSBHBhZ2U=');

@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = {
  '1': 'Session',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'id'
    },
    {
      '1': 'project_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'site_key',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'siteKey'
    },
    {
      '1': 'status',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.mgmt.v1.Session.Status',
      '10': 'status'
    },
    {
      '1': 'props',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.SessionProps',
      '10': 'props'
    },
    {
      '1': 'publisher_info',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionPublisherInfo',
      '10': 'publisherInfo'
    },
    {
      '1': 'attributes',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.SessionAttributes',
      '10': 'attributes'
    },
    {'1': 'seen', '3': 8, '4': 1, '5': 8, '10': 'seen'},
    {
      '1': 'live_transport',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.mgmt.v1.LiveTransport',
      '10': 'liveTransport'
    },
  ],
  '4': [Session_Status$json],
};

@$core.Deprecated('Use sessionDescriptor instead')
const Session_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'RECORDING', '2': 1},
    {'1': 'READY', '2': 2},
  ],
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode(
    'CgdTZXNzaW9uEi4KAmlkGAEgASgLMh4ucGl4ZWx0cmFjZS50eXBlcy52MS5TZXNzaW9uSWRSAm'
    'lkEj0KCnByb2plY3RfaWQYAiABKAsyHi5waXhlbHRyYWNlLnR5cGVzLnYxLlByb2plY3RJZFIJ'
    'cHJvamVjdElkEjcKCHNpdGVfa2V5GAMgASgLMhwucGl4ZWx0cmFjZS50eXBlcy52MS5TaXRlS2'
    'V5UgdzaXRlS2V5EjoKBnN0YXR1cxgEIAEoDjIiLnBpeGVsdHJhY2UubWdtdC52MS5TZXNzaW9u'
    'LlN0YXR1c1IGc3RhdHVzEjYKBXByb3BzGAUgASgLMiAucGl4ZWx0cmFjZS5tZ210LnYxLlNlc3'
    'Npb25Qcm9wc1IFcHJvcHMSUAoOcHVibGlzaGVyX2luZm8YBiABKAsyKS5waXhlbHRyYWNlLnR5'
    'cGVzLnYxLlNlc3Npb25QdWJsaXNoZXJJbmZvUg1wdWJsaXNoZXJJbmZvEkUKCmF0dHJpYnV0ZX'
    'MYByABKAsyJS5waXhlbHRyYWNlLm1nbXQudjEuU2Vzc2lvbkF0dHJpYnV0ZXNSCmF0dHJpYnV0'
    'ZXMSEgoEc2VlbhgIIAEoCFIEc2VlbhJICg5saXZlX3RyYW5zcG9ydBgJIAEoDjIhLnBpeGVsdH'
    'JhY2UubWdtdC52MS5MaXZlVHJhbnNwb3J0Ug1saXZlVHJhbnNwb3J0IjMKBlN0YXR1cxIPCgtV'
    'TlNQRUNJRklFRBAAEg0KCVJFQ09SRElORxABEgkKBVJFQURZEAI=');

@$core.Deprecated('Use sessionPropsDescriptor instead')
const SessionProps$json = {
  '1': 'SessionProps',
  '2': [
    {
      '1': 'tag_ids',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectTagId',
      '10': 'tagIds'
    },
  ],
};

/// Descriptor for `SessionProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionPropsDescriptor = $convert.base64Decode(
    'CgxTZXNzaW9uUHJvcHMSOgoHdGFnX2lkcxgBIAMoCzIhLnBpeGVsdHJhY2UudHlwZXMudjEuUH'
    'JvamVjdFRhZ0lkUgZ0YWdJZHM=');

@$core.Deprecated('Use sessionTagUpdateDescriptor instead')
const SessionTagUpdate$json = {
  '1': 'SessionTagUpdate',
  '2': [
    {
      '1': 'add',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectTagId',
      '10': 'add'
    },
    {
      '1': 'remove',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectTagId',
      '10': 'remove'
    },
  ],
};

/// Descriptor for `SessionTagUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionTagUpdateDescriptor = $convert.base64Decode(
    'ChBTZXNzaW9uVGFnVXBkYXRlEjMKA2FkZBgBIAMoCzIhLnBpeGVsdHJhY2UudHlwZXMudjEuUH'
    'JvamVjdFRhZ0lkUgNhZGQSOQoGcmVtb3ZlGAIgAygLMiEucGl4ZWx0cmFjZS50eXBlcy52MS5Q'
    'cm9qZWN0VGFnSWRSBnJlbW92ZQ==');

@$core.Deprecated('Use sessionAttributesDescriptor instead')
const SessionAttributes$json = {
  '1': 'SessionAttributes',
  '2': [
    {
      '1': 'started_at',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startedAt'
    },
    {
      '1': 'ended_at',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endedAt'
    },
    {
      '1': 'duration',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '10': 'duration'
    },
    {'1': 'size_bytes', '3': 4, '4': 1, '5': 4, '10': 'sizeBytes'},
    {'1': 'country', '3': 5, '4': 1, '5': 9, '10': 'country'},
    {'1': 'browser', '3': 6, '4': 1, '5': 9, '10': 'browser'},
    {'1': 'os', '3': 7, '4': 1, '5': 9, '10': 'os'},
    {'1': 'device_type', '3': 8, '4': 1, '5': 9, '10': 'deviceType'},
    {'1': 'user_agent', '3': 9, '4': 1, '5': 9, '10': 'userAgent'},
    {
      '1': 'client_tcp_rtt_ms',
      '3': 10,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'clientTcpRttMs',
      '17': true
    },
    {
      '1': 'deleted_at',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'deletedAt',
      '17': true
    },
    {
      '1': 'activity',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Sparkline',
      '10': 'activity'
    },
  ],
  '8': [
    {'1': '_client_tcp_rtt_ms'},
    {'1': '_deleted_at'},
  ],
};

/// Descriptor for `SessionAttributes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionAttributesDescriptor = $convert.base64Decode(
    'ChFTZXNzaW9uQXR0cmlidXRlcxI5CgpzdGFydGVkX2F0GAEgASgLMhouZ29vZ2xlLnByb3RvYn'
    'VmLlRpbWVzdGFtcFIJc3RhcnRlZEF0EjUKCGVuZGVkX2F0GAIgASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFIHZW5kZWRBdBI1CghkdXJhdGlvbhgDIAEoCzIZLmdvb2dsZS5wcm90b2'
    'J1Zi5EdXJhdGlvblIIZHVyYXRpb24SHQoKc2l6ZV9ieXRlcxgEIAEoBFIJc2l6ZUJ5dGVzEhgK'
    'B2NvdW50cnkYBSABKAlSB2NvdW50cnkSGAoHYnJvd3NlchgGIAEoCVIHYnJvd3NlchIOCgJvcx'
    'gHIAEoCVICb3MSHwoLZGV2aWNlX3R5cGUYCCABKAlSCmRldmljZVR5cGUSHQoKdXNlcl9hZ2Vu'
    'dBgJIAEoCVIJdXNlckFnZW50Ei4KEWNsaWVudF90Y3BfcnR0X21zGAogASgNSABSDmNsaWVudF'
    'RjcFJ0dE1ziAEBEj4KCmRlbGV0ZWRfYXQYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
    'YW1wSAFSCWRlbGV0ZWRBdIgBARI5CghhY3Rpdml0eRgMIAEoCzIdLnBpeGVsdHJhY2UubWdtdC'
    '52MS5TcGFya2xpbmVSCGFjdGl2aXR5QhQKEl9jbGllbnRfdGNwX3J0dF9tc0INCgtfZGVsZXRl'
    'ZF9hdA==');

@$core.Deprecated('Use sparklineDescriptor instead')
const Sparkline$json = {
  '1': 'Sparkline',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 12, '10': 'points'},
  ],
};

/// Descriptor for `Sparkline`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sparklineDescriptor =
    $convert.base64Decode('CglTcGFya2xpbmUSFgoGcG9pbnRzGAEgASgMUgZwb2ludHM=');

@$core.Deprecated('Use listSessionsRequestDescriptor instead')
const ListSessionsRequest$json = {
  '1': 'ListSessionsRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.PageRequest',
      '10': 'page'
    },
    {'1': 'unseen_only', '3': 3, '4': 1, '5': 8, '10': 'unseenOnly'},
    {
      '1': 'tag_ids',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectTagId',
      '10': 'tagIds'
    },
  ],
};

/// Descriptor for `ListSessionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSessionsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0U2Vzc2lvbnNSZXF1ZXN0Ej0KCnByb2plY3RfaWQYASABKAsyHi5waXhlbHRyYWNlLn'
    'R5cGVzLnYxLlByb2plY3RJZFIJcHJvamVjdElkEjMKBHBhZ2UYAiABKAsyHy5waXhlbHRyYWNl'
    'Lm1nbXQudjEuUGFnZVJlcXVlc3RSBHBhZ2USHwoLdW5zZWVuX29ubHkYAyABKAhSCnVuc2Vlbk'
    '9ubHkSOgoHdGFnX2lkcxgEIAMoCzIhLnBpeGVsdHJhY2UudHlwZXMudjEuUHJvamVjdFRhZ0lk'
    'UgZ0YWdJZHM=');

@$core.Deprecated('Use listSessionsResponseDescriptor instead')
const ListSessionsResponse$json = {
  '1': 'ListSessionsResponse',
  '2': [
    {
      '1': 'sessions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Session',
      '10': 'sessions'
    },
    {
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.PageResponse',
      '10': 'page'
    },
  ],
};

/// Descriptor for `ListSessionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSessionsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0U2Vzc2lvbnNSZXNwb25zZRI3CghzZXNzaW9ucxgBIAMoCzIbLnBpeGVsdHJhY2UubW'
    'dtdC52MS5TZXNzaW9uUghzZXNzaW9ucxI0CgRwYWdlGAIgASgLMiAucGl4ZWx0cmFjZS5tZ210'
    'LnYxLlBhZ2VSZXNwb25zZVIEcGFnZQ==');

@$core.Deprecated('Use listLiveSessionsRequestDescriptor instead')
const ListLiveSessionsRequest$json = {
  '1': 'ListLiveSessionsRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
  ],
};

/// Descriptor for `ListLiveSessionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLiveSessionsRequestDescriptor =
    $convert.base64Decode(
        'ChdMaXN0TGl2ZVNlc3Npb25zUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cm'
        'FjZS50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZA==');

@$core.Deprecated('Use listLiveSessionsResponseDescriptor instead')
const ListLiveSessionsResponse$json = {
  '1': 'ListLiveSessionsResponse',
  '2': [
    {
      '1': 'sessions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Session',
      '10': 'sessions'
    },
  ],
};

/// Descriptor for `ListLiveSessionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLiveSessionsResponseDescriptor =
    $convert.base64Decode(
        'ChhMaXN0TGl2ZVNlc3Npb25zUmVzcG9uc2USNwoIc2Vzc2lvbnMYASADKAsyGy5waXhlbHRyYW'
        'NlLm1nbXQudjEuU2Vzc2lvblIIc2Vzc2lvbnM=');

@$core.Deprecated('Use getSessionRequestDescriptor instead')
const GetSessionRequest$json = {
  '1': 'GetSessionRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'id'
    },
  ],
};

/// Descriptor for `GetSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSessionRequestDescriptor = $convert.base64Decode(
    'ChFHZXRTZXNzaW9uUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cmFjZS50eX'
    'Blcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIuCgJpZBgCIAEoCzIeLnBpeGVsdHJhY2UudHlw'
    'ZXMudjEuU2Vzc2lvbklkUgJpZA==');

@$core.Deprecated('Use getSessionResponseDescriptor instead')
const GetSessionResponse$json = {
  '1': 'GetSessionResponse',
  '2': [
    {
      '1': 'session',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Session',
      '10': 'session'
    },
  ],
};

/// Descriptor for `GetSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSessionResponseDescriptor = $convert.base64Decode(
    'ChJHZXRTZXNzaW9uUmVzcG9uc2USNQoHc2Vzc2lvbhgBIAEoCzIbLnBpeGVsdHJhY2UubWdtdC'
    '52MS5TZXNzaW9uUgdzZXNzaW9u');

@$core.Deprecated('Use updateSessionRequestDescriptor instead')
const UpdateSessionRequest$json = {
  '1': 'UpdateSessionRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'id'
    },
    {
      '1': 'tags',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.SessionTagUpdate',
      '10': 'tags'
    },
  ],
};

/// Descriptor for `UpdateSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSessionRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVTZXNzaW9uUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cmFjZS'
    '50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIuCgJpZBgCIAEoCzIeLnBpeGVsdHJhY2Uu'
    'dHlwZXMudjEuU2Vzc2lvbklkUgJpZBI4CgR0YWdzGAMgASgLMiQucGl4ZWx0cmFjZS5tZ210Ln'
    'YxLlNlc3Npb25UYWdVcGRhdGVSBHRhZ3M=');

@$core.Deprecated('Use updateSessionResponseDescriptor instead')
const UpdateSessionResponse$json = {
  '1': 'UpdateSessionResponse',
  '2': [
    {
      '1': 'session',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Session',
      '10': 'session'
    },
  ],
};

/// Descriptor for `UpdateSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSessionResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVTZXNzaW9uUmVzcG9uc2USNQoHc2Vzc2lvbhgBIAEoCzIbLnBpeGVsdHJhY2UubW'
    'dtdC52MS5TZXNzaW9uUgdzZXNzaW9u');

@$core.Deprecated('Use deleteSessionRequestDescriptor instead')
const DeleteSessionRequest$json = {
  '1': 'DeleteSessionRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'id'
    },
  ],
};

/// Descriptor for `DeleteSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSessionRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVTZXNzaW9uUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cmFjZS'
    '50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIuCgJpZBgCIAEoCzIeLnBpeGVsdHJhY2Uu'
    'dHlwZXMudjEuU2Vzc2lvbklkUgJpZA==');

@$core.Deprecated('Use deleteSessionResponseDescriptor instead')
const DeleteSessionResponse$json = {
  '1': 'DeleteSessionResponse',
};

/// Descriptor for `DeleteSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSessionResponseDescriptor =
    $convert.base64Decode('ChVEZWxldGVTZXNzaW9uUmVzcG9uc2U=');

@$core.Deprecated('Use listDeletedSessionsRequestDescriptor instead')
const ListDeletedSessionsRequest$json = {
  '1': 'ListDeletedSessionsRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.PageRequest',
      '10': 'page'
    },
  ],
};

/// Descriptor for `ListDeletedSessionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeletedSessionsRequestDescriptor =
    $convert.base64Decode(
        'ChpMaXN0RGVsZXRlZFNlc3Npb25zUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZW'
        'x0cmFjZS50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIzCgRwYWdlGAIgASgLMh8ucGl4'
        'ZWx0cmFjZS5tZ210LnYxLlBhZ2VSZXF1ZXN0UgRwYWdl');

@$core.Deprecated('Use listDeletedSessionsResponseDescriptor instead')
const ListDeletedSessionsResponse$json = {
  '1': 'ListDeletedSessionsResponse',
  '2': [
    {
      '1': 'sessions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Session',
      '10': 'sessions'
    },
    {
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.PageResponse',
      '10': 'page'
    },
  ],
};

/// Descriptor for `ListDeletedSessionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeletedSessionsResponseDescriptor =
    $convert.base64Decode(
        'ChtMaXN0RGVsZXRlZFNlc3Npb25zUmVzcG9uc2USNwoIc2Vzc2lvbnMYASADKAsyGy5waXhlbH'
        'RyYWNlLm1nbXQudjEuU2Vzc2lvblIIc2Vzc2lvbnMSNAoEcGFnZRgCIAEoCzIgLnBpeGVsdHJh'
        'Y2UubWdtdC52MS5QYWdlUmVzcG9uc2VSBHBhZ2U=');

@$core.Deprecated('Use restoreSessionRequestDescriptor instead')
const RestoreSessionRequest$json = {
  '1': 'RestoreSessionRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'id'
    },
  ],
};

/// Descriptor for `RestoreSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restoreSessionRequestDescriptor = $convert.base64Decode(
    'ChVSZXN0b3JlU2Vzc2lvblJlcXVlc3QSPQoKcHJvamVjdF9pZBgBIAEoCzIeLnBpeGVsdHJhY2'
    'UudHlwZXMudjEuUHJvamVjdElkUglwcm9qZWN0SWQSLgoCaWQYAiABKAsyHi5waXhlbHRyYWNl'
    'LnR5cGVzLnYxLlNlc3Npb25JZFICaWQ=');

@$core.Deprecated('Use restoreSessionResponseDescriptor instead')
const RestoreSessionResponse$json = {
  '1': 'RestoreSessionResponse',
  '2': [
    {
      '1': 'session',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Session',
      '10': 'session'
    },
  ],
};

/// Descriptor for `RestoreSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restoreSessionResponseDescriptor =
    $convert.base64Decode(
        'ChZSZXN0b3JlU2Vzc2lvblJlc3BvbnNlEjUKB3Nlc3Npb24YASABKAsyGy5waXhlbHRyYWNlLm'
        '1nbXQudjEuU2Vzc2lvblIHc2Vzc2lvbg==');

@$core.Deprecated('Use unseenSessionCountDescriptor instead')
const UnseenSessionCount$json = {
  '1': 'UnseenSessionCount',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 13, '10': 'count'},
    {'1': 'capped', '3': 2, '4': 1, '5': 8, '10': 'capped'},
  ],
};

/// Descriptor for `UnseenSessionCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unseenSessionCountDescriptor = $convert.base64Decode(
    'ChJVbnNlZW5TZXNzaW9uQ291bnQSFAoFY291bnQYASABKA1SBWNvdW50EhYKBmNhcHBlZBgCIA'
    'EoCFIGY2FwcGVk');

@$core.Deprecated('Use markSessionsSeenRequestDescriptor instead')
const MarkSessionsSeenRequest$json = {
  '1': 'MarkSessionsSeenRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'ids',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'ids'
    },
    {'1': 'seen', '3': 3, '4': 1, '5': 8, '10': 'seen'},
  ],
};

/// Descriptor for `MarkSessionsSeenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markSessionsSeenRequestDescriptor = $convert.base64Decode(
    'ChdNYXJrU2Vzc2lvbnNTZWVuUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cm'
    'FjZS50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBIwCgNpZHMYAiADKAsyHi5waXhlbHRy'
    'YWNlLnR5cGVzLnYxLlNlc3Npb25JZFIDaWRzEhIKBHNlZW4YAyABKAhSBHNlZW4=');

@$core.Deprecated('Use markSessionsSeenResponseDescriptor instead')
const MarkSessionsSeenResponse$json = {
  '1': 'MarkSessionsSeenResponse',
  '2': [
    {
      '1': 'unseen',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.UnseenSessionCount',
      '10': 'unseen'
    },
  ],
};

/// Descriptor for `MarkSessionsSeenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markSessionsSeenResponseDescriptor =
    $convert.base64Decode(
        'ChhNYXJrU2Vzc2lvbnNTZWVuUmVzcG9uc2USPgoGdW5zZWVuGAEgASgLMiYucGl4ZWx0cmFjZS'
        '5tZ210LnYxLlVuc2VlblNlc3Npb25Db3VudFIGdW5zZWVu');

@$core.Deprecated('Use markAllSessionsSeenRequestDescriptor instead')
const MarkAllSessionsSeenRequest$json = {
  '1': 'MarkAllSessionsSeenRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
  ],
};

/// Descriptor for `MarkAllSessionsSeenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markAllSessionsSeenRequestDescriptor =
    $convert.base64Decode(
        'ChpNYXJrQWxsU2Vzc2lvbnNTZWVuUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZW'
        'x0cmFjZS50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZA==');

@$core.Deprecated('Use markAllSessionsSeenResponseDescriptor instead')
const MarkAllSessionsSeenResponse$json = {
  '1': 'MarkAllSessionsSeenResponse',
  '2': [
    {
      '1': 'unseen',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.UnseenSessionCount',
      '10': 'unseen'
    },
  ],
};

/// Descriptor for `MarkAllSessionsSeenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markAllSessionsSeenResponseDescriptor =
    $convert.base64Decode(
        'ChtNYXJrQWxsU2Vzc2lvbnNTZWVuUmVzcG9uc2USPgoGdW5zZWVuGAEgASgLMiYucGl4ZWx0cm'
        'FjZS5tZ210LnYxLlVuc2VlblNlc3Npb25Db3VudFIGdW5zZWVu');

@$core.Deprecated('Use getUnseenSessionCountRequestDescriptor instead')
const GetUnseenSessionCountRequest$json = {
  '1': 'GetUnseenSessionCountRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
  ],
};

/// Descriptor for `GetUnseenSessionCountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnseenSessionCountRequestDescriptor =
    $convert.base64Decode(
        'ChxHZXRVbnNlZW5TZXNzaW9uQ291bnRSZXF1ZXN0Ej0KCnByb2plY3RfaWQYASABKAsyHi5waX'
        'hlbHRyYWNlLnR5cGVzLnYxLlByb2plY3RJZFIJcHJvamVjdElk');

@$core.Deprecated('Use getUnseenSessionCountResponseDescriptor instead')
const GetUnseenSessionCountResponse$json = {
  '1': 'GetUnseenSessionCountResponse',
  '2': [
    {
      '1': 'unseen',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.UnseenSessionCount',
      '10': 'unseen'
    },
  ],
};

/// Descriptor for `GetUnseenSessionCountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnseenSessionCountResponseDescriptor =
    $convert.base64Decode(
        'Ch1HZXRVbnNlZW5TZXNzaW9uQ291bnRSZXNwb25zZRI+CgZ1bnNlZW4YASABKAsyJi5waXhlbH'
        'RyYWNlLm1nbXQudjEuVW5zZWVuU2Vzc2lvbkNvdW50UgZ1bnNlZW4=');

@$core.Deprecated('Use clearSessionsRequestDescriptor instead')
const ClearSessionsRequest$json = {
  '1': 'ClearSessionsRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
  ],
};

/// Descriptor for `ClearSessionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clearSessionsRequestDescriptor = $convert.base64Decode(
    'ChRDbGVhclNlc3Npb25zUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cmFjZS'
    '50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZA==');

@$core.Deprecated('Use clearSessionsResponseDescriptor instead')
const ClearSessionsResponse$json = {
  '1': 'ClearSessionsResponse',
};

/// Descriptor for `ClearSessionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clearSessionsResponseDescriptor =
    $convert.base64Decode('ChVDbGVhclNlc3Npb25zUmVzcG9uc2U=');

@$core.Deprecated('Use getSessionPlaybackUrlRequestDescriptor instead')
const GetSessionPlaybackUrlRequest$json = {
  '1': 'GetSessionPlaybackUrlRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'session_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'sessionId'
    },
  ],
};

/// Descriptor for `GetSessionPlaybackUrlRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSessionPlaybackUrlRequestDescriptor =
    $convert.base64Decode(
        'ChxHZXRTZXNzaW9uUGxheWJhY2tVcmxSZXF1ZXN0Ej0KCnByb2plY3RfaWQYASABKAsyHi5waX'
        'hlbHRyYWNlLnR5cGVzLnYxLlByb2plY3RJZFIJcHJvamVjdElkEj0KCnNlc3Npb25faWQYAiAB'
        'KAsyHi5waXhlbHRyYWNlLnR5cGVzLnYxLlNlc3Npb25JZFIJc2Vzc2lvbklk');

@$core.Deprecated('Use getSessionPlaybackUrlResponseDescriptor instead')
const GetSessionPlaybackUrlResponse$json = {
  '1': 'GetSessionPlaybackUrlResponse',
  '2': [
    {'1': 'playlist_url', '3': 1, '4': 1, '5': 9, '10': 'playlistUrl'},
    {
      '1': 'expires_at',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiresAt'
    },
  ],
};

/// Descriptor for `GetSessionPlaybackUrlResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSessionPlaybackUrlResponseDescriptor =
    $convert.base64Decode(
        'Ch1HZXRTZXNzaW9uUGxheWJhY2tVcmxSZXNwb25zZRIhCgxwbGF5bGlzdF91cmwYASABKAlSC3'
        'BsYXlsaXN0VXJsEjkKCmV4cGlyZXNfYXQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
        'YW1wUglleHBpcmVzQXQ=');

@$core.Deprecated('Use watchLiveSessionRequestDescriptor instead')
const WatchLiveSessionRequest$json = {
  '1': 'WatchLiveSessionRequest',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.ProjectId',
      '10': 'projectId'
    },
    {
      '1': 'session_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'sessionId'
    },
    {'1': 'sdp_offer', '3': 3, '4': 1, '5': 9, '10': 'sdpOffer'},
  ],
};

/// Descriptor for `WatchLiveSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchLiveSessionRequestDescriptor = $convert.base64Decode(
    'ChdXYXRjaExpdmVTZXNzaW9uUmVxdWVzdBI9Cgpwcm9qZWN0X2lkGAEgASgLMh4ucGl4ZWx0cm'
    'FjZS50eXBlcy52MS5Qcm9qZWN0SWRSCXByb2plY3RJZBI9CgpzZXNzaW9uX2lkGAIgASgLMh4u'
    'cGl4ZWx0cmFjZS50eXBlcy52MS5TZXNzaW9uSWRSCXNlc3Npb25JZBIbCglzZHBfb2ZmZXIYAy'
    'ABKAlSCHNkcE9mZmVy');

@$core.Deprecated('Use watchLiveSessionResponseDescriptor instead')
const WatchLiveSessionResponse$json = {
  '1': 'WatchLiveSessionResponse',
  '2': [
    {'1': 'sdp_answer', '3': 1, '4': 1, '5': 9, '10': 'sdpAnswer'},
    {
      '1': 'live_view',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.LiveView',
      '10': 'liveView'
    },
  ],
};

/// Descriptor for `WatchLiveSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchLiveSessionResponseDescriptor = $convert.base64Decode(
    'ChhXYXRjaExpdmVTZXNzaW9uUmVzcG9uc2USHQoKc2RwX2Fuc3dlchgBIAEoCVIJc2RwQW5zd2'
    'VyEjkKCWxpdmVfdmlldxgCIAEoCzIcLnBpeGVsdHJhY2UubWdtdC52MS5MaXZlVmlld1IIbGl2'
    'ZVZpZXc=');

@$core.Deprecated('Use liveViewDescriptor instead')
const LiveView$json = {
  '1': 'LiveView',
  '2': [
    {'1': 'relay_url', '3': 1, '4': 1, '5': 9, '10': 'relayUrl'},
  ],
};

/// Descriptor for `LiveView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List liveViewDescriptor = $convert
    .base64Decode('CghMaXZlVmlldxIbCglyZWxheV91cmwYASABKAlSCHJlbGF5VXJs');

const $core.Map<$core.String, $core.dynamic> ProjectServiceBase$json = {
  '1': 'ProjectService',
  '2': [
    {
      '1': 'CreateProject',
      '2': '.pixeltrace.mgmt.v1.CreateProjectRequest',
      '3': '.pixeltrace.mgmt.v1.CreateProjectResponse'
    },
    {
      '1': 'GetProject',
      '2': '.pixeltrace.mgmt.v1.GetProjectRequest',
      '3': '.pixeltrace.mgmt.v1.GetProjectResponse'
    },
    {
      '1': 'UpdateProject',
      '2': '.pixeltrace.mgmt.v1.UpdateProjectRequest',
      '3': '.pixeltrace.mgmt.v1.UpdateProjectResponse'
    },
    {
      '1': 'DeleteProject',
      '2': '.pixeltrace.mgmt.v1.DeleteProjectRequest',
      '3': '.pixeltrace.mgmt.v1.DeleteProjectResponse'
    },
    {
      '1': 'CreateSiteKey',
      '2': '.pixeltrace.mgmt.v1.CreateSiteKeyRequest',
      '3': '.pixeltrace.mgmt.v1.CreateSiteKeyResponse'
    },
    {
      '1': 'GetSiteKey',
      '2': '.pixeltrace.mgmt.v1.GetSiteKeyRequest',
      '3': '.pixeltrace.mgmt.v1.GetSiteKeyResponse'
    },
    {
      '1': 'ListSiteKeys',
      '2': '.pixeltrace.mgmt.v1.ListSiteKeysRequest',
      '3': '.pixeltrace.mgmt.v1.ListSiteKeysResponse'
    },
    {
      '1': 'UpdateSiteKey',
      '2': '.pixeltrace.mgmt.v1.UpdateSiteKeyRequest',
      '3': '.pixeltrace.mgmt.v1.UpdateSiteKeyResponse'
    },
    {
      '1': 'RevokeSiteKey',
      '2': '.pixeltrace.mgmt.v1.RevokeSiteKeyRequest',
      '3': '.pixeltrace.mgmt.v1.RevokeSiteKeyResponse'
    },
    {
      '1': 'CreateProjectTag',
      '2': '.pixeltrace.mgmt.v1.CreateProjectTagRequest',
      '3': '.pixeltrace.mgmt.v1.CreateProjectTagResponse'
    },
    {
      '1': 'ListProjectTags',
      '2': '.pixeltrace.mgmt.v1.ListProjectTagsRequest',
      '3': '.pixeltrace.mgmt.v1.ListProjectTagsResponse'
    },
    {
      '1': 'UpdateProjectTag',
      '2': '.pixeltrace.mgmt.v1.UpdateProjectTagRequest',
      '3': '.pixeltrace.mgmt.v1.UpdateProjectTagResponse'
    },
    {
      '1': 'DeleteProjectTag',
      '2': '.pixeltrace.mgmt.v1.DeleteProjectTagRequest',
      '3': '.pixeltrace.mgmt.v1.DeleteProjectTagResponse'
    },
    {
      '1': 'AssignProjectMember',
      '2': '.pixeltrace.mgmt.v1.AssignProjectMemberRequest',
      '3': '.pixeltrace.mgmt.v1.AssignProjectMemberResponse'
    },
    {
      '1': 'GetProjectMember',
      '2': '.pixeltrace.mgmt.v1.GetProjectMemberRequest',
      '3': '.pixeltrace.mgmt.v1.GetProjectMemberResponse'
    },
    {
      '1': 'UpdateProjectMember',
      '2': '.pixeltrace.mgmt.v1.UpdateProjectMemberRequest',
      '3': '.pixeltrace.mgmt.v1.UpdateProjectMemberResponse'
    },
    {
      '1': 'RemoveProjectMember',
      '2': '.pixeltrace.mgmt.v1.RemoveProjectMemberRequest',
      '3': '.pixeltrace.mgmt.v1.RemoveProjectMemberResponse'
    },
    {
      '1': 'ListProjectMembers',
      '2': '.pixeltrace.mgmt.v1.ListProjectMembersRequest',
      '3': '.pixeltrace.mgmt.v1.ListProjectMembersResponse'
    },
    {
      '1': 'ListSessions',
      '2': '.pixeltrace.mgmt.v1.ListSessionsRequest',
      '3': '.pixeltrace.mgmt.v1.ListSessionsResponse'
    },
    {
      '1': 'ListLiveSessions',
      '2': '.pixeltrace.mgmt.v1.ListLiveSessionsRequest',
      '3': '.pixeltrace.mgmt.v1.ListLiveSessionsResponse'
    },
    {
      '1': 'GetSession',
      '2': '.pixeltrace.mgmt.v1.GetSessionRequest',
      '3': '.pixeltrace.mgmt.v1.GetSessionResponse'
    },
    {
      '1': 'UpdateSession',
      '2': '.pixeltrace.mgmt.v1.UpdateSessionRequest',
      '3': '.pixeltrace.mgmt.v1.UpdateSessionResponse'
    },
    {
      '1': 'DeleteSession',
      '2': '.pixeltrace.mgmt.v1.DeleteSessionRequest',
      '3': '.pixeltrace.mgmt.v1.DeleteSessionResponse'
    },
    {
      '1': 'ListDeletedSessions',
      '2': '.pixeltrace.mgmt.v1.ListDeletedSessionsRequest',
      '3': '.pixeltrace.mgmt.v1.ListDeletedSessionsResponse'
    },
    {
      '1': 'RestoreSession',
      '2': '.pixeltrace.mgmt.v1.RestoreSessionRequest',
      '3': '.pixeltrace.mgmt.v1.RestoreSessionResponse'
    },
    {
      '1': 'MarkSessionsSeen',
      '2': '.pixeltrace.mgmt.v1.MarkSessionsSeenRequest',
      '3': '.pixeltrace.mgmt.v1.MarkSessionsSeenResponse'
    },
    {
      '1': 'MarkAllSessionsSeen',
      '2': '.pixeltrace.mgmt.v1.MarkAllSessionsSeenRequest',
      '3': '.pixeltrace.mgmt.v1.MarkAllSessionsSeenResponse'
    },
    {
      '1': 'GetUnseenSessionCount',
      '2': '.pixeltrace.mgmt.v1.GetUnseenSessionCountRequest',
      '3': '.pixeltrace.mgmt.v1.GetUnseenSessionCountResponse'
    },
    {
      '1': 'ClearSessions',
      '2': '.pixeltrace.mgmt.v1.ClearSessionsRequest',
      '3': '.pixeltrace.mgmt.v1.ClearSessionsResponse'
    },
    {
      '1': 'GetSessionPlaybackUrl',
      '2': '.pixeltrace.mgmt.v1.GetSessionPlaybackUrlRequest',
      '3': '.pixeltrace.mgmt.v1.GetSessionPlaybackUrlResponse'
    },
    {
      '1': 'WatchLiveSession',
      '2': '.pixeltrace.mgmt.v1.WatchLiveSessionRequest',
      '3': '.pixeltrace.mgmt.v1.WatchLiveSessionResponse'
    },
  ],
};

@$core.Deprecated('Use projectServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ProjectServiceBase$messageJson = {
  '.pixeltrace.mgmt.v1.CreateProjectRequest': CreateProjectRequest$json,
  '.pixeltrace.types.v1.OrganizationId': $0.OrganizationId$json,
  '.pixeltrace.mgmt.v1.ProjectProps': ProjectProps$json,
  '.pixeltrace.mgmt.v1.CreateProjectResponse': CreateProjectResponse$json,
  '.pixeltrace.mgmt.v1.Project': Project$json,
  '.pixeltrace.types.v1.ProjectId': $0.ProjectId$json,
  '.pixeltrace.mgmt.v1.GetProjectRequest': GetProjectRequest$json,
  '.pixeltrace.mgmt.v1.GetProjectResponse': GetProjectResponse$json,
  '.pixeltrace.mgmt.v1.UpdateProjectRequest': UpdateProjectRequest$json,
  '.google.protobuf.FieldMask': $1.FieldMask$json,
  '.pixeltrace.mgmt.v1.UpdateProjectResponse': UpdateProjectResponse$json,
  '.pixeltrace.mgmt.v1.DeleteProjectRequest': DeleteProjectRequest$json,
  '.pixeltrace.mgmt.v1.DeleteProjectResponse': DeleteProjectResponse$json,
  '.pixeltrace.mgmt.v1.CreateSiteKeyRequest': CreateSiteKeyRequest$json,
  '.pixeltrace.mgmt.v1.ProjectSiteKeyProps': ProjectSiteKeyProps$json,
  '.pixeltrace.mgmt.v1.CreateSiteKeyResponse': CreateSiteKeyResponse$json,
  '.pixeltrace.mgmt.v1.ProjectSiteKey': ProjectSiteKey$json,
  '.pixeltrace.types.v1.SiteKey': $0.SiteKey$json,
  '.google.protobuf.Timestamp': $3.Timestamp$json,
  '.pixeltrace.mgmt.v1.GetSiteKeyRequest': GetSiteKeyRequest$json,
  '.pixeltrace.mgmt.v1.GetSiteKeyResponse': GetSiteKeyResponse$json,
  '.pixeltrace.mgmt.v1.ListSiteKeysRequest': ListSiteKeysRequest$json,
  '.pixeltrace.mgmt.v1.PageRequest': $2.PageRequest$json,
  '.pixeltrace.mgmt.v1.ListSiteKeysResponse': ListSiteKeysResponse$json,
  '.pixeltrace.mgmt.v1.PageResponse': $2.PageResponse$json,
  '.pixeltrace.mgmt.v1.UpdateSiteKeyRequest': UpdateSiteKeyRequest$json,
  '.pixeltrace.mgmt.v1.UpdateSiteKeyResponse': UpdateSiteKeyResponse$json,
  '.pixeltrace.mgmt.v1.RevokeSiteKeyRequest': RevokeSiteKeyRequest$json,
  '.pixeltrace.mgmt.v1.RevokeSiteKeyResponse': RevokeSiteKeyResponse$json,
  '.pixeltrace.mgmt.v1.CreateProjectTagRequest': CreateProjectTagRequest$json,
  '.pixeltrace.mgmt.v1.ProjectTagProps': ProjectTagProps$json,
  '.pixeltrace.mgmt.v1.CreateProjectTagResponse': CreateProjectTagResponse$json,
  '.pixeltrace.mgmt.v1.ProjectTag': ProjectTag$json,
  '.pixeltrace.types.v1.ProjectTagId': $0.ProjectTagId$json,
  '.pixeltrace.mgmt.v1.ListProjectTagsRequest': ListProjectTagsRequest$json,
  '.pixeltrace.mgmt.v1.ListProjectTagsResponse': ListProjectTagsResponse$json,
  '.pixeltrace.mgmt.v1.ListProjectTagsResponse.SessionCountsEntry':
      ListProjectTagsResponse_SessionCountsEntry$json,
  '.pixeltrace.mgmt.v1.UpdateProjectTagRequest': UpdateProjectTagRequest$json,
  '.pixeltrace.mgmt.v1.UpdateProjectTagResponse': UpdateProjectTagResponse$json,
  '.pixeltrace.mgmt.v1.DeleteProjectTagRequest': DeleteProjectTagRequest$json,
  '.pixeltrace.mgmt.v1.DeleteProjectTagResponse': DeleteProjectTagResponse$json,
  '.pixeltrace.mgmt.v1.AssignProjectMemberRequest':
      AssignProjectMemberRequest$json,
  '.pixeltrace.mgmt.v1.ProjectMemberKey': ProjectMemberKey$json,
  '.pixeltrace.types.v1.UserId': $0.UserId$json,
  '.pixeltrace.mgmt.v1.ProjectMemberProps': ProjectMemberProps$json,
  '.pixeltrace.mgmt.v1.AssignProjectMemberResponse':
      AssignProjectMemberResponse$json,
  '.pixeltrace.mgmt.v1.ProjectMember': ProjectMember$json,
  '.pixeltrace.mgmt.v1.GetProjectMemberRequest': GetProjectMemberRequest$json,
  '.pixeltrace.mgmt.v1.GetProjectMemberResponse': GetProjectMemberResponse$json,
  '.pixeltrace.mgmt.v1.UpdateProjectMemberRequest':
      UpdateProjectMemberRequest$json,
  '.pixeltrace.mgmt.v1.UpdateProjectMemberResponse':
      UpdateProjectMemberResponse$json,
  '.pixeltrace.mgmt.v1.RemoveProjectMemberRequest':
      RemoveProjectMemberRequest$json,
  '.pixeltrace.mgmt.v1.RemoveProjectMemberResponse':
      RemoveProjectMemberResponse$json,
  '.pixeltrace.mgmt.v1.ListProjectMembersRequest':
      ListProjectMembersRequest$json,
  '.pixeltrace.mgmt.v1.ListProjectMembersResponse':
      ListProjectMembersResponse$json,
  '.pixeltrace.mgmt.v1.ListSessionsRequest': ListSessionsRequest$json,
  '.pixeltrace.mgmt.v1.ListSessionsResponse': ListSessionsResponse$json,
  '.pixeltrace.mgmt.v1.Session': Session$json,
  '.pixeltrace.types.v1.SessionId': $0.SessionId$json,
  '.pixeltrace.mgmt.v1.SessionProps': SessionProps$json,
  '.pixeltrace.types.v1.SessionPublisherInfo': $0.SessionPublisherInfo$json,
  '.pixeltrace.mgmt.v1.SessionAttributes': SessionAttributes$json,
  '.google.protobuf.Duration': $4.Duration$json,
  '.pixeltrace.mgmt.v1.Sparkline': Sparkline$json,
  '.pixeltrace.mgmt.v1.ListLiveSessionsRequest': ListLiveSessionsRequest$json,
  '.pixeltrace.mgmt.v1.ListLiveSessionsResponse': ListLiveSessionsResponse$json,
  '.pixeltrace.mgmt.v1.GetSessionRequest': GetSessionRequest$json,
  '.pixeltrace.mgmt.v1.GetSessionResponse': GetSessionResponse$json,
  '.pixeltrace.mgmt.v1.UpdateSessionRequest': UpdateSessionRequest$json,
  '.pixeltrace.mgmt.v1.SessionTagUpdate': SessionTagUpdate$json,
  '.pixeltrace.mgmt.v1.UpdateSessionResponse': UpdateSessionResponse$json,
  '.pixeltrace.mgmt.v1.DeleteSessionRequest': DeleteSessionRequest$json,
  '.pixeltrace.mgmt.v1.DeleteSessionResponse': DeleteSessionResponse$json,
  '.pixeltrace.mgmt.v1.ListDeletedSessionsRequest':
      ListDeletedSessionsRequest$json,
  '.pixeltrace.mgmt.v1.ListDeletedSessionsResponse':
      ListDeletedSessionsResponse$json,
  '.pixeltrace.mgmt.v1.RestoreSessionRequest': RestoreSessionRequest$json,
  '.pixeltrace.mgmt.v1.RestoreSessionResponse': RestoreSessionResponse$json,
  '.pixeltrace.mgmt.v1.MarkSessionsSeenRequest': MarkSessionsSeenRequest$json,
  '.pixeltrace.mgmt.v1.MarkSessionsSeenResponse': MarkSessionsSeenResponse$json,
  '.pixeltrace.mgmt.v1.UnseenSessionCount': UnseenSessionCount$json,
  '.pixeltrace.mgmt.v1.MarkAllSessionsSeenRequest':
      MarkAllSessionsSeenRequest$json,
  '.pixeltrace.mgmt.v1.MarkAllSessionsSeenResponse':
      MarkAllSessionsSeenResponse$json,
  '.pixeltrace.mgmt.v1.GetUnseenSessionCountRequest':
      GetUnseenSessionCountRequest$json,
  '.pixeltrace.mgmt.v1.GetUnseenSessionCountResponse':
      GetUnseenSessionCountResponse$json,
  '.pixeltrace.mgmt.v1.ClearSessionsRequest': ClearSessionsRequest$json,
  '.pixeltrace.mgmt.v1.ClearSessionsResponse': ClearSessionsResponse$json,
  '.pixeltrace.mgmt.v1.GetSessionPlaybackUrlRequest':
      GetSessionPlaybackUrlRequest$json,
  '.pixeltrace.mgmt.v1.GetSessionPlaybackUrlResponse':
      GetSessionPlaybackUrlResponse$json,
  '.pixeltrace.mgmt.v1.WatchLiveSessionRequest': WatchLiveSessionRequest$json,
  '.pixeltrace.mgmt.v1.WatchLiveSessionResponse': WatchLiveSessionResponse$json,
  '.pixeltrace.mgmt.v1.LiveView': LiveView$json,
};

/// Descriptor for `ProjectService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List projectServiceDescriptor = $convert.base64Decode(
    'Cg5Qcm9qZWN0U2VydmljZRJkCg1DcmVhdGVQcm9qZWN0EigucGl4ZWx0cmFjZS5tZ210LnYxLk'
    'NyZWF0ZVByb2plY3RSZXF1ZXN0GikucGl4ZWx0cmFjZS5tZ210LnYxLkNyZWF0ZVByb2plY3RS'
    'ZXNwb25zZRJbCgpHZXRQcm9qZWN0EiUucGl4ZWx0cmFjZS5tZ210LnYxLkdldFByb2plY3RSZX'
    'F1ZXN0GiYucGl4ZWx0cmFjZS5tZ210LnYxLkdldFByb2plY3RSZXNwb25zZRJkCg1VcGRhdGVQ'
    'cm9qZWN0EigucGl4ZWx0cmFjZS5tZ210LnYxLlVwZGF0ZVByb2plY3RSZXF1ZXN0GikucGl4ZW'
    'x0cmFjZS5tZ210LnYxLlVwZGF0ZVByb2plY3RSZXNwb25zZRJkCg1EZWxldGVQcm9qZWN0Eigu'
    'cGl4ZWx0cmFjZS5tZ210LnYxLkRlbGV0ZVByb2plY3RSZXF1ZXN0GikucGl4ZWx0cmFjZS5tZ2'
    '10LnYxLkRlbGV0ZVByb2plY3RSZXNwb25zZRJkCg1DcmVhdGVTaXRlS2V5EigucGl4ZWx0cmFj'
    'ZS5tZ210LnYxLkNyZWF0ZVNpdGVLZXlSZXF1ZXN0GikucGl4ZWx0cmFjZS5tZ210LnYxLkNyZW'
    'F0ZVNpdGVLZXlSZXNwb25zZRJbCgpHZXRTaXRlS2V5EiUucGl4ZWx0cmFjZS5tZ210LnYxLkdl'
    'dFNpdGVLZXlSZXF1ZXN0GiYucGl4ZWx0cmFjZS5tZ210LnYxLkdldFNpdGVLZXlSZXNwb25zZR'
    'JhCgxMaXN0U2l0ZUtleXMSJy5waXhlbHRyYWNlLm1nbXQudjEuTGlzdFNpdGVLZXlzUmVxdWVz'
    'dBooLnBpeGVsdHJhY2UubWdtdC52MS5MaXN0U2l0ZUtleXNSZXNwb25zZRJkCg1VcGRhdGVTaX'
    'RlS2V5EigucGl4ZWx0cmFjZS5tZ210LnYxLlVwZGF0ZVNpdGVLZXlSZXF1ZXN0GikucGl4ZWx0'
    'cmFjZS5tZ210LnYxLlVwZGF0ZVNpdGVLZXlSZXNwb25zZRJkCg1SZXZva2VTaXRlS2V5EigucG'
    'l4ZWx0cmFjZS5tZ210LnYxLlJldm9rZVNpdGVLZXlSZXF1ZXN0GikucGl4ZWx0cmFjZS5tZ210'
    'LnYxLlJldm9rZVNpdGVLZXlSZXNwb25zZRJtChBDcmVhdGVQcm9qZWN0VGFnEisucGl4ZWx0cm'
    'FjZS5tZ210LnYxLkNyZWF0ZVByb2plY3RUYWdSZXF1ZXN0GiwucGl4ZWx0cmFjZS5tZ210LnYx'
    'LkNyZWF0ZVByb2plY3RUYWdSZXNwb25zZRJqCg9MaXN0UHJvamVjdFRhZ3MSKi5waXhlbHRyYW'
    'NlLm1nbXQudjEuTGlzdFByb2plY3RUYWdzUmVxdWVzdBorLnBpeGVsdHJhY2UubWdtdC52MS5M'
    'aXN0UHJvamVjdFRhZ3NSZXNwb25zZRJtChBVcGRhdGVQcm9qZWN0VGFnEisucGl4ZWx0cmFjZS'
    '5tZ210LnYxLlVwZGF0ZVByb2plY3RUYWdSZXF1ZXN0GiwucGl4ZWx0cmFjZS5tZ210LnYxLlVw'
    'ZGF0ZVByb2plY3RUYWdSZXNwb25zZRJtChBEZWxldGVQcm9qZWN0VGFnEisucGl4ZWx0cmFjZS'
    '5tZ210LnYxLkRlbGV0ZVByb2plY3RUYWdSZXF1ZXN0GiwucGl4ZWx0cmFjZS5tZ210LnYxLkRl'
    'bGV0ZVByb2plY3RUYWdSZXNwb25zZRJ2ChNBc3NpZ25Qcm9qZWN0TWVtYmVyEi4ucGl4ZWx0cm'
    'FjZS5tZ210LnYxLkFzc2lnblByb2plY3RNZW1iZXJSZXF1ZXN0Gi8ucGl4ZWx0cmFjZS5tZ210'
    'LnYxLkFzc2lnblByb2plY3RNZW1iZXJSZXNwb25zZRJtChBHZXRQcm9qZWN0TWVtYmVyEisucG'
    'l4ZWx0cmFjZS5tZ210LnYxLkdldFByb2plY3RNZW1iZXJSZXF1ZXN0GiwucGl4ZWx0cmFjZS5t'
    'Z210LnYxLkdldFByb2plY3RNZW1iZXJSZXNwb25zZRJ2ChNVcGRhdGVQcm9qZWN0TWVtYmVyEi'
    '4ucGl4ZWx0cmFjZS5tZ210LnYxLlVwZGF0ZVByb2plY3RNZW1iZXJSZXF1ZXN0Gi8ucGl4ZWx0'
    'cmFjZS5tZ210LnYxLlVwZGF0ZVByb2plY3RNZW1iZXJSZXNwb25zZRJ2ChNSZW1vdmVQcm9qZW'
    'N0TWVtYmVyEi4ucGl4ZWx0cmFjZS5tZ210LnYxLlJlbW92ZVByb2plY3RNZW1iZXJSZXF1ZXN0'
    'Gi8ucGl4ZWx0cmFjZS5tZ210LnYxLlJlbW92ZVByb2plY3RNZW1iZXJSZXNwb25zZRJzChJMaX'
    'N0UHJvamVjdE1lbWJlcnMSLS5waXhlbHRyYWNlLm1nbXQudjEuTGlzdFByb2plY3RNZW1iZXJz'
    'UmVxdWVzdBouLnBpeGVsdHJhY2UubWdtdC52MS5MaXN0UHJvamVjdE1lbWJlcnNSZXNwb25zZR'
    'JhCgxMaXN0U2Vzc2lvbnMSJy5waXhlbHRyYWNlLm1nbXQudjEuTGlzdFNlc3Npb25zUmVxdWVz'
    'dBooLnBpeGVsdHJhY2UubWdtdC52MS5MaXN0U2Vzc2lvbnNSZXNwb25zZRJtChBMaXN0TGl2ZV'
    'Nlc3Npb25zEisucGl4ZWx0cmFjZS5tZ210LnYxLkxpc3RMaXZlU2Vzc2lvbnNSZXF1ZXN0Giwu'
    'cGl4ZWx0cmFjZS5tZ210LnYxLkxpc3RMaXZlU2Vzc2lvbnNSZXNwb25zZRJbCgpHZXRTZXNzaW'
    '9uEiUucGl4ZWx0cmFjZS5tZ210LnYxLkdldFNlc3Npb25SZXF1ZXN0GiYucGl4ZWx0cmFjZS5t'
    'Z210LnYxLkdldFNlc3Npb25SZXNwb25zZRJkCg1VcGRhdGVTZXNzaW9uEigucGl4ZWx0cmFjZS'
    '5tZ210LnYxLlVwZGF0ZVNlc3Npb25SZXF1ZXN0GikucGl4ZWx0cmFjZS5tZ210LnYxLlVwZGF0'
    'ZVNlc3Npb25SZXNwb25zZRJkCg1EZWxldGVTZXNzaW9uEigucGl4ZWx0cmFjZS5tZ210LnYxLk'
    'RlbGV0ZVNlc3Npb25SZXF1ZXN0GikucGl4ZWx0cmFjZS5tZ210LnYxLkRlbGV0ZVNlc3Npb25S'
    'ZXNwb25zZRJ2ChNMaXN0RGVsZXRlZFNlc3Npb25zEi4ucGl4ZWx0cmFjZS5tZ210LnYxLkxpc3'
    'REZWxldGVkU2Vzc2lvbnNSZXF1ZXN0Gi8ucGl4ZWx0cmFjZS5tZ210LnYxLkxpc3REZWxldGVk'
    'U2Vzc2lvbnNSZXNwb25zZRJnCg5SZXN0b3JlU2Vzc2lvbhIpLnBpeGVsdHJhY2UubWdtdC52MS'
    '5SZXN0b3JlU2Vzc2lvblJlcXVlc3QaKi5waXhlbHRyYWNlLm1nbXQudjEuUmVzdG9yZVNlc3Np'
    'b25SZXNwb25zZRJtChBNYXJrU2Vzc2lvbnNTZWVuEisucGl4ZWx0cmFjZS5tZ210LnYxLk1hcm'
    'tTZXNzaW9uc1NlZW5SZXF1ZXN0GiwucGl4ZWx0cmFjZS5tZ210LnYxLk1hcmtTZXNzaW9uc1Nl'
    'ZW5SZXNwb25zZRJ2ChNNYXJrQWxsU2Vzc2lvbnNTZWVuEi4ucGl4ZWx0cmFjZS5tZ210LnYxLk'
    '1hcmtBbGxTZXNzaW9uc1NlZW5SZXF1ZXN0Gi8ucGl4ZWx0cmFjZS5tZ210LnYxLk1hcmtBbGxT'
    'ZXNzaW9uc1NlZW5SZXNwb25zZRJ8ChVHZXRVbnNlZW5TZXNzaW9uQ291bnQSMC5waXhlbHRyYW'
    'NlLm1nbXQudjEuR2V0VW5zZWVuU2Vzc2lvbkNvdW50UmVxdWVzdBoxLnBpeGVsdHJhY2UubWdt'
    'dC52MS5HZXRVbnNlZW5TZXNzaW9uQ291bnRSZXNwb25zZRJkCg1DbGVhclNlc3Npb25zEigucG'
    'l4ZWx0cmFjZS5tZ210LnYxLkNsZWFyU2Vzc2lvbnNSZXF1ZXN0GikucGl4ZWx0cmFjZS5tZ210'
    'LnYxLkNsZWFyU2Vzc2lvbnNSZXNwb25zZRJ8ChVHZXRTZXNzaW9uUGxheWJhY2tVcmwSMC5waX'
    'hlbHRyYWNlLm1nbXQudjEuR2V0U2Vzc2lvblBsYXliYWNrVXJsUmVxdWVzdBoxLnBpeGVsdHJh'
    'Y2UubWdtdC52MS5HZXRTZXNzaW9uUGxheWJhY2tVcmxSZXNwb25zZRJtChBXYXRjaExpdmVTZX'
    'NzaW9uEisucGl4ZWx0cmFjZS5tZ210LnYxLldhdGNoTGl2ZVNlc3Npb25SZXF1ZXN0GiwucGl4'
    'ZWx0cmFjZS5tZ210LnYxLldhdGNoTGl2ZVNlc3Npb25SZXNwb25zZQ==');
