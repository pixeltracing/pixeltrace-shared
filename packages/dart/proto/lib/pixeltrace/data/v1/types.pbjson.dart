// This is a generated file - do not edit.
//
// Generated from pixeltrace/data/v1/types.proto.

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

@$core.Deprecated('Use dataResidencyDescriptor instead')
const DataResidency$json = {
  '1': 'DataResidency',
  '2': [
    {'1': 'DATA_RESIDENCY_UNSPECIFIED', '2': 0},
    {'1': 'DATA_RESIDENCY_US', '2': 1},
  ],
};

/// Descriptor for `DataResidency`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dataResidencyDescriptor = $convert.base64Decode(
    'Cg1EYXRhUmVzaWRlbmN5Eh4KGkRBVEFfUkVTSURFTkNZX1VOU1BFQ0lGSUVEEAASFQoRREFUQV'
    '9SRVNJREVOQ1lfVVMQAQ==');

@$core.Deprecated('Use storageBackendDescriptor instead')
const StorageBackend$json = {
  '1': 'StorageBackend',
  '2': [
    {'1': 'STORAGE_BACKEND_UNSPECIFIED', '2': 0},
    {'1': 'STORAGE_BACKEND_MANAGED', '2': 1},
    {'1': 'STORAGE_BACKEND_BYOB', '2': 2},
  ],
};

/// Descriptor for `StorageBackend`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List storageBackendDescriptor = $convert.base64Decode(
    'Cg5TdG9yYWdlQmFja2VuZBIfChtTVE9SQUdFX0JBQ0tFTkRfVU5TUEVDSUZJRUQQABIbChdTVE'
    '9SQUdFX0JBQ0tFTkRfTUFOQUdFRBABEhgKFFNUT1JBR0VfQkFDS0VORF9CWU9CEAI=');
