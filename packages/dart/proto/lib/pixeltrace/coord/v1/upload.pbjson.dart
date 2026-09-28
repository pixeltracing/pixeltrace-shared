// This is a generated file - do not edit.
//
// Generated from pixeltrace/coord/v1/upload.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use uploadFrameDescriptor instead')
const UploadFrame$json = {
  '1': 'UploadFrame',
  '2': [
    {
      '1': 'init',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.InitSegment',
      '9': 0,
      '10': 'init'
    },
    {
      '1': 'fragment',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.MediaFragment',
      '9': 0,
      '10': 'fragment'
    },
    {
      '1': 'end',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.EndOfUpload',
      '9': 0,
      '10': 'end'
    },
  ],
  '8': [
    {'1': 'frame'},
  ],
};

/// Descriptor for `UploadFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadFrameDescriptor = $convert.base64Decode(
    'CgtVcGxvYWRGcmFtZRI2CgRpbml0GAEgASgLMiAucGl4ZWx0cmFjZS5jb29yZC52MS5Jbml0U2'
    'VnbWVudEgAUgRpbml0EkAKCGZyYWdtZW50GAIgASgLMiIucGl4ZWx0cmFjZS5jb29yZC52MS5N'
    'ZWRpYUZyYWdtZW50SABSCGZyYWdtZW50EjQKA2VuZBgDIAEoCzIgLnBpeGVsdHJhY2UuY29vcm'
    'QudjEuRW5kT2ZVcGxvYWRIAFIDZW5kQgcKBWZyYW1l');

@$core.Deprecated('Use initSegmentDescriptor instead')
const InitSegment$json = {
  '1': 'InitSegment',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    {'1': 'codecs', '3': 2, '4': 1, '5': 9, '10': 'codecs'},
    {'1': 'width', '3': 3, '4': 1, '5': 13, '10': 'width'},
    {'1': 'height', '3': 4, '4': 1, '5': 13, '10': 'height'},
    {'1': 'protocol_version', '3': 5, '4': 1, '5': 13, '10': 'protocolVersion'},
  ],
};

/// Descriptor for `InitSegment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initSegmentDescriptor = $convert.base64Decode(
    'CgtJbml0U2VnbWVudBISCgRkYXRhGAEgASgMUgRkYXRhEhYKBmNvZGVjcxgCIAEoCVIGY29kZW'
    'NzEhQKBXdpZHRoGAMgASgNUgV3aWR0aBIWCgZoZWlnaHQYBCABKA1SBmhlaWdodBIpChBwcm90'
    'b2NvbF92ZXJzaW9uGAUgASgNUg9wcm90b2NvbFZlcnNpb24=');

@$core.Deprecated('Use mediaFragmentDescriptor instead')
const MediaFragment$json = {
  '1': 'MediaFragment',
  '2': [
    {'1': 'sequence', '3': 1, '4': 1, '5': 4, '10': 'sequence'},
    {'1': 'part_index', '3': 2, '4': 1, '5': 13, '10': 'partIndex'},
    {'1': 'part_count', '3': 3, '4': 1, '5': 13, '10': 'partCount'},
    {'1': 'keyframe', '3': 4, '4': 1, '5': 8, '10': 'keyframe'},
    {'1': 'duration_ms', '3': 5, '4': 1, '5': 13, '10': 'durationMs'},
    {'1': 'data', '3': 6, '4': 1, '5': 12, '10': 'data'},
    {
      '1': 'chunks',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.coord.v1.ChunkFact',
      '10': 'chunks'
    },
  ],
};

/// Descriptor for `MediaFragment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaFragmentDescriptor = $convert.base64Decode(
    'Cg1NZWRpYUZyYWdtZW50EhoKCHNlcXVlbmNlGAEgASgEUghzZXF1ZW5jZRIdCgpwYXJ0X2luZG'
    'V4GAIgASgNUglwYXJ0SW5kZXgSHQoKcGFydF9jb3VudBgDIAEoDVIJcGFydENvdW50EhoKCGtl'
    'eWZyYW1lGAQgASgIUghrZXlmcmFtZRIfCgtkdXJhdGlvbl9tcxgFIAEoDVIKZHVyYXRpb25Ncx'
    'ISCgRkYXRhGAYgASgMUgRkYXRhEjYKBmNodW5rcxgHIAMoCzIeLnBpeGVsdHJhY2UuY29vcmQu'
    'djEuQ2h1bmtGYWN0UgZjaHVua3M=');

@$core.Deprecated('Use chunkFactDescriptor instead')
const ChunkFact$json = {
  '1': 'ChunkFact',
  '2': [
    {'1': 'offset_ms', '3': 1, '4': 1, '5': 13, '10': 'offsetMs'},
    {'1': 'bytes', '3': 2, '4': 1, '5': 13, '10': 'bytes'},
    {'1': 'keyframe', '3': 3, '4': 1, '5': 8, '10': 'keyframe'},
  ],
};

/// Descriptor for `ChunkFact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkFactDescriptor = $convert.base64Decode(
    'CglDaHVua0ZhY3QSGwoJb2Zmc2V0X21zGAEgASgNUghvZmZzZXRNcxIUCgVieXRlcxgCIAEoDV'
    'IFYnl0ZXMSGgoIa2V5ZnJhbWUYAyABKAhSCGtleWZyYW1l');

