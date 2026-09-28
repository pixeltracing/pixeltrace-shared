// This is a generated file - do not edit.
//
// Generated from pixeltrace/coord/v1/upload.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class EndOfUpload_Reason extends $pb.ProtobufEnum {
  static const EndOfUpload_Reason UNSPECIFIED =
      EndOfUpload_Reason._(0, _omitEnumNames ? '' : 'UNSPECIFIED');

  /// Finalize now: everything this session recorded has been sent.
  static const EndOfUpload_Reason COMPLETE =
      EndOfUpload_Reason._(1, _omitEnumNames ? '' : 'COMPLETE');

  /// The page is going away with fragments still unsent. Flush and sleep, as
  /// for a socket that closed without an end frame; the idle timeout
  /// finalizes if nobody resumes.
  static const EndOfUpload_Reason PAGE_HIDDEN =
      EndOfUpload_Reason._(2, _omitEnumNames ? '' : 'PAGE_HIDDEN');

  static const $core.List<EndOfUpload_Reason> values = <EndOfUpload_Reason>[
    UNSPECIFIED,
    COMPLETE,
    PAGE_HIDDEN,
  ];

  static final $core.List<EndOfUpload_Reason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static EndOfUpload_Reason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EndOfUpload_Reason._(super.value, super.name);
}

/// Why one was asked for. One mechanism, three triggers; the client reports
/// the split so the cost of each is measurable.
class KeyframeRequest_Reason extends $pb.ProtobufEnum {
  static const KeyframeRequest_Reason UNSPECIFIED =
      KeyframeRequest_Reason._(0, _omitEnumNames ? '' : 'UNSPECIFIED');

  /// A viewer joined and has nothing to decode from.
  static const KeyframeRequest_Reason VIEWER_JOINED =
      KeyframeRequest_Reason._(1, _omitEnumNames ? '' : 'VIEWER_JOINED');

  /// The publisher reconnected, and the next segment must open on one.
  static const KeyframeRequest_Reason PUBLISHER_RESUMED =
      KeyframeRequest_Reason._(2, _omitEnumNames ? '' : 'PUBLISHER_RESUMED');

  /// The open segment hit its ceiling with no keyframe to close on.
  static const KeyframeRequest_Reason SEGMENT_OVERDUE =
      KeyframeRequest_Reason._(3, _omitEnumNames ? '' : 'SEGMENT_OVERDUE');

  static const $core.List<KeyframeRequest_Reason> values =
      <KeyframeRequest_Reason>[
    UNSPECIFIED,
    VIEWER_JOINED,
    PUBLISHER_RESUMED,
    SEGMENT_OVERDUE,
  ];

  static final $core.List<KeyframeRequest_Reason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static KeyframeRequest_Reason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const KeyframeRequest_Reason._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
