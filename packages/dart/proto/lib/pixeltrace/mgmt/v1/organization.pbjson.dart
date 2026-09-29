// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/organization.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'package:protobuf/well_known_types/google/protobuf/field_mask.pbjson.dart'
    as $1;

import '../../types/v1/types.pbjson.dart' as $0;
import 'project.pbjson.dart' as $3;
import 'types.pbjson.dart' as $2;

@$core.Deprecated('Use createOrganizationRequestDescriptor instead')
const CreateOrganizationRequest$json = {
  '1': 'CreateOrganizationRequest',
  '2': [
    {
      '1': 'props',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.OrganizationProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `CreateOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrganizationRequestDescriptor =
    $convert.base64Decode(
        'ChlDcmVhdGVPcmdhbml6YXRpb25SZXF1ZXN0EjsKBXByb3BzGAEgASgLMiUucGl4ZWx0cmFjZS'
        '5tZ210LnYxLk9yZ2FuaXphdGlvblByb3BzUgVwcm9wcw==');

@$core.Deprecated('Use createOrganizationResponseDescriptor instead')
const CreateOrganizationResponse$json = {
  '1': 'CreateOrganizationResponse',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.OrganizationId',
      '10': 'id'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.OrganizationProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `CreateOrganizationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrganizationResponseDescriptor =
    $convert.base64Decode(
        'ChpDcmVhdGVPcmdhbml6YXRpb25SZXNwb25zZRIzCgJpZBgBIAEoCzIjLnBpeGVsdHJhY2UudH'
        'lwZXMudjEuT3JnYW5pemF0aW9uSWRSAmlkEjsKBXByb3BzGAIgASgLMiUucGl4ZWx0cmFjZS5t'
        'Z210LnYxLk9yZ2FuaXphdGlvblByb3BzUgVwcm9wcw==');

@$core.Deprecated('Use getOrganizationRequestDescriptor instead')
const GetOrganizationRequest$json = {
  '1': 'GetOrganizationRequest',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.OrganizationId',
      '10': 'id'
    },
  ],
};

/// Descriptor for `GetOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrganizationRequestDescriptor =
    $convert.base64Decode(
        'ChZHZXRPcmdhbml6YXRpb25SZXF1ZXN0EjMKAmlkGAEgASgLMiMucGl4ZWx0cmFjZS50eXBlcy'
        '52MS5Pcmdhbml6YXRpb25JZFICaWQ=');

@$core.Deprecated('Use getOrganizationResponseDescriptor instead')
const GetOrganizationResponse$json = {
  '1': 'GetOrganizationResponse',
  '2': [
    {
      '1': 'organization',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Organization',
      '10': 'organization'
    },
  ],
};

/// Descriptor for `GetOrganizationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrganizationResponseDescriptor =
    $convert.base64Decode(
        'ChdHZXRPcmdhbml6YXRpb25SZXNwb25zZRJECgxvcmdhbml6YXRpb24YASABKAsyIC5waXhlbH'
        'RyYWNlLm1nbXQudjEuT3JnYW5pemF0aW9uUgxvcmdhbml6YXRpb24=');

@$core.Deprecated('Use updateOrganizationRequestDescriptor instead')
const UpdateOrganizationRequest$json = {
  '1': 'UpdateOrganizationRequest',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.OrganizationId',
      '10': 'id'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.OrganizationProps',
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

/// Descriptor for `UpdateOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOrganizationRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVPcmdhbml6YXRpb25SZXF1ZXN0EjMKAmlkGAEgASgLMiMucGl4ZWx0cmFjZS50eX'
    'Blcy52MS5Pcmdhbml6YXRpb25JZFICaWQSOwoFcHJvcHMYAiABKAsyJS5waXhlbHRyYWNlLm1n'
    'bXQudjEuT3JnYW5pemF0aW9uUHJvcHNSBXByb3BzEjsKC3VwZGF0ZV9tYXNrGAMgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLkZpZWxkTWFza1IKdXBkYXRlTWFzaw==');

@$core.Deprecated('Use updateOrganizationResponseDescriptor instead')
const UpdateOrganizationResponse$json = {
  '1': 'UpdateOrganizationResponse',
  '2': [
    {
      '1': 'organization',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Organization',
      '10': 'organization'
    },
  ],
};

/// Descriptor for `UpdateOrganizationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOrganizationResponseDescriptor =
    $convert.base64Decode(
        'ChpVcGRhdGVPcmdhbml6YXRpb25SZXNwb25zZRJECgxvcmdhbml6YXRpb24YASABKAsyIC5waX'
        'hlbHRyYWNlLm1nbXQudjEuT3JnYW5pemF0aW9uUgxvcmdhbml6YXRpb24=');

@$core.Deprecated('Use deleteOrganizationRequestDescriptor instead')
const DeleteOrganizationRequest$json = {
  '1': 'DeleteOrganizationRequest',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.OrganizationId',
      '10': 'id'
    },
    {
      '1': 'dangerously_allow_project_deletion',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'dangerouslyAllowProjectDeletion'
    },
  ],
};

