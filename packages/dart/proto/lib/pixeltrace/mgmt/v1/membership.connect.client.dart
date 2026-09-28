//
//  Generated code. Do not modify.
//  source: pixeltrace/mgmt/v1/membership.proto
//

import "package:connectrpc/connect.dart" as connectlib;
import "membership.pb.dart" as pixeltracemgmtv1membership;
import "membership.connect.spec.dart" as specs;

/// Provides data plane functionality related to memberships. A membership is the
/// edge that grants a user a role within an organization.
extension type MembershipServiceClient(connectlib.Transport _transport) {
  /// Creates a membership (an edge between org <-> user).
  Future<pixeltracemgmtv1membership.CreateMembershipResponse> createMembership(
    pixeltracemgmtv1membership.CreateMembershipRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.MembershipService.createMembership,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Fetches a membership.
  Future<pixeltracemgmtv1membership.GetMembershipResponse> getMembership(
    pixeltracemgmtv1membership.GetMembershipRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.MembershipService.getMembership,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a membership's mutable properties, e.g. the user's role.
  Future<pixeltracemgmtv1membership.UpdateMembershipResponse> updateMembership(
    pixeltracemgmtv1membership.UpdateMembershipRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.MembershipService.updateMembership,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a membership, removing the user from the organization.
  Future<pixeltracemgmtv1membership.DeleteMembershipResponse> deleteMembership(
    pixeltracemgmtv1membership.DeleteMembershipRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.MembershipService.deleteMembership,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Lists the memberships of an organization.
  Future<pixeltracemgmtv1membership.ListMembershipsResponse> listMemberships(
    pixeltracemgmtv1membership.ListMembershipsRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.MembershipService.listMemberships,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
