// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/project.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Distinguishes user-created tags from the builtin/"system" tags.
class ProjectTagKind extends $pb.ProtobufEnum {
  static const ProjectTagKind PROJECT_TAG_KIND_UNSPECIFIED =
      ProjectTagKind._(0, _omitEnumNames ? '' : 'PROJECT_TAG_KIND_UNSPECIFIED');
  static const ProjectTagKind PROJECT_TAG_KIND_CUSTOM =
      ProjectTagKind._(1, _omitEnumNames ? '' : 'PROJECT_TAG_KIND_CUSTOM');
  static const ProjectTagKind PROJECT_TAG_KIND_PINNED =
      ProjectTagKind._(2, _omitEnumNames ? '' : 'PROJECT_TAG_KIND_PINNED');
  static const ProjectTagKind PROJECT_TAG_KIND_FLAGGED =
      ProjectTagKind._(3, _omitEnumNames ? '' : 'PROJECT_TAG_KIND_FLAGGED');

  static const $core.List<ProjectTagKind> values = <ProjectTagKind>[
    PROJECT_TAG_KIND_UNSPECIFIED,
    PROJECT_TAG_KIND_CUSTOM,
    PROJECT_TAG_KIND_PINNED,
    PROJECT_TAG_KIND_FLAGGED,
  ];

  static final $core.List<ProjectTagKind?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ProjectTagKind? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProjectTagKind._(super.value, super.name);
}

/// The palette a project tag renders in.
class ProjectTagColor extends $pb.ProtobufEnum {
  static const ProjectTagColor PROJECT_TAG_COLOR_UNSPECIFIED =
      ProjectTagColor._(
          0, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_UNSPECIFIED');
  static const ProjectTagColor PROJECT_TAG_COLOR_NONE =
      ProjectTagColor._(1, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_NONE');
  static const ProjectTagColor PROJECT_TAG_COLOR_BLACK =
      ProjectTagColor._(2, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_BLACK');
  static const ProjectTagColor PROJECT_TAG_COLOR_WHITE =
      ProjectTagColor._(3, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_WHITE');
  static const ProjectTagColor PROJECT_TAG_COLOR_GRAY =
      ProjectTagColor._(4, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_GRAY');
  static const ProjectTagColor PROJECT_TAG_COLOR_RED =
      ProjectTagColor._(5, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_RED');
  static const ProjectTagColor PROJECT_TAG_COLOR_ORANGE =
      ProjectTagColor._(6, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_ORANGE');
  static const ProjectTagColor PROJECT_TAG_COLOR_YELLOW =
      ProjectTagColor._(7, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_YELLOW');
  static const ProjectTagColor PROJECT_TAG_COLOR_GREEN =
      ProjectTagColor._(8, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_GREEN');
  static const ProjectTagColor PROJECT_TAG_COLOR_CYAN =
      ProjectTagColor._(9, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_CYAN');
  static const ProjectTagColor PROJECT_TAG_COLOR_BLUE =
      ProjectTagColor._(10, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_BLUE');
  static const ProjectTagColor PROJECT_TAG_COLOR_INDIGO =
      ProjectTagColor._(11, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_INDIGO');
  static const ProjectTagColor PROJECT_TAG_COLOR_PURPLE =
      ProjectTagColor._(12, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_PURPLE');
  static const ProjectTagColor PROJECT_TAG_COLOR_MAGENTA =
      ProjectTagColor._(13, _omitEnumNames ? '' : 'PROJECT_TAG_COLOR_MAGENTA');

  static const $core.List<ProjectTagColor> values = <ProjectTagColor>[
    PROJECT_TAG_COLOR_UNSPECIFIED,
    PROJECT_TAG_COLOR_NONE,
    PROJECT_TAG_COLOR_BLACK,
    PROJECT_TAG_COLOR_WHITE,
    PROJECT_TAG_COLOR_GRAY,
    PROJECT_TAG_COLOR_RED,
    PROJECT_TAG_COLOR_ORANGE,
    PROJECT_TAG_COLOR_YELLOW,
    PROJECT_TAG_COLOR_GREEN,
    PROJECT_TAG_COLOR_CYAN,
    PROJECT_TAG_COLOR_BLUE,
    PROJECT_TAG_COLOR_INDIGO,
    PROJECT_TAG_COLOR_PURPLE,
    PROJECT_TAG_COLOR_MAGENTA,
  ];

  static final $core.List<ProjectTagColor?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 13);
  static ProjectTagColor? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProjectTagColor._(super.value, super.name);
}

/// Which path a session's live media travels, and so which live viewer a client
/// should use.
class LiveTransport extends $pb.ProtobufEnum {
  static const LiveTransport LIVE_TRANSPORT_UNSPECIFIED =
      LiveTransport._(0, _omitEnumNames ? '' : 'LIVE_TRANSPORT_UNSPECIFIED');

  /// Published into the media relay (SFU); watched over WebRTC.
  static const LiveTransport LIVE_TRANSPORT_SFU =
      LiveTransport._(1, _omitEnumNames ? '' : 'LIVE_TRANSPORT_SFU');

  /// Uploaded over a WebSocket; watched over a WebSocket relay.
  static const LiveTransport LIVE_TRANSPORT_UPLOAD =
      LiveTransport._(2, _omitEnumNames ? '' : 'LIVE_TRANSPORT_UPLOAD');

  static const $core.List<LiveTransport> values = <LiveTransport>[
    LIVE_TRANSPORT_UNSPECIFIED,
    LIVE_TRANSPORT_SFU,
    LIVE_TRANSPORT_UPLOAD,
  ];

  static final $core.List<LiveTransport?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static LiveTransport? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LiveTransport._(super.value, super.name);
}

/// Lifecycle state of a site key.
class ProjectSiteKey_Status extends $pb.ProtobufEnum {
  static const ProjectSiteKey_Status UNSPECIFIED =
      ProjectSiteKey_Status._(0, _omitEnumNames ? '' : 'UNSPECIFIED');

  /// The key may be used to authorize ingest traffic.
  static const ProjectSiteKey_Status ACTIVE =
      ProjectSiteKey_Status._(1, _omitEnumNames ? '' : 'ACTIVE');

  /// The key has been revoked and must be rejected.
  static const ProjectSiteKey_Status REVOKED =
      ProjectSiteKey_Status._(2, _omitEnumNames ? '' : 'REVOKED');

  static const $core.List<ProjectSiteKey_Status> values =
      <ProjectSiteKey_Status>[
    UNSPECIFIED,
    ACTIVE,
    REVOKED,
  ];

  static final $core.List<ProjectSiteKey_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ProjectSiteKey_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProjectSiteKey_Status._(super.value, super.name);
}

/// Lifecycle state of a session's recording.
class Session_Status extends $pb.ProtobufEnum {
  static const Session_Status UNSPECIFIED =
      Session_Status._(0, _omitEnumNames ? '' : 'UNSPECIFIED');

  /// Media is still being captured; the recording is not yet complete.
  static const Session_Status RECORDING =
      Session_Status._(1, _omitEnumNames ? '' : 'RECORDING');

  /// Capture finished and the recording is available for playback.
  static const Session_Status READY =
      Session_Status._(2, _omitEnumNames ? '' : 'READY');

  static const $core.List<Session_Status> values = <Session_Status>[
    UNSPECIFIED,
    RECORDING,
    READY,
  ];

  static final $core.List<Session_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Session_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Session_Status._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