/// Descriptor for `DeleteOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOrganizationRequestDescriptor = $convert.base64Decode(
    'ChlEZWxldGVPcmdhbml6YXRpb25SZXF1ZXN0EjMKAmlkGAEgASgLMiMucGl4ZWx0cmFjZS50eX'
    'Blcy52MS5Pcmdhbml6YXRpb25JZFICaWQSSwoiZGFuZ2Vyb3VzbHlfYWxsb3dfcHJvamVjdF9k'
    'ZWxldGlvbhgCIAEoCFIfZGFuZ2Vyb3VzbHlBbGxvd1Byb2plY3REZWxldGlvbg==');

@$core.Deprecated('Use deleteOrganizationResponseDescriptor instead')
const DeleteOrganizationResponse$json = {
  '1': 'DeleteOrganizationResponse',
};

/// Descriptor for `DeleteOrganizationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOrganizationResponseDescriptor =
    $convert.base64Decode('ChpEZWxldGVPcmdhbml6YXRpb25SZXNwb25zZQ==');

@$core.Deprecated('Use listProjectsRequestDescriptor instead')
const ListProjectsRequest$json = {
  '1': 'ListProjectsRequest',
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
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.PageRequest',
      '10': 'page'
    },
  ],
};

/// Descriptor for `ListProjectsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0UHJvamVjdHNSZXF1ZXN0EjoKBm9yZ19pZBgBIAEoCzIjLnBpeGVsdHJhY2UudHlwZX'
    'MudjEuT3JnYW5pemF0aW9uSWRSBW9yZ0lkEjMKBHBhZ2UYAiABKAsyHy5waXhlbHRyYWNlLm1n'
    'bXQudjEuUGFnZVJlcXVlc3RSBHBhZ2U=');

