// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/membership.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'membership.pb.dart' as $3;
import 'membership.pbjson.dart';

export 'membership.pb.dart';

abstract class MembershipServiceBase extends $pb.GeneratedService {
  $async.Future<$3.CreateMembershipResponse> createMembership(
      $pb.ServerContext ctx, $3.CreateMembershipRequest request);
  $async.Future<$3.GetMembershipResponse> getMembership(
      $pb.ServerContext ctx, $3.GetMembershipRequest request);
  $async.Future<$3.UpdateMembershipResponse> updateMembership(
      $pb.ServerContext ctx, $3.UpdateMembershipRequest request);
  $async.Future<$3.DeleteMembershipResponse> deleteMembership(
      $pb.ServerContext ctx, $3.DeleteMembershipRequest request);
  $async.Future<$3.ListMembershipsResponse> listMemberships(
      $pb.ServerContext ctx, $3.ListMembershipsRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateMembership':
        return $3.CreateMembershipRequest();
      case 'GetMembership':
        return $3.GetMembershipRequest();
      case 'UpdateMembership':
        return $3.UpdateMembershipRequest();
      case 'DeleteMembership':
        return $3.DeleteMembershipRequest();
      case 'ListMemberships':
        return $3.ListMembershipsRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateMembership':
        return createMembership(ctx, request as $3.CreateMembershipRequest);
      case 'GetMembership':
        return getMembership(ctx, request as $3.GetMembershipRequest);
      case 'UpdateMembership':
        return updateMembership(ctx, request as $3.UpdateMembershipRequest);
      case 'DeleteMembership':
        return deleteMembership(ctx, request as $3.DeleteMembershipRequest);
      case 'ListMemberships':
        return listMemberships(ctx, request as $3.ListMembershipsRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json =>
      MembershipServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => MembershipServiceBase$messageJson;
}
