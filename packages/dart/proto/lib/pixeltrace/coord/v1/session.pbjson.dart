// This is a generated file - do not edit.
//
// Generated from pixeltrace/coord/v1/session.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../types/v1/types.pbjson.dart' as $0;

@$core.Deprecated('Use prepareRequestDescriptor instead')
const PrepareRequest$json = {
  '1': 'PrepareRequest',
  '2': [
    {
      '1': 'site_key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'siteKey'
    },
  ],
};

/// Descriptor for `PrepareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareRequestDescriptor = $convert.base64Decode(
    'Cg5QcmVwYXJlUmVxdWVzdBI3CghzaXRlX2tleRgBIAEoCzIcLnBpeGVsdHJhY2UudHlwZXMudj'
    'EuU2l0ZUtleVIHc2l0ZUtleQ==');

@$core.Deprecated('Use prepareResponseDescriptor instead')
const PrepareResponse$json = {
  '1': 'PrepareResponse',
  '2': [
    {
      '1': 'ice_servers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pixeltrace.coord.v1.IceServer',
      '10': 'iceServers'
    },
  ],
};

/// Descriptor for `PrepareResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareResponseDescriptor = $convert.base64Decode(
    'Cg9QcmVwYXJlUmVzcG9uc2USPwoLaWNlX3NlcnZlcnMYASADKAsyHi5waXhlbHRyYWNlLmNvb3'
    'JkLnYxLkljZVNlcnZlclIKaWNlU2VydmVycw==');

@$core.Deprecated('Use iceServerDescriptor instead')
const IceServer$json = {
  '1': 'IceServer',
  '2': [
    {'1': 'urls', '3': 1, '4': 3, '5': 9, '10': 'urls'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'credential', '3': 3, '4': 1, '5': 9, '10': 'credential'},
  ],
};

/// Descriptor for `IceServer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iceServerDescriptor = $convert.base64Decode(
    'CglJY2VTZXJ2ZXISEgoEdXJscxgBIAMoCVIEdXJscxIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm'
    '5hbWUSHgoKY3JlZGVudGlhbBgDIAEoCVIKY3JlZGVudGlhbA==');

@$core.Deprecated('Use establishRequestDescriptor instead')
const EstablishRequest$json = {
  '1': 'EstablishRequest',
  '2': [
    {
      '1': 'site_key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'siteKey'
    },
    {
      '1': 'sdp_offer',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.SessionDescription',
      '10': 'sdpOffer'
    },
    {
      '1': 'session_id',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'sessionId'
    },
    {
      '1': 'client_info',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionPublisherInfo',
      '10': 'clientInfo'
    },
  ],
};

/// Descriptor for `EstablishRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List establishRequestDescriptor = $convert.base64Decode(
    'ChBFc3RhYmxpc2hSZXF1ZXN0EjcKCHNpdGVfa2V5GAEgASgLMhwucGl4ZWx0cmFjZS50eXBlcy'
    '52MS5TaXRlS2V5UgdzaXRlS2V5EkQKCXNkcF9vZmZlchgCIAEoCzInLnBpeGVsdHJhY2UuY29v'
    'cmQudjEuU2Vzc2lvbkRlc2NyaXB0aW9uUghzZHBPZmZlchI9CgpzZXNzaW9uX2lkGAMgASgLMh'
    '4ucGl4ZWx0cmFjZS50eXBlcy52MS5TZXNzaW9uSWRSCXNlc3Npb25JZBJKCgtjbGllbnRfaW5m'
    'bxgEIAEoCzIpLnBpeGVsdHJhY2UudHlwZXMudjEuU2Vzc2lvblB1Ymxpc2hlckluZm9SCmNsaW'
    'VudEluZm8=');

@$core.Deprecated('Use establishResponseDescriptor instead')
const EstablishResponse$json = {
  '1': 'EstablishResponse',
  '2': [
    {
      '1': 'session',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.IngestSession',
      '10': 'session'
    },
  ],
};

/// Descriptor for `EstablishResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List establishResponseDescriptor = $convert.base64Decode(
    'ChFFc3RhYmxpc2hSZXNwb25zZRI8CgdzZXNzaW9uGAEgASgLMiIucGl4ZWx0cmFjZS5jb29yZC'
    '52MS5Jbmdlc3RTZXNzaW9uUgdzZXNzaW9u');

@$core.Deprecated('Use sessionDescriptionDescriptor instead')
const SessionDescription$json = {
  '1': 'SessionDescription',
  '2': [
    {'1': 'sdp', '3': 1, '4': 1, '5': 9, '10': 'sdp'},
  ],
};

