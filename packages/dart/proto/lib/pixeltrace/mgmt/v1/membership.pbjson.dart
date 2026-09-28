// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/membership.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../../google/protobuf/field_mask.pbjson.dart' as $1;
import '../../types/v1/types.pbjson.dart' as $0;
import 'types.pbjson.dart' as $2;

@$core.Deprecated('Use roleDescriptor instead')
const Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'ROLE_UNSPECIFIED', '2': 0},
    {'1': 'ROLE_VIEWER', '2': 1},
    {'1': 'ROLE_MEMBER', '2': 2},
    {'1': 'ROLE_ADMIN', '2': 3},
    {'1': 'ROLE_OWNER', '2': 4},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode(
    'CgRSb2xlEhQKEFJPTEVfVU5TUEVDSUZJRUQQABIPCgtST0xFX1ZJRVdFUhABEg8KC1JPTEVfTU'
    'VNQkVSEAISDgoKUk9MRV9BRE1JThADEg4KClJPTEVfT1dORVIQBA==');

@$core.Deprecated('Use membershipKeyDescriptor instead')
const MembershipKey$json = {
  '1': 'MembershipKey',
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
      '1': 'user_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.UserId',
      '10': 'userId'
    },
  ],
};

/// Descriptor for `MembershipKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List membershipKeyDescriptor = $convert.base64Decode(
    'Cg1NZW1iZXJzaGlwS2V5EjoKBm9yZ19pZBgBIAEoCzIjLnBpeGVsdHJhY2UudHlwZXMudjEuT3'
    'JnYW5pemF0aW9uSWRSBW9yZ0lkEjQKB3VzZXJfaWQYAiABKAsyGy5waXhlbHRyYWNlLnR5cGVz'
    'LnYxLlVzZXJJZFIGdXNlcklk');

@$core.Deprecated('Use membershipDescriptor instead')
const Membership$json = {
  '1': 'Membership',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.MembershipKey',
      '10': 'key'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.MembershipProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `Membership`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List membershipDescriptor = $convert.base64Decode(
    'CgpNZW1iZXJzaGlwEjMKA2tleRgBIAEoCzIhLnBpeGVsdHJhY2UubWdtdC52MS5NZW1iZXJzaG'
    'lwS2V5UgNrZXkSOQoFcHJvcHMYAiABKAsyIy5waXhlbHRyYWNlLm1nbXQudjEuTWVtYmVyc2hp'
    'cFByb3BzUgVwcm9wcw==');

@$core.Deprecated('Use createMembershipRequestDescriptor instead')
const CreateMembershipRequest$json = {
  '1': 'CreateMembershipRequest',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.MembershipKey',
      '10': 'key'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.MembershipProps',
      '10': 'props'
    },
  ],
};

/// Descriptor for `CreateMembershipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMembershipRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVNZW1iZXJzaGlwUmVxdWVzdBIzCgNrZXkYASABKAsyIS5waXhlbHRyYWNlLm1nbX'
    'QudjEuTWVtYmVyc2hpcEtleVIDa2V5EjkKBXByb3BzGAIgASgLMiMucGl4ZWx0cmFjZS5tZ210'
    'LnYxLk1lbWJlcnNoaXBQcm9wc1IFcHJvcHM=');

@$core.Deprecated('Use createMembershipResponseDescriptor instead')
const CreateMembershipResponse$json = {
  '1': 'CreateMembershipResponse',
  '2': [
    {
      '1': 'membership',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Membership',
      '10': 'membership'
    },
  ],
};

/// Descriptor for `CreateMembershipResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMembershipResponseDescriptor =
    $convert.base64Decode(
        'ChhDcmVhdGVNZW1iZXJzaGlwUmVzcG9uc2USPgoKbWVtYmVyc2hpcBgBIAEoCzIeLnBpeGVsdH'
        'JhY2UubWdtdC52MS5NZW1iZXJzaGlwUgptZW1iZXJzaGlw');

@$core.Deprecated('Use getMembershipRequestDescriptor instead')
const GetMembershipRequest$json = {
  '1': 'GetMembershipRequest',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.MembershipKey',
      '10': 'key'
    },
  ],
};

/// Descriptor for `GetMembershipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMembershipRequestDescriptor = $convert.base64Decode(
    'ChRHZXRNZW1iZXJzaGlwUmVxdWVzdBIzCgNrZXkYASABKAsyIS5waXhlbHRyYWNlLm1nbXQudj'
    'EuTWVtYmVyc2hpcEtleVIDa2V5');

@$core.Deprecated('Use getMembershipResponseDescriptor instead')
const GetMembershipResponse$json = {
  '1': 'GetMembershipResponse',
  '2': [
    {
      '1': 'membership',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Membership',
      '10': 'membership'
    },
  ],
};

/// Descriptor for `GetMembershipResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMembershipResponseDescriptor = $convert.base64Decode(
    'ChVHZXRNZW1iZXJzaGlwUmVzcG9uc2USPgoKbWVtYmVyc2hpcBgBIAEoCzIeLnBpeGVsdHJhY2'
    'UubWdtdC52MS5NZW1iZXJzaGlwUgptZW1iZXJzaGlw');

