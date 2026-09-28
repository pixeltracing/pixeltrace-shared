// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/organization.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'organization.pb.dart' as $4;
import 'organization.pbjson.dart';

export 'organization.pb.dart';

abstract class OrganizationServiceBase extends $pb.GeneratedService {
  $async.Future<$4.CreateOrganizationResponse> createOrganization(
      $pb.ServerContext ctx, $4.CreateOrganizationRequest request);
  $async.Future<$4.GetOrganizationResponse> getOrganization(
      $pb.ServerContext ctx, $4.GetOrganizationRequest request);
  $async.Future<$4.UpdateOrganizationResponse> updateOrganization(
      $pb.ServerContext ctx, $4.UpdateOrganizationRequest request);
  $async.Future<$4.DeleteOrganizationResponse> deleteOrganization(
      $pb.ServerContext ctx, $4.DeleteOrganizationRequest request);
  $async.Future<$4.ListProjectsResponse> listProjects(
      $pb.ServerContext ctx, $4.ListProjectsRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateOrganization':
        return $4.CreateOrganizationRequest();
      case 'GetOrganization':
        return $4.GetOrganizationRequest();
      case 'UpdateOrganization':
        return $4.UpdateOrganizationRequest();
      case 'DeleteOrganization':
        return $4.DeleteOrganizationRequest();
      case 'ListProjects':
        return $4.ListProjectsRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateOrganization':
        return createOrganization(ctx, request as $4.CreateOrganizationRequest);
      case 'GetOrganization':
        return getOrganization(ctx, request as $4.GetOrganizationRequest);
      case 'UpdateOrganization':
        return updateOrganization(ctx, request as $4.UpdateOrganizationRequest);
      case 'DeleteOrganization':
        return deleteOrganization(ctx, request as $4.DeleteOrganizationRequest);
      case 'ListProjects':
        return listProjects(ctx, request as $4.ListProjectsRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json =>
      OrganizationServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => OrganizationServiceBase$messageJson;
}