/// Descriptor for `SessionDescription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptionDescriptor = $convert
    .base64Decode('ChJTZXNzaW9uRGVzY3JpcHRpb24SEAoDc2RwGAEgASgJUgNzZHA=');

@$core.Deprecated('Use ingestSessionDescriptor instead')
const IngestSession$json = {
  '1': 'IngestSession',
  '2': [
    {
      '1': 'sdp_answer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.SessionDescription',
      '10': 'sdpAnswer'
    },
    {
      '1': 'session_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'sessionId'
    },
  ],
};

/// Descriptor for `IngestSession`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingestSessionDescriptor = $convert.base64Decode(
    'Cg1Jbmdlc3RTZXNzaW9uEkYKCnNkcF9hbnN3ZXIYASABKAsyJy5waXhlbHRyYWNlLmNvb3JkLn'
    'YxLlNlc3Npb25EZXNjcmlwdGlvblIJc2RwQW5zd2VyEj0KCnNlc3Npb25faWQYAiABKAsyHi5w'
    'aXhlbHRyYWNlLnR5cGVzLnYxLlNlc3Npb25JZFIJc2Vzc2lvbklk');

@$core.Deprecated('Use startRecordingRequestDescriptor instead')
const StartRecordingRequest$json = {
  '1': 'StartRecordingRequest',
  '2': [
    {
      '1': 'session_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'sessionId'
    },
    {
      '1': 'site_key',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'siteKey'
    },
  ],
};

/// Descriptor for `StartRecordingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startRecordingRequestDescriptor = $convert.base64Decode(
    'ChVTdGFydFJlY29yZGluZ1JlcXVlc3QSPQoKc2Vzc2lvbl9pZBgBIAEoCzIeLnBpeGVsdHJhY2'
    'UudHlwZXMudjEuU2Vzc2lvbklkUglzZXNzaW9uSWQSNwoIc2l0ZV9rZXkYAiABKAsyHC5waXhl'
    'bHRyYWNlLnR5cGVzLnYxLlNpdGVLZXlSB3NpdGVLZXk=');

@$core.Deprecated('Use startRecordingResponseDescriptor instead')
const StartRecordingResponse$json = {
  '1': 'StartRecordingResponse',
};

/// Descriptor for `StartRecordingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startRecordingResponseDescriptor =
    $convert.base64Decode('ChZTdGFydFJlY29yZGluZ1Jlc3BvbnNl');

@$core.Deprecated('Use closeRequestDescriptor instead')
const CloseRequest$json = {
  '1': 'CloseRequest',
  '2': [
    {
      '1': 'session_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'sessionId'
    },
    {
      '1': 'site_key',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'siteKey'
    },
  ],
};

/// Descriptor for `CloseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closeRequestDescriptor = $convert.base64Decode(
    'CgxDbG9zZVJlcXVlc3QSPQoKc2Vzc2lvbl9pZBgBIAEoCzIeLnBpeGVsdHJhY2UudHlwZXMudj'
    'EuU2Vzc2lvbklkUglzZXNzaW9uSWQSNwoIc2l0ZV9rZXkYAiABKAsyHC5waXhlbHRyYWNlLnR5'
    'cGVzLnYxLlNpdGVLZXlSB3NpdGVLZXk=');

@$core.Deprecated('Use closeResponseDescriptor instead')
const CloseResponse$json = {
  '1': 'CloseResponse',
};

/// Descriptor for `CloseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closeResponseDescriptor =
    $convert.base64Decode('Cg1DbG9zZVJlc3BvbnNl');

@$core.Deprecated('Use beginUploadRequestDescriptor instead')
const BeginUploadRequest$json = {
  '1': 'BeginUploadRequest',
  '2': [
    {
      '1': 'site_key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'siteKey'
    },
    {
      '1': 'session_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'sessionId'
    },
    {
      '1': 'client_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionPublisherInfo',
      '10': 'clientInfo'
    },
  ],
};

/// Descriptor for `BeginUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beginUploadRequestDescriptor = $convert.base64Decode(
    'ChJCZWdpblVwbG9hZFJlcXVlc3QSNwoIc2l0ZV9rZXkYASABKAsyHC5waXhlbHRyYWNlLnR5cG'
    'VzLnYxLlNpdGVLZXlSB3NpdGVLZXkSPQoKc2Vzc2lvbl9pZBgCIAEoCzIeLnBpeGVsdHJhY2Uu'
    'dHlwZXMudjEuU2Vzc2lvbklkUglzZXNzaW9uSWQSSgoLY2xpZW50X2luZm8YAyABKAsyKS5waX'
    'hlbHRyYWNlLnR5cGVzLnYxLlNlc3Npb25QdWJsaXNoZXJJbmZvUgpjbGllbnRJbmZv');