@$core.Deprecated('Use endOfUploadDescriptor instead')
const EndOfUpload$json = {
  '1': 'EndOfUpload',
  '2': [
    {
      '1': 'reason',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.coord.v1.EndOfUpload.Reason',
      '10': 'reason'
    },
  ],
  '4': [EndOfUpload_Reason$json],
};

@$core.Deprecated('Use endOfUploadDescriptor instead')
const EndOfUpload_Reason$json = {
  '1': 'Reason',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'COMPLETE', '2': 1},
    {'1': 'PAGE_HIDDEN', '2': 2},
  ],
};

/// Descriptor for `EndOfUpload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endOfUploadDescriptor = $convert.base64Decode(
    'CgtFbmRPZlVwbG9hZBI/CgZyZWFzb24YASABKA4yJy5waXhlbHRyYWNlLmNvb3JkLnYxLkVuZE'
    '9mVXBsb2FkLlJlYXNvblIGcmVhc29uIjgKBlJlYXNvbhIPCgtVTlNQRUNJRklFRBAAEgwKCENP'
    'TVBMRVRFEAESDwoLUEFHRV9ISURERU4QAg==');

@$core.Deprecated('Use uploadControlFrameDescriptor instead')
const UploadControlFrame$json = {
  '1': 'UploadControlFrame',
  '2': [
    {
      '1': 'ack',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.FragmentAck',
      '9': 0,
      '10': 'ack'
    },
    {
      '1': 'keyframe_request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.KeyframeRequest',
      '9': 0,
      '10': 'keyframeRequest'
    },
  ],
  '8': [
    {'1': 'frame'},
  ],
};

/// Descriptor for `UploadControlFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadControlFrameDescriptor = $convert.base64Decode(
    'ChJVcGxvYWRDb250cm9sRnJhbWUSNAoDYWNrGAEgASgLMiAucGl4ZWx0cmFjZS5jb29yZC52MS'
    '5GcmFnbWVudEFja0gAUgNhY2sSUQoQa2V5ZnJhbWVfcmVxdWVzdBgCIAEoCzIkLnBpeGVsdHJh'
    'Y2UuY29vcmQudjEuS2V5ZnJhbWVSZXF1ZXN0SABSD2tleWZyYW1lUmVxdWVzdEIHCgVmcmFtZQ'
    '==');

@$core.Deprecated('Use fragmentAckDescriptor instead')
const FragmentAck$json = {
  '1': 'FragmentAck',
  '2': [
    {'1': 'sequence', '3': 1, '4': 1, '5': 4, '10': 'sequence'},
  ],
};

/// Descriptor for `FragmentAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fragmentAckDescriptor = $convert
    .base64Decode('CgtGcmFnbWVudEFjaxIaCghzZXF1ZW5jZRgBIAEoBFIIc2VxdWVuY2U=');

@$core.Deprecated('Use keyframeRequestDescriptor instead')
const KeyframeRequest$json = {
  '1': 'KeyframeRequest',
  '2': [
    {
      '1': 'reason',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.pixeltrace.coord.v1.KeyframeRequest.Reason',
      '10': 'reason'
    },
  ],
  '4': [KeyframeRequest_Reason$json],
};

@$core.Deprecated('Use keyframeRequestDescriptor instead')
const KeyframeRequest_Reason$json = {
  '1': 'Reason',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'VIEWER_JOINED', '2': 1},
    {'1': 'PUBLISHER_RESUMED', '2': 2},
    {'1': 'SEGMENT_OVERDUE', '2': 3},
  ],
};

/// Descriptor for `KeyframeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyframeRequestDescriptor = $convert.base64Decode(
    'Cg9LZXlmcmFtZVJlcXVlc3QSQwoGcmVhc29uGAEgASgOMisucGl4ZWx0cmFjZS5jb29yZC52MS'
    '5LZXlmcmFtZVJlcXVlc3QuUmVhc29uUgZyZWFzb24iWAoGUmVhc29uEg8KC1VOU1BFQ0lGSUVE'
    'EAASEQoNVklFV0VSX0pPSU5FRBABEhUKEVBVQkxJU0hFUl9SRVNVTUVEEAISEwoPU0VHTUVOVF'
    '9PVkVSRFVFEAM=');

@$core.Deprecated('Use liveViewFrameDescriptor instead')
const LiveViewFrame$json = {
  '1': 'LiveViewFrame',
  '2': [
    {
      '1': 'init',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.InitSegment',
      '9': 0,
      '10': 'init'
    },
    {
      '1': 'fragment',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.MediaFragment',
      '9': 0,
      '10': 'fragment'
    },
  ],
  '8': [
    {'1': 'frame'},
  ],
};

/// Descriptor for `LiveViewFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List liveViewFrameDescriptor = $convert.base64Decode(
    'Cg1MaXZlVmlld0ZyYW1lEjYKBGluaXQYASABKAsyIC5waXhlbHRyYWNlLmNvb3JkLnYxLkluaX'
    'RTZWdtZW50SABSBGluaXQSQAoIZnJhZ21lbnQYAiABKAsyIi5waXhlbHRyYWNlLmNvb3JkLnYx'
    'Lk1lZGlhRnJhZ21lbnRIAFIIZnJhZ21lbnRCBwoFZnJhbWU=');
