// This is a generated file - do not edit.
//
// Generated from pixeltrace/coord/v1/session.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'session.pb.dart' as $1;
import 'session.pbjson.dart';

export 'session.pb.dart';

abstract class SessionServiceBase extends $pb.GeneratedService {
  $async.Future<$1.PrepareResponse> prepare(
      $pb.ServerContext ctx, $1.PrepareRequest request);
  $async.Future<$1.EstablishResponse> establish(
      $pb.ServerContext ctx, $1.EstablishRequest request);
  $async.Future<$1.StartRecordingResponse> startRecording(
      $pb.ServerContext ctx, $1.StartRecordingRequest request);
  $async.Future<$1.CloseResponse> close(
      $pb.ServerContext ctx, $1.CloseRequest request);
  $async.Future<$1.BeginUploadResponse> beginUpload(
      $pb.ServerContext ctx, $1.BeginUploadRequest request);
  $async.Future<$1.FinishUploadResponse> finishUpload(
      $pb.ServerContext ctx, $1.FinishUploadRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'Prepare':
        return $1.PrepareRequest();
      case 'Establish':
        return $1.EstablishRequest();
      case 'StartRecording':
        return $1.StartRecordingRequest();
      case 'Close':
        return $1.CloseRequest();
      case 'BeginUpload':
        return $1.BeginUploadRequest();
      case 'FinishUpload':
        return $1.FinishUploadRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'Prepare':
        return prepare(ctx, request as $1.PrepareRequest);
      case 'Establish':
        return establish(ctx, request as $1.EstablishRequest);
      case 'StartRecording':
        return startRecording(ctx, request as $1.StartRecordingRequest);
      case 'Close':
        return close(ctx, request as $1.CloseRequest);
      case 'BeginUpload':
        return beginUpload(ctx, request as $1.BeginUploadRequest);
      case 'FinishUpload':
        return finishUpload(ctx, request as $1.FinishUploadRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => SessionServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => SessionServiceBase$messageJson;
}