@$core.Deprecated('Use updateMembershipRequestDescriptor instead')
const UpdateMembershipRequest$json = {
  '1': 'UpdateMembershipRequest',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.MembershipKey',
      '10': 'key'
    },
    {
      '1': 'props',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.MembershipProps',
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

/// Descriptor for `UpdateMembershipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMembershipRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVNZW1iZXJzaGlwUmVxdWVzdBIzCgNrZXkYASABKAsyIS5waXhlbHRyYWNlLm1nbX'
    'QudjEuTWVtYmVyc2hpcEtleVIDa2V5EjkKBXByb3BzGAIgASgLMiMucGl4ZWx0cmFjZS5tZ210'
    'LnYxLk1lbWJlcnNoaXBQcm9wc1IFcHJvcHMSOwoLdXBkYXRlX21hc2sYAyABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuRmllbGRNYXNrUgp1cGRhdGVNYXNr');

@$core.Deprecated('Use updateMembershipResponseDescriptor instead')
const UpdateMembershipResponse$json = {
  '1': 'UpdateMembershipResponse',
  '2': [
    {
      '1': 'membership',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Membership',
      '10': 'membership'
    },
  ],
};

/// Descriptor for `UpdateMembershipResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMembershipResponseDescriptor =
    $convert.base64Decode(
        'ChhVcGRhdGVNZW1iZXJzaGlwUmVzcG9uc2USPgoKbWVtYmVyc2hpcBgBIAEoCzIeLnBpeGVsdH'
        'JhY2UubWdtdC52MS5NZW1iZXJzaGlwUgptZW1iZXJzaGlw');

@$core.Deprecated('Use deleteMembershipRequestDescriptor instead')
const DeleteMembershipRequest$json = {
  '1': 'DeleteMembershipRequest',
  '2': [
    {
      '1': 'key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.MembershipKey',
      '10': 'key'
    },
  ],
};

/// Descriptor for `DeleteMembershipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMembershipRequestDescriptor =
    $convert.base64Decode(
        'ChdEZWxldGVNZW1iZXJzaGlwUmVxdWVzdBIzCgNrZXkYASABKAsyIS5waXhlbHRyYWNlLm1nbX'
        'QudjEuTWVtYmVyc2hpcEtleVIDa2V5');

@$core.Deprecated('Use deleteMembershipResponseDescriptor instead')
const DeleteMembershipResponse$json = {
  '1': 'DeleteMembershipResponse',
};

/// Descriptor for `DeleteMembershipResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMembershipResponseDescriptor =
    $convert.base64Decode('ChhEZWxldGVNZW1iZXJzaGlwUmVzcG9uc2U=');

@$core.Deprecated('Use listMembershipsRequestDescriptor instead')
const ListMembershipsRequest$json = {
  '1': 'ListMembershipsRequest',
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

/// Descriptor for `ListMembershipsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMembershipsRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0TWVtYmVyc2hpcHNSZXF1ZXN0EjoKBm9yZ19pZBgBIAEoCzIjLnBpeGVsdHJhY2UudH'
    'lwZXMudjEuT3JnYW5pemF0aW9uSWRSBW9yZ0lkEjMKBHBhZ2UYAiABKAsyHy5waXhlbHRyYWNl'
    'Lm1nbXQudjEuUGFnZVJlcXVlc3RSBHBhZ2U=');

