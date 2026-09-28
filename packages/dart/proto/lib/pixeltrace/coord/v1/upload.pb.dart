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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'upload.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'upload.pbenum.dart';

enum UploadFrame_Frame { init, fragment, end, notSet }

/// Publisher to server.
class UploadFrame extends $pb.GeneratedMessage {
  factory UploadFrame({
    InitSegment? init,
    MediaFragment? fragment,
    EndOfUpload? end,
  }) {
    final result = create();
    if (init != null) result.init = init;
    if (fragment != null) result.fragment = fragment;
    if (end != null) result.end = end;
    return result;
  }

  UploadFrame._();

  factory UploadFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, UploadFrame_Frame> _UploadFrame_FrameByTag =
      {
    1: UploadFrame_Frame.init,
    2: UploadFrame_Frame.fragment,
    3: UploadFrame_Frame.end,
    0: UploadFrame_Frame.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadFrame',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<InitSegment>(1, _omitFieldNames ? '' : 'init',
        subBuilder: InitSegment.create)
    ..aOM<MediaFragment>(2, _omitFieldNames ? '' : 'fragment',
        subBuilder: MediaFragment.create)
    ..aOM<EndOfUpload>(3, _omitFieldNames ? '' : 'end',
        subBuilder: EndOfUpload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadFrame clone() => UploadFrame()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadFrame copyWith(void Function(UploadFrame) updates) =>
      super.copyWith((message) => updates(message as UploadFrame))
          as UploadFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadFrame create() => UploadFrame._();
  @$core.override
  UploadFrame createEmptyInstance() => create();
  static $pb.PbList<UploadFrame> createRepeated() => $pb.PbList<UploadFrame>();
  @$core.pragma('dart2js:noInline')
  static UploadFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadFrame>(create);
  static UploadFrame? _defaultInstance;

  UploadFrame_Frame whichFrame() => _UploadFrame_FrameByTag[$_whichOneof(0)]!;
  void clearFrame() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  InitSegment get init => $_getN(0);
  @$pb.TagNumber(1)
  set init(InitSegment value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInit() => $_has(0);
  @$pb.TagNumber(1)
  void clearInit() => $_clearField(1);
  @$pb.TagNumber(1)
  InitSegment ensureInit() => $_ensure(0);

  @$pb.TagNumber(2)
  MediaFragment get fragment => $_getN(1);
  @$pb.TagNumber(2)
  set fragment(MediaFragment value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFragment() => $_has(1);
  @$pb.TagNumber(2)
  void clearFragment() => $_clearField(2);
  @$pb.TagNumber(2)
  MediaFragment ensureFragment() => $_ensure(1);

  @$pb.TagNumber(3)
  EndOfUpload get end => $_getN(2);
  @$pb.TagNumber(3)
  set end(EndOfUpload value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnd() => $_clearField(3);
  @$pb.TagNumber(3)
  EndOfUpload ensureEnd() => $_ensure(2);
}

/// `ftyp` + `moov`. Sent once, and again on resume or after an encoder rebuild,
/// so it is always a publisher socket's first frame. Also what the server sends
/// a joining viewer.
class InitSegment extends $pb.GeneratedMessage {
  factory InitSegment({
    $core.List<$core.int>? data,
    $core.String? codecs,
    $core.int? width,
    $core.int? height,
    $core.int? protocolVersion,
  }) {
    final result = create();
    if (data != null) result.data = data;
    if (codecs != null) result.codecs = codecs;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    if (protocolVersion != null) result.protocolVersion = protocolVersion;
    return result;
  }

  InitSegment._();

  factory InitSegment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitSegment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitSegment',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'codecs')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'protocolVersion', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitSegment clone() => InitSegment()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitSegment copyWith(void Function(InitSegment) updates) =>
      super.copyWith((message) => updates(message as InitSegment))
          as InitSegment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitSegment create() => InitSegment._();
  @$core.override
  InitSegment createEmptyInstance() => create();
  static $pb.PbList<InitSegment> createRepeated() => $pb.PbList<InitSegment>();
  @$core.pragma('dart2js:noInline')
  static InitSegment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitSegment>(create);
  static InitSegment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => $_clearField(1);

  /// RFC 6381 codec string, e.g. "avc1.64001f". The playlist emits it, and a
  /// viewer needs it to open a SourceBuffer. Reported rather than parsed out of
  /// `moov`, which nothing on the server is equipped to do.
  @$pb.TagNumber(2)
  $core.String get codecs => $_getSZ(1);
  @$pb.TagNumber(2)
  set codecs($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCodecs() => $_has(1);
  @$pb.TagNumber(2)
  void clearCodecs() => $_clearField(2);

  /// Encoded frame size, in pixels.
  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => $_clearField(4);

  /// The envelope version this client speaks. The server refuses one it does
  /// not, which is what stops a stale SDK asset from misreading the protocol.
  /// Unset on the init the server sends a viewer.
  @$pb.TagNumber(5)
  $core.int get protocolVersion => $_getIZ(4);
  @$pb.TagNumber(5)
  set protocolVersion($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasProtocolVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearProtocolVersion() => $_clearField(5);
}

/// One `moof` + `mdat` pair, or one part of one.
class MediaFragment extends $pb.GeneratedMessage {
  factory MediaFragment({
    $fixnum.Int64? sequence,
    $core.int? partIndex,
    $core.int? partCount,
    $core.bool? keyframe,
    $core.int? durationMs,
    $core.List<$core.int>? data,
    $core.Iterable<ChunkFact>? chunks,
  }) {
    final result = create();
    if (sequence != null) result.sequence = sequence;
    if (partIndex != null) result.partIndex = partIndex;
    if (partCount != null) result.partCount = partCount;
    if (keyframe != null) result.keyframe = keyframe;
    if (durationMs != null) result.durationMs = durationMs;
    if (data != null) result.data = data;
    if (chunks != null) result.chunks.addAll(chunks);
    return result;
  }

  MediaFragment._();

  factory MediaFragment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaFragment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaFragment',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sequence', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'partIndex', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'partCount', $pb.PbFieldType.OU3)
    ..aOB(4, _omitFieldNames ? '' : 'keyframe')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'durationMs', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..pc<ChunkFact>(7, _omitFieldNames ? '' : 'chunks', $pb.PbFieldType.PM,
        subBuilder: ChunkFact.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaFragment clone() => MediaFragment()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaFragment copyWith(void Function(MediaFragment) updates) =>
      super.copyWith((message) => updates(message as MediaFragment))
          as MediaFragment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaFragment create() => MediaFragment._();
  @$core.override
  MediaFragment createEmptyInstance() => create();
  static $pb.PbList<MediaFragment> createRepeated() =>
      $pb.PbList<MediaFragment>();
  @$core.pragma('dart2js:noInline')
  static MediaFragment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediaFragment>(create);
  static MediaFragment? _defaultInstance;

  /// Client-assigned, strictly increasing within a session, so a resume can be
  /// reconciled. Every part of a fragment carries the same sequence.
  @$pb.TagNumber(1)
  $fixnum.Int64 get sequence => $_getI64(0);
  @$pb.TagNumber(1)
  set sequence($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSequence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSequence() => $_clearField(1);

  /// 0-based position of this part within the fragment, and how many parts the
  /// whole fragment has (1 when it fits in one message). Parts arrive in order,
  /// and `data` concatenated across them is the fragment.
  @$pb.TagNumber(2)
  $core.int get partIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set partIndex($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPartIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get partCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set partCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPartCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearPartCount() => $_clearField(3);

  /// Whether the fragment opens on a keyframe. Set on part 0.
  @$pb.TagNumber(4)
  $core.bool get keyframe => $_getBF(3);
  @$pb.TagNumber(4)
  set keyframe($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasKeyframe() => $_has(3);
  @$pb.TagNumber(4)
  void clearKeyframe() => $_clearField(4);

  /// Presentation duration, in ms. Set on part 0.
  @$pb.TagNumber(5)
  $core.int get durationMs => $_getIZ(4);
  @$pb.TagNumber(5)
  set durationMs($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDurationMs() => $_has(4);
  @$pb.TagNumber(5)
  void clearDurationMs() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get data => $_getN(5);
  @$pb.TagNumber(6)
  set data($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasData() => $_has(5);
  @$pb.TagNumber(6)
  void clearData() => $_clearField(6);

  /// The encoded chunks inside the whole fragment, for frame measurements. Set
  /// on part 0, and not populated on the frames relayed to a viewer.
  @$pb.TagNumber(7)
  $pb.PbList<ChunkFact> get chunks => $_getList(6);
}

/// One encoded chunk's measurable facts.
class ChunkFact extends $pb.GeneratedMessage {
  factory ChunkFact({
    $core.int? offsetMs,
    $core.int? bytes,
    $core.bool? keyframe,
  }) {
    final result = create();
    if (offsetMs != null) result.offsetMs = offsetMs;
    if (bytes != null) result.bytes = bytes;
    if (keyframe != null) result.keyframe = keyframe;
    return result;
  }

  ChunkFact._();

  factory ChunkFact.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChunkFact.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChunkFact',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'offsetMs', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'bytes', $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'keyframe')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChunkFact clone() => ChunkFact()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChunkFact copyWith(void Function(ChunkFact) updates) =>
      super.copyWith((message) => updates(message as ChunkFact)) as ChunkFact;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChunkFact create() => ChunkFact._();
  @$core.override
  ChunkFact createEmptyInstance() => create();
  static $pb.PbList<ChunkFact> createRepeated() => $pb.PbList<ChunkFact>();
  @$core.pragma('dart2js:noInline')
  static ChunkFact getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkFact>(create);
  static ChunkFact? _defaultInstance;

  /// Presentation offset from the fragment's start, in ms.
  @$pb.TagNumber(1)
  $core.int get offsetMs => $_getIZ(0);
  @$pb.TagNumber(1)
  set offsetMs($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOffsetMs() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffsetMs() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get bytes => $_getIZ(1);
  @$pb.TagNumber(2)
  set bytes($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBytes() => $_has(1);
  @$pb.TagNumber(2)
  void clearBytes() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get keyframe => $_getBF(2);
  @$pb.TagNumber(3)
  set keyframe($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasKeyframe() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeyframe() => $_clearField(3);
}

/// The publisher has nothing more to send on this socket.
class EndOfUpload extends $pb.GeneratedMessage {
  factory EndOfUpload({
    EndOfUpload_Reason? reason,
  }) {
    final result = create();
    if (reason != null) result.reason = reason;
    return result;
  }

  EndOfUpload._();

  factory EndOfUpload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EndOfUpload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndOfUpload',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..e<EndOfUpload_Reason>(
        1, _omitFieldNames ? '' : 'reason', $pb.PbFieldType.OE,
        defaultOrMaker: EndOfUpload_Reason.UNSPECIFIED,
        valueOf: EndOfUpload_Reason.valueOf,
        enumValues: EndOfUpload_Reason.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndOfUpload clone() => EndOfUpload()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndOfUpload copyWith(void Function(EndOfUpload) updates) =>
      super.copyWith((message) => updates(message as EndOfUpload))
          as EndOfUpload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndOfUpload create() => EndOfUpload._();
  @$core.override
  EndOfUpload createEmptyInstance() => create();
  static $pb.PbList<EndOfUpload> createRepeated() => $pb.PbList<EndOfUpload>();
  @$core.pragma('dart2js:noInline')
  static EndOfUpload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndOfUpload>(create);
  static EndOfUpload? _defaultInstance;

  @$pb.TagNumber(1)
  EndOfUpload_Reason get reason => $_getN(0);
  @$pb.TagNumber(1)
  set reason(EndOfUpload_Reason value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => $_clearField(1);
}

enum UploadControlFrame_Frame { ack, keyframeRequest, notSet }

/// Server to publisher.
class UploadControlFrame extends $pb.GeneratedMessage {
  factory UploadControlFrame({
    FragmentAck? ack,
    KeyframeRequest? keyframeRequest,
  }) {
    final result = create();
    if (ack != null) result.ack = ack;
    if (keyframeRequest != null) result.keyframeRequest = keyframeRequest;
    return result;
  }

  UploadControlFrame._();

  factory UploadControlFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadControlFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, UploadControlFrame_Frame>
      _UploadControlFrame_FrameByTag = {
    1: UploadControlFrame_Frame.ack,
    2: UploadControlFrame_Frame.keyframeRequest,
    0: UploadControlFrame_Frame.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadControlFrame',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<FragmentAck>(1, _omitFieldNames ? '' : 'ack',
        subBuilder: FragmentAck.create)
    ..aOM<KeyframeRequest>(2, _omitFieldNames ? '' : 'keyframeRequest',
        subBuilder: KeyframeRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadControlFrame clone() => UploadControlFrame()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadControlFrame copyWith(void Function(UploadControlFrame) updates) =>
      super.copyWith((message) => updates(message as UploadControlFrame))
          as UploadControlFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadControlFrame create() => UploadControlFrame._();
  @$core.override
  UploadControlFrame createEmptyInstance() => create();
  static $pb.PbList<UploadControlFrame> createRepeated() =>
      $pb.PbList<UploadControlFrame>();
  @$core.pragma('dart2js:noInline')
  static UploadControlFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadControlFrame>(create);
  static UploadControlFrame? _defaultInstance;

  UploadControlFrame_Frame whichFrame() =>
      _UploadControlFrame_FrameByTag[$_whichOneof(0)]!;
  void clearFrame() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  FragmentAck get ack => $_getN(0);
  @$pb.TagNumber(1)
  set ack(FragmentAck value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAck() => $_has(0);
  @$pb.TagNumber(1)
  void clearAck() => $_clearField(1);
  @$pb.TagNumber(1)
  FragmentAck ensureAck() => $_ensure(0);

  @$pb.TagNumber(2)
  KeyframeRequest get keyframeRequest => $_getN(1);
  @$pb.TagNumber(2)
  set keyframeRequest(KeyframeRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasKeyframeRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyframeRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  KeyframeRequest ensureKeyframeRequest() => $_ensure(1);
}

/// Every fragment up to and including `sequence` is durably stored.
class FragmentAck extends $pb.GeneratedMessage {
  factory FragmentAck({
    $fixnum.Int64? sequence,
  }) {
    final result = create();
    if (sequence != null) result.sequence = sequence;
    return result;
  }

  FragmentAck._();

  factory FragmentAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FragmentAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FragmentAck',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sequence', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FragmentAck clone() => FragmentAck()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FragmentAck copyWith(void Function(FragmentAck) updates) =>
      super.copyWith((message) => updates(message as FragmentAck))
          as FragmentAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FragmentAck create() => FragmentAck._();
  @$core.override
  FragmentAck createEmptyInstance() => create();
  static $pb.PbList<FragmentAck> createRepeated() => $pb.PbList<FragmentAck>();
  @$core.pragma('dart2js:noInline')
  static FragmentAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FragmentAck>(create);
  static FragmentAck? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sequence => $_getI64(0);
  @$pb.TagNumber(1)
  set sequence($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSequence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSequence() => $_clearField(1);
}

/// The next fragment should open on a keyframe.
class KeyframeRequest extends $pb.GeneratedMessage {
  factory KeyframeRequest({
    KeyframeRequest_Reason? reason,
  }) {
    final result = create();
    if (reason != null) result.reason = reason;
    return result;
  }

  KeyframeRequest._();

  factory KeyframeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeyframeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeyframeRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..e<KeyframeRequest_Reason>(
        1, _omitFieldNames ? '' : 'reason', $pb.PbFieldType.OE,
        defaultOrMaker: KeyframeRequest_Reason.UNSPECIFIED,
        valueOf: KeyframeRequest_Reason.valueOf,
        enumValues: KeyframeRequest_Reason.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyframeRequest clone() => KeyframeRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyframeRequest copyWith(void Function(KeyframeRequest) updates) =>
      super.copyWith((message) => updates(message as KeyframeRequest))
          as KeyframeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyframeRequest create() => KeyframeRequest._();
  @$core.override
  KeyframeRequest createEmptyInstance() => create();
  static $pb.PbList<KeyframeRequest> createRepeated() =>
      $pb.PbList<KeyframeRequest>();
  @$core.pragma('dart2js:noInline')
  static KeyframeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeyframeRequest>(create);
  static KeyframeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  KeyframeRequest_Reason get reason => $_getN(0);
  @$pb.TagNumber(1)
  set reason(KeyframeRequest_Reason value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => $_clearField(1);
}

enum LiveViewFrame_Frame { init, fragment, notSet }

/// Server to viewer.
class LiveViewFrame extends $pb.GeneratedMessage {
  factory LiveViewFrame({
    InitSegment? init,
    MediaFragment? fragment,
  }) {
    final result = create();
    if (init != null) result.init = init;
    if (fragment != null) result.fragment = fragment;
    return result;
  }

  LiveViewFrame._();

  factory LiveViewFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LiveViewFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, LiveViewFrame_Frame>
      _LiveViewFrame_FrameByTag = {
    1: LiveViewFrame_Frame.init,
    2: LiveViewFrame_Frame.fragment,
    0: LiveViewFrame_Frame.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LiveViewFrame',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'pixeltrace.coord.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<InitSegment>(1, _omitFieldNames ? '' : 'init',
        subBuilder: InitSegment.create)
    ..aOM<MediaFragment>(2, _omitFieldNames ? '' : 'fragment',
        subBuilder: MediaFragment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LiveViewFrame clone() => LiveViewFrame()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LiveViewFrame copyWith(void Function(LiveViewFrame) updates) =>
      super.copyWith((message) => updates(message as LiveViewFrame))
          as LiveViewFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LiveViewFrame create() => LiveViewFrame._();
  @$core.override
  LiveViewFrame createEmptyInstance() => create();
  static $pb.PbList<LiveViewFrame> createRepeated() =>
      $pb.PbList<LiveViewFrame>();
  @$core.pragma('dart2js:noInline')
  static LiveViewFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LiveViewFrame>(create);
  static LiveViewFrame? _defaultInstance;

  LiveViewFrame_Frame whichFrame() =>
      _LiveViewFrame_FrameByTag[$_whichOneof(0)]!;
  void clearFrame() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  InitSegment get init => $_getN(0);
  @$pb.TagNumber(1)
  set init(InitSegment value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInit() => $_has(0);
  @$pb.TagNumber(1)
  void clearInit() => $_clearField(1);
  @$pb.TagNumber(1)
  InitSegment ensureInit() => $_ensure(0);

  @$pb.TagNumber(2)
  MediaFragment get fragment => $_getN(1);
  @$pb.TagNumber(2)
  set fragment(MediaFragment value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFragment() => $_has(1);
  @$pb.TagNumber(2)
  void clearFragment() => $_clearField(2);
  @$pb.TagNumber(2)
  MediaFragment ensureFragment() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
