// This is a generated file - do not edit.
//
// Generated from pixeltrace/data/v1/types.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Where a project's data lives. Fixed at creation.
class DataResidency extends $pb.ProtobufEnum {
  static const DataResidency DATA_RESIDENCY_UNSPECIFIED =
      DataResidency._(0, _omitEnumNames ? '' : 'DATA_RESIDENCY_UNSPECIFIED');

  /// United States.
  static const DataResidency DATA_RESIDENCY_US =
      DataResidency._(1, _omitEnumNames ? '' : 'DATA_RESIDENCY_US');

  static const $core.List<DataResidency> values = <DataResidency>[
    DATA_RESIDENCY_UNSPECIFIED,
    DATA_RESIDENCY_US,
  ];

  static final $core.List<DataResidency?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static DataResidency? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DataResidency._(super.value, super.name);
}

/// Which backend holds a project's captured data. Fixed at creation.
class StorageBackend extends $pb.ProtobufEnum {
  static const StorageBackend STORAGE_BACKEND_UNSPECIFIED =
      StorageBackend._(0, _omitEnumNames ? '' : 'STORAGE_BACKEND_UNSPECIFIED');

  /// Pixeltrace-hosted bucket.
  static const StorageBackend STORAGE_BACKEND_MANAGED =
      StorageBackend._(1, _omitEnumNames ? '' : 'STORAGE_BACKEND_MANAGED');

  /// Customer-owned bucket (bring your own bucket).
  static const StorageBackend STORAGE_BACKEND_BYOB =
      StorageBackend._(2, _omitEnumNames ? '' : 'STORAGE_BACKEND_BYOB');

  static const $core.List<StorageBackend> values = <StorageBackend>[
    STORAGE_BACKEND_UNSPECIFIED,
    STORAGE_BACKEND_MANAGED,
    STORAGE_BACKEND_BYOB,
  ];

  static final $core.List<StorageBackend?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static StorageBackend? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StorageBackend._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
