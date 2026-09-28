//
//  Generated code. Do not modify.
//  source: pixeltrace/mgmt/v1/organization.proto
//

import "package:connectrpc/connect.dart" as connectlib;
import "organization.pb.dart" as pixeltracemgmtv1organization;
import "organization.connect.spec.dart" as specs;

/// Provides data plane functionality related to organizations.
extension type OrganizationServiceClient(connectlib.Transport _transport) {
  /// Creates an organization.
  Future<pixeltracemgmtv1organization.CreateOrganizationResponse>
  createOrganization(
    pixeltracemgmtv1organization.CreateOrganizationRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.OrganizationService.createOrganization,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Fetches an organization.
  Future<pixeltracemgmtv1organization.GetOrganizationResponse> getOrganization(
    pixeltracemgmtv1organization.GetOrganizationRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.OrganizationService.getOrganization,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates an organization's mutable properties.
  Future<pixeltracemgmtv1organization.UpdateOrganizationResponse>
  updateOrganization(
    pixeltracemgmtv1organization.UpdateOrganizationRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.OrganizationService.updateOrganization,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes an organization.
  Future<pixeltracemgmtv1organization.DeleteOrganizationResponse>
  deleteOrganization(
    pixeltracemgmtv1organization.DeleteOrganizationRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.OrganizationService.deleteOrganization,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Lists the projects belonging to an organization.
  Future<pixeltracemgmtv1organization.ListProjectsResponse> listProjects(
    pixeltracemgmtv1organization.ListProjectsRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.OrganizationService.listProjects,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
