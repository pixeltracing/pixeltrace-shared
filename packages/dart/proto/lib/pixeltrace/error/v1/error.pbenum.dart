// This is a generated file - do not edit.
//
// Generated from pixeltrace/error/v1/error.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Pixeltrace domain error reasons. Adding a value is an API change, reviewed
/// like a new field: clients depend on these.
class ErrorReason extends $pb.ProtobufEnum {
  static const ErrorReason UNSPECIFIED =
      ErrorReason._(0, _omitEnumNames ? '' : 'UNSPECIFIED');

  /// The supplied site key is not a well-formed key.
  static const ErrorReason SITE_KEY_MALFORMED =
      ErrorReason._(1, _omitEnumNames ? '' : 'SITE_KEY_MALFORMED');

  static const $core.List<ErrorReason> values = <ErrorReason>[
    UNSPECIFIED,
    SITE_KEY_MALFORMED,
  ];

  static final $core.List<ErrorReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ErrorReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ErrorReason._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