@$core.Deprecated('Use listMembershipsResponseDescriptor instead')
const ListMembershipsResponse$json = {
  '1': 'ListMembershipsResponse',
  '2': [
    {
      '1': 'memberships',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.mgmt.v1.Membership',
      '10': 'memberships'
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

/// Descriptor for `ListMembershipsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMembershipsResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0TWVtYmVyc2hpcHNSZXNwb25zZRJACgttZW1iZXJzaGlwcxgBIAMoCzIeLnBpeGVsdH'
    'JhY2UubWdtdC52MS5NZW1iZXJzaGlwUgttZW1iZXJzaGlwcxI0CgRwYWdlGAIgASgLMiAucGl4'
    'ZWx0cmFjZS5tZ210LnYxLlBhZ2VSZXNwb25zZVIEcGFnZQ==');

@$core.Deprecated('Use membershipPropsDescriptor instead')
const MembershipProps$json = {
  '1': 'MembershipProps',
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

/// Descriptor for `MembershipProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List membershipPropsDescriptor = $convert.base64Decode(
    'Cg9NZW1iZXJzaGlwUHJvcHMSLAoEcm9sZRgBIAEoDjIYLnBpeGVsdHJhY2UubWdtdC52MS5Sb2'
    'xlUgRyb2xl');

const $core.Map<$core.String, $core.dynamic> MembershipServiceBase$json = {
  '1': 'MembershipService',
  '2': [
    {
      '1': 'CreateMembership',
      '2': '.pixeltrace.mgmt.v1.CreateMembershipRequest',
      '3': '.pixeltrace.mgmt.v1.CreateMembershipResponse'
    },
    {
      '1': 'GetMembership',
      '2': '.pixeltrace.mgmt.v1.GetMembershipRequest',
      '3': '.pixeltrace.mgmt.v1.GetMembershipResponse'
    },
    {
      '1': 'UpdateMembership',
      '2': '.pixeltrace.mgmt.v1.UpdateMembershipRequest',
      '3': '.pixeltrace.mgmt.v1.UpdateMembershipResponse'
    },
    {
      '1': 'DeleteMembership',
      '2': '.pixeltrace.mgmt.v1.DeleteMembershipRequest',
      '3': '.pixeltrace.mgmt.v1.DeleteMembershipResponse'
    },
    {
      '1': 'ListMemberships',
      '2': '.pixeltrace.mgmt.v1.ListMembershipsRequest',
      '3': '.pixeltrace.mgmt.v1.ListMembershipsResponse'
    },
  ],
};

@$core.Deprecated('Use membershipServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    MembershipServiceBase$messageJson = {
  '.pixeltrace.mgmt.v1.CreateMembershipRequest': CreateMembershipRequest$json,
  '.pixeltrace.mgmt.v1.MembershipKey': MembershipKey$json,
  '.pixeltrace.types.v1.OrganizationId': $0.OrganizationId$json,
  '.pixeltrace.types.v1.UserId': $0.UserId$json,
  '.pixeltrace.mgmt.v1.MembershipProps': MembershipProps$json,
  '.pixeltrace.mgmt.v1.CreateMembershipResponse': CreateMembershipResponse$json,
  '.pixeltrace.mgmt.v1.Membership': Membership$json,
  '.pixeltrace.mgmt.v1.GetMembershipRequest': GetMembershipRequest$json,
  '.pixeltrace.mgmt.v1.GetMembershipResponse': GetMembershipResponse$json,
  '.pixeltrace.mgmt.v1.UpdateMembershipRequest': UpdateMembershipRequest$json,
  '.google.protobuf.FieldMask': $1.FieldMask$json,
  '.pixeltrace.mgmt.v1.UpdateMembershipResponse': UpdateMembershipResponse$json,
  '.pixeltrace.mgmt.v1.DeleteMembershipRequest': DeleteMembershipRequest$json,
  '.pixeltrace.mgmt.v1.DeleteMembershipResponse': DeleteMembershipResponse$json,
  '.pixeltrace.mgmt.v1.ListMembershipsRequest': ListMembershipsRequest$json,
  '.pixeltrace.mgmt.v1.PageRequest': $2.PageRequest$json,
  '.pixeltrace.mgmt.v1.ListMembershipsResponse': ListMembershipsResponse$json,
  '.pixeltrace.mgmt.v1.PageResponse': $2.PageResponse$json,
};

/// Descriptor for `MembershipService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List membershipServiceDescriptor = $convert.base64Decode(
    'ChFNZW1iZXJzaGlwU2VydmljZRJtChBDcmVhdGVNZW1iZXJzaGlwEisucGl4ZWx0cmFjZS5tZ2'
    '10LnYxLkNyZWF0ZU1lbWJlcnNoaXBSZXF1ZXN0GiwucGl4ZWx0cmFjZS5tZ210LnYxLkNyZWF0'
    'ZU1lbWJlcnNoaXBSZXNwb25zZRJkCg1HZXRNZW1iZXJzaGlwEigucGl4ZWx0cmFjZS5tZ210Ln'
    'YxLkdldE1lbWJlcnNoaXBSZXF1ZXN0GikucGl4ZWx0cmFjZS5tZ210LnYxLkdldE1lbWJlcnNo'
    'aXBSZXNwb25zZRJtChBVcGRhdGVNZW1iZXJzaGlwEisucGl4ZWx0cmFjZS5tZ210LnYxLlVwZG'
    'F0ZU1lbWJlcnNoaXBSZXF1ZXN0GiwucGl4ZWx0cmFjZS5tZ210LnYxLlVwZGF0ZU1lbWJlcnNo'
    'aXBSZXNwb25zZRJtChBEZWxldGVNZW1iZXJzaGlwEisucGl4ZWx0cmFjZS5tZ210LnYxLkRlbG'
    'V0ZU1lbWJlcnNoaXBSZXF1ZXN0GiwucGl4ZWx0cmFjZS5tZ210LnYxLkRlbGV0ZU1lbWJlcnNo'
    'aXBSZXNwb25zZRJqCg9MaXN0TWVtYmVyc2hpcHMSKi5waXhlbHRyYWNlLm1nbXQudjEuTGlzdE'
    '1lbWJlcnNoaXBzUmVxdWVzdBorLnBpeGVsdHJhY2UubWdtdC52MS5MaXN0TWVtYmVyc2hpcHNS'
    'ZXNwb25zZQ==');