@$core.Deprecated('Use listProjectsResponseDescriptor instead')
const ListProjectsResponse$json = {
  '1': 'ListProjectsResponse',
  '2': [
    {
      '1': 'projects',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Project',
      '10': 'projects'
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

/// Descriptor for `ListProjectsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0UHJvamVjdHNSZXNwb25zZRI3Cghwcm9qZWN0cxgBIAMoCzIbLnBpeGVsdHJhY2UubW'
    'dtdC52MS5Qcm9qZWN0Ughwcm9qZWN0cxI0CgRwYWdlGAIgASgLMiAucGl4ZWx0cmFjZS5tZ210'
    'LnYxLlBhZ2VSZXNwb25zZVIEcGFnZQ==');

@$core.Deprecated('Use organizationDescriptor instead')
const Organization$json = {
  '1': 'Organization',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.OrganizationId',
      '10': 'id'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.OrganizationProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `Organization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List organizationDescriptor = $convert.base64Decode(
    'CgxPcmdhbml6YXRpb24SMwoCaWQYASABKAsyIy5waXhlbHRyYWNlLnR5cGVzLnYxLk9yZ2FuaX'
    'phdGlvbklkUgJpZBI7CgVwcm9wcxgCIAEoCzIlLnBpeGVsdHJhY2UubWdtdC52MS5Pcmdhbml6'
    'YXRpb25Qcm9wc1IFcHJvcHM=');

@$core.Deprecated('Use organizationPropsDescriptor instead')
const OrganizationProps$json = {
  '1': 'OrganizationProps',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `OrganizationProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List organizationPropsDescriptor = $convert
    .base64Decode('ChFPcmdhbml6YXRpb25Qcm9wcxISCgRuYW1lGAEgASgJUgRuYW1l');

const $core.Map<$core.String, $core.dynamic> OrganizationServiceBase$json = {
  '1': 'OrganizationService',
  '2': [
    {
      '1': 'CreateOrganization',
      '2': '.pixeltrace.mgmt.v1.CreateOrganizationRequest',
      '3': '.pixeltrace.mgmt.v1.CreateOrganizationResponse'
    },
    {
      '1': 'GetOrganization',
      '2': '.pixeltrace.mgmt.v1.GetOrganizationRequest',
      '3': '.pixeltrace.mgmt.v1.GetOrganizationResponse'
    },
    {
      '1': 'UpdateOrganization',
      '2': '.pixeltrace.mgmt.v1.UpdateOrganizationRequest',
      '3': '.pixeltrace.mgmt.v1.UpdateOrganizationResponse'
    },
    {
      '1': 'DeleteOrganization',
      '2': '.pixeltrace.mgmt.v1.DeleteOrganizationRequest',
      '3': '.pixeltrace.mgmt.v1.DeleteOrganizationResponse'
    },
    {
      '1': 'ListProjects',
      '2': '.pixeltrace.mgmt.v1.ListProjectsRequest',
      '3': '.pixeltrace.mgmt.v1.ListProjectsResponse'
    },
  ],
};

@$core.Deprecated('Use organizationServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    OrganizationServiceBase$messageJson = {
  '.pixeltrace.mgmt.v1.CreateOrganizationRequest':
      CreateOrganizationRequest$json,
  '.pixeltrace.mgmt.v1.OrganizationProps': OrganizationProps$json,
  '.pixeltrace.mgmt.v1.CreateOrganizationResponse':
      CreateOrganizationResponse$json,
  '.pixeltrace.types.v1.OrganizationId': $0.OrganizationId$json,
  '.pixeltrace.mgmt.v1.GetOrganizationRequest': GetOrganizationRequest$json,
  '.pixeltrace.mgmt.v1.GetOrganizationResponse': GetOrganizationResponse$json,
  '.pixeltrace.mgmt.v1.Organization': Organization$json,
  '.pixeltrace.mgmt.v1.UpdateOrganizationRequest':
      UpdateOrganizationRequest$json,
  '.google.protobuf.FieldMask': $1.FieldMask$json,
  '.pixeltrace.mgmt.v1.UpdateOrganizationResponse':
      UpdateOrganizationResponse$json,
  '.pixeltrace.mgmt.v1.DeleteOrganizationRequest':
      DeleteOrganizationRequest$json,
  '.pixeltrace.mgmt.v1.DeleteOrganizationResponse':
      DeleteOrganizationResponse$json,
  '.pixeltrace.mgmt.v1.ListProjectsRequest': ListProjectsRequest$json,
  '.pixeltrace.mgmt.v1.PageRequest': $2.PageRequest$json,
  '.pixeltrace.mgmt.v1.ListProjectsResponse': ListProjectsResponse$json,
  '.pixeltrace.mgmt.v1.Project': $3.Project$json,
  '.pixeltrace.types.v1.ProjectId': $0.ProjectId$json,
  '.pixeltrace.mgmt.v1.ProjectProps': $3.ProjectProps$json,
  '.pixeltrace.mgmt.v1.PageResponse': $2.PageResponse$json,
};

/// Descriptor for `OrganizationService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List organizationServiceDescriptor = $convert.base64Decode(
    'ChNPcmdhbml6YXRpb25TZXJ2aWNlEnMKEkNyZWF0ZU9yZ2FuaXphdGlvbhItLnBpeGVsdHJhY2'
    'UubWdtdC52MS5DcmVhdGVPcmdhbml6YXRpb25SZXF1ZXN0Gi4ucGl4ZWx0cmFjZS5tZ210LnYx'
    'LkNyZWF0ZU9yZ2FuaXphdGlvblJlc3BvbnNlEmoKD0dldE9yZ2FuaXphdGlvbhIqLnBpeGVsdH'
    'JhY2UubWdtdC52MS5HZXRPcmdhbml6YXRpb25SZXF1ZXN0GisucGl4ZWx0cmFjZS5tZ210LnYx'
    'LkdldE9yZ2FuaXphdGlvblJlc3BvbnNlEnMKElVwZGF0ZU9yZ2FuaXphdGlvbhItLnBpeGVsdH'
    'JhY2UubWdtdC52MS5VcGRhdGVPcmdhbml6YXRpb25SZXF1ZXN0Gi4ucGl4ZWx0cmFjZS5tZ210'
    'LnYxLlVwZGF0ZU9yZ2FuaXphdGlvblJlc3BvbnNlEnMKEkRlbGV0ZU9yZ2FuaXphdGlvbhItLn'
    'BpeGVsdHJhY2UubWdtdC52MS5EZWxldGVPcmdhbml6YXRpb25SZXF1ZXN0Gi4ucGl4ZWx0cmFj'
    'ZS5tZ210LnYxLkRlbGV0ZU9yZ2FuaXphdGlvblJlc3BvbnNlEmEKDExpc3RQcm9qZWN0cxInLn'
    'BpeGVsdHJhY2UubWdtdC52MS5MaXN0UHJvamVjdHNSZXF1ZXN0GigucGl4ZWx0cmFjZS5tZ210'
    'LnYxLkxpc3RQcm9qZWN0c1Jlc3BvbnNl');
