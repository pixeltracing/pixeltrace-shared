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

import '../../../google/rpc/code.pbenum.dart' as $0;
import 'error.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'error.pbenum.dart';

/// The domain-specific error reasons an RPC may return, attached to a method as
/// an option.
class MethodErrors extends $pb.GeneratedMessage {
  factory MethodErrors({
    $core.Iterable<ErrorReason>? reasons,
  }) {
    final result = create();
    if (reasons != null) result.reasons.addAll(reasons);
    return result;
  }

  MethodErrors._();

  factory MethodErrors.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MethodErrors.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MethodErrors',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.error.v1'),
      createEmptyInstance: create)
    ..pc<ErrorReason>(1, _omitFieldNames ? '' : 'reasons', $pb.PbFieldType.KE,
        valueOf: ErrorReason.valueOf,
        enumValues: ErrorReason.values,
        defaultEnumValue: ErrorReason.UNSPECIFIED)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MethodErrors clone() => MethodErrors()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MethodErrors copyWith(void Function(MethodErrors) updates) =>
      super.copyWith((message) => updates(message as MethodErrors))
          as MethodErrors;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MethodErrors create() => MethodErrors._();
  @$core.override
  MethodErrors createEmptyInstance() => create();
  static $pb.PbList<MethodErrors> createRepeated() =>
      $pb.PbList<MethodErrors>();
  @$core.pragma('dart2js:noInline')
  static MethodErrors getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MethodErrors>(create);
  static MethodErrors? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ErrorReason> get reasons => $_getList(0);
}

class Error {
  static final errors = $pb.Extension<MethodErrors>(
      _omitMessageNames ? '' : 'google.protobuf.MethodOptions',
      _omitFieldNames ? '' : 'errors',
      50001,
      $pb.PbFieldType.OM,
      defaultOrMaker: MethodErrors.getDefault,
      subBuilder: MethodErrors.create);
  static final canonicalCode = $pb.Extension<$0.Code>(
      _omitMessageNames ? '' : 'google.protobuf.EnumValueOptions',
      _omitFieldNames ? '' : 'canonicalCode',
      50002,
      $pb.PbFieldType.OE,
      defaultOrMaker: $0.Code.OK,
      valueOf: $0.Code.valueOf,
      enumValues: $0.Code.values);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(errors);
    registry.add(canonicalCode);
  }
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
