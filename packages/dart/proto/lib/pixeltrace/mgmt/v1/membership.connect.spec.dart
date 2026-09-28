//
//  Generated code. Do not modify.
//  source: pixeltrace/mgmt/v1/membership.proto
//

import "package:connectrpc/connect.dart" as connectlib;
import "membership.pb.dart" as pixeltracemgmtv1membership;

/// Provides data plane functionality related to memberships. A membership is the
/// edge that grants a user a role within an organization.
abstract final class MembershipService {
  /// Fully-qualified name of the MembershipService service.
  static const name = 'pixeltrace.mgmt.v1.MembershipService';

  /// Creates a membership (an edge between org <-> user).
  static const createMembership = connectlib.Spec(
    '/$name/CreateMembership',
    connectlib.StreamType.unary,
    pixeltracemgmtv1membership.CreateMembershipRequest.new,
    pixeltracemgmtv1membership.CreateMembershipResponse.new,
  );

  /// Fetches a membership.
  static const getMembership = connectlib.Spec(
    '/$name/GetMembership',
    connectlib.StreamType.unary,
    pixeltracemgmtv1membership.GetMembershipRequest.new,
    pixeltracemgmtv1membership.GetMembershipResponse.new,
  );

  /// Updates a membership's mutable properties, e.g. the user's role.
  static const updateMembership = connectlib.Spec(
    '/$name/UpdateMembership',
    connectlib.StreamType.unary,
    pixeltracemgmtv1membership.UpdateMembershipRequest.new,
    pixeltracemgmtv1membership.UpdateMembershipResponse.new,
  );

  /// Deletes a membership, removing the user from the organization.
  static const deleteMembership = connectlib.Spec(
    '/$name/DeleteMembership',
    connectlib.StreamType.unary,
    pixeltracemgmtv1membership.DeleteMembershipRequest.new,
    pixeltracemgmtv1membership.DeleteMembershipResponse.new,
  );

  /// Lists the memberships of an organization.
  static const listMemberships = connectlib.Spec(
    '/$name/ListMemberships',
    connectlib.StreamType.unary,
    pixeltracemgmtv1membership.ListMembershipsRequest.new,
    pixeltracemgmtv1membership.ListMembershipsResponse.new,
  );
}
