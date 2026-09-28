//
//  Generated code. Do not modify.
//  source: pixeltrace/mgmt/v1/organization.proto
//

import "package:connectrpc/connect.dart" as connectlib;
import "organization.pb.dart" as pixeltracemgmtv1organization;

/// Provides data plane functionality related to organizations.
abstract final class OrganizationService {
  /// Fully-qualified name of the OrganizationService service.
  static const name = 'pixeltrace.mgmt.v1.OrganizationService';

  /// Creates an organization.
  static const createOrganization = connectlib.Spec(
    '/$name/CreateOrganization',
    connectlib.StreamType.unary,
    pixeltracemgmtv1organization.CreateOrganizationRequest.new,
    pixeltracemgmtv1organization.CreateOrganizationResponse.new,
  );

  /// Fetches an organization.
  static const getOrganization = connectlib.Spec(
    '/$name/GetOrganization',
    connectlib.StreamType.unary,
    pixeltracemgmtv1organization.GetOrganizationRequest.new,
    pixeltracemgmtv1organization.GetOrganizationResponse.new,
  );

  /// Updates an organization's mutable properties.
  static const updateOrganization = connectlib.Spec(
    '/$name/UpdateOrganization',
    connectlib.StreamType.unary,
    pixeltracemgmtv1organization.UpdateOrganizationRequest.new,
    pixeltracemgmtv1organization.UpdateOrganizationResponse.new,
  );

  /// Deletes an organization.
  static const deleteOrganization = connectlib.Spec(
    '/$name/DeleteOrganization',
    connectlib.StreamType.unary,
    pixeltracemgmtv1organization.DeleteOrganizationRequest.new,
    pixeltracemgmtv1organization.DeleteOrganizationResponse.new,
  );

  /// Lists the projects belonging to an organization.
  static const listProjects = connectlib.Spec(
    '/$name/ListProjects',
    connectlib.StreamType.unary,
    pixeltracemgmtv1organization.ListProjectsRequest.new,
    pixeltracemgmtv1organization.ListProjectsResponse.new,
  );
}