@$core.Deprecated('Use beginUploadResponseDescriptor instead')
const BeginUploadResponse$json = {
  '1': 'BeginUploadResponse',
  '2': [
    {
      '1': 'session_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'sessionId'
    },
    {'1': 'upload_url', '3': 2, '4': 1, '5': 9, '10': 'uploadUrl'},
    {
      '1': 'limits',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.coord.v1.SessionLimits',
      '10': 'limits'
    },
  ],
};

/// Descriptor for `BeginUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beginUploadResponseDescriptor = $convert.base64Decode(
    'ChNCZWdpblVwbG9hZFJlc3BvbnNlEj0KCnNlc3Npb25faWQYASABKAsyHi5waXhlbHRyYWNlLn'
    'R5cGVzLnYxLlNlc3Npb25JZFIJc2Vzc2lvbklkEh0KCnVwbG9hZF91cmwYAiABKAlSCXVwbG9h'
    'ZFVybBI6CgZsaW1pdHMYAyABKAsyIi5waXhlbHRyYWNlLmNvb3JkLnYxLlNlc3Npb25MaW1pdH'
    'NSBmxpbWl0cw==');

@$core.Deprecated('Use finishUploadRequestDescriptor instead')
const FinishUploadRequest$json = {
  '1': 'FinishUploadRequest',
  '2': [
    {
      '1': 'session_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SessionId',
      '10': 'sessionId'
    },
    {
      '1': 'site_key',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pixeltrace.types.v1.SiteKey',
      '10': 'siteKey'
    },
  ],
};

/// Descriptor for `FinishUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finishUploadRequestDescriptor = $convert.base64Decode(
    'ChNGaW5pc2hVcGxvYWRSZXF1ZXN0Ej0KCnNlc3Npb25faWQYASABKAsyHi5waXhlbHRyYWNlLn'
    'R5cGVzLnYxLlNlc3Npb25JZFIJc2Vzc2lvbklkEjcKCHNpdGVfa2V5GAIgASgLMhwucGl4ZWx0'
    'cmFjZS50eXBlcy52MS5TaXRlS2V5UgdzaXRlS2V5');

@$core.Deprecated('Use finishUploadResponseDescriptor instead')
const FinishUploadResponse$json = {
  '1': 'FinishUploadResponse',
};

/// Descriptor for `FinishUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finishUploadResponseDescriptor =
    $convert.base64Decode('ChRGaW5pc2hVcGxvYWRSZXNwb25zZQ==');

@$core.Deprecated('Use sessionLimitsDescriptor instead')
const SessionLimits$json = {
  '1': 'SessionLimits',
  '2': [
    {
      '1': 'max_session_seconds',
      '3': 1,
      '4': 1,
      '5': 13,
      '10': 'maxSessionSeconds'
    },
    {
      '1': 'idle_timeout_seconds',
      '3': 2,
      '4': 1,
      '5': 13,
      '10': 'idleTimeoutSeconds'
    },
    {
      '1': 'discard_under_seconds',
      '3': 3,
      '4': 1,
      '5': 13,
      '10': 'discardUnderSeconds'
    },
  ],
};

/// Descriptor for `SessionLimits`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionLimitsDescriptor = $convert.base64Decode(
    'Cg1TZXNzaW9uTGltaXRzEi4KE21heF9zZXNzaW9uX3NlY29uZHMYASABKA1SEW1heFNlc3Npb2'
    '5TZWNvbmRzEjAKFGlkbGVfdGltZW91dF9zZWNvbmRzGAIgASgNUhJpZGxlVGltZW91dFNlY29u'
    'ZHMSMgoVZGlzY2FyZF91bmRlcl9zZWNvbmRzGAMgASgNUhNkaXNjYXJkVW5kZXJTZWNvbmRz');

const $core.Map<$core.String, $core.dynamic> SessionServiceBase$json = {
  '1': 'SessionService',
  '2': [
    {
      '1': 'Prepare',
      '2': '.pixeltrace.coord.v1.PrepareRequest',
      '3': '.pixeltrace.coord.v1.PrepareResponse'
    },
    {
      '1': 'Establish',
      '2': '.pixeltrace.coord.v1.EstablishRequest',
      '3': '.pixeltrace.coord.v1.EstablishResponse'
    },
    {
      '1': 'StartRecording',
      '2': '.pixeltrace.coord.v1.StartRecordingRequest',
      '3': '.pixeltrace.coord.v1.StartRecordingResponse'
    },
    {
      '1': 'Close',
      '2': '.pixeltrace.coord.v1.CloseRequest',
      '3': '.pixeltrace.coord.v1.CloseResponse'
    },
    {
      '1': 'BeginUpload',
      '2': '.pixeltrace.coord.v1.BeginUploadRequest',
      '3': '.pixeltrace.coord.v1.BeginUploadResponse'
    },
    {
      '1': 'FinishUpload',
      '2': '.pixeltrace.coord.v1.FinishUploadRequest',
      '3': '.pixeltrace.coord.v1.FinishUploadResponse'
    },
  ],
};

@$core.Deprecated('Use sessionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    SessionServiceBase$messageJson = {
  '.pixeltrace.coord.v1.PrepareRequest': PrepareRequest$json,
  '.pixeltrace.types.v1.SiteKey': $0.SiteKey$json,
  '.pixeltrace.coord.v1.PrepareResponse': PrepareResponse$json,
  '.pixeltrace.coord.v1.IceServer': IceServer$json,
  '.pixeltrace.coord.v1.EstablishRequest': EstablishRequest$json,
  '.pixeltrace.coord.v1.SessionDescription': SessionDescription$json,
  '.pixeltrace.types.v1.SessionId': $0.SessionId$json,
  '.pixeltrace.types.v1.SessionPublisherInfo': $0.SessionPublisherInfo$json,
  '.pixeltrace.coord.v1.EstablishResponse': EstablishResponse$json,
  '.pixeltrace.coord.v1.IngestSession': IngestSession$json,
  '.pixeltrace.coord.v1.StartRecordingRequest': StartRecordingRequest$json,
  '.pixeltrace.coord.v1.StartRecordingResponse': StartRecordingResponse$json,
  '.pixeltrace.coord.v1.CloseRequest': CloseRequest$json,
  '.pixeltrace.coord.v1.CloseResponse': CloseResponse$json,
  '.pixeltrace.coord.v1.BeginUploadRequest': BeginUploadRequest$json,
  '.pixeltrace.coord.v1.BeginUploadResponse': BeginUploadResponse$json,
  '.pixeltrace.coord.v1.SessionLimits': SessionLimits$json,
  '.pixeltrace.coord.v1.FinishUploadRequest': FinishUploadRequest$json,
  '.pixeltrace.coord.v1.FinishUploadResponse': FinishUploadResponse$json,
};

/// Descriptor for `SessionService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List sessionServiceDescriptor = $convert.base64Decode(
    'Cg5TZXNzaW9uU2VydmljZRJUCgdQcmVwYXJlEiMucGl4ZWx0cmFjZS5jb29yZC52MS5QcmVwYX'
    'JlUmVxdWVzdBokLnBpeGVsdHJhY2UuY29vcmQudjEuUHJlcGFyZVJlc3BvbnNlEloKCUVzdGFi'
    'bGlzaBIlLnBpeGVsdHJhY2UuY29vcmQudjEuRXN0YWJsaXNoUmVxdWVzdBomLnBpeGVsdHJhY2'
    'UuY29vcmQudjEuRXN0YWJsaXNoUmVzcG9uc2USaQoOU3RhcnRSZWNvcmRpbmcSKi5waXhlbHRy'
    'YWNlLmNvb3JkLnYxLlN0YXJ0UmVjb3JkaW5nUmVxdWVzdBorLnBpeGVsdHJhY2UuY29vcmQudj'
    'EuU3RhcnRSZWNvcmRpbmdSZXNwb25zZRJOCgVDbG9zZRIhLnBpeGVsdHJhY2UuY29vcmQudjEu'
    'Q2xvc2VSZXF1ZXN0GiIucGl4ZWx0cmFjZS5jb29yZC52MS5DbG9zZVJlc3BvbnNlEmAKC0JlZ2'
    'luVXBsb2FkEicucGl4ZWx0cmFjZS5jb29yZC52MS5CZWdpblVwbG9hZFJlcXVlc3QaKC5waXhl'
    'bHRyYWNlLmNvb3JkLnYxLkJlZ2luVXBsb2FkUmVzcG9uc2USYwoMRmluaXNoVXBsb2FkEigucG'
    'l4ZWx0cmFjZS5jb29yZC52MS5GaW5pc2hVcGxvYWRSZXF1ZXN0GikucGl4ZWx0cmFjZS5jb29y'
    'ZC52MS5GaW5pc2hVcGxvYWRSZXNwb25zZQ==');
