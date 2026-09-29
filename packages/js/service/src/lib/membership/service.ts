import { Code, ConnectError, type HandlerContext } from "@connectrpc/connect";
import {
  CreateMembershipResponseSchema,
  DeleteMembershipResponseSchema,
  GetMembershipResponseSchema,
  ListMembershipsResponseSchema,
  MembershipPropsSchema,
  UpdateMembershipResponseSchema,
  type CreateMembershipRequest,
  type CreateMembershipResponse,
  type DeleteMembershipRequest,
  type DeleteMembershipResponse,
  type GetMembershipRequest,
  type GetMembershipResponse,
  type ListMembershipsRequest,
  type ListMembershipsResponse,
  type MembershipKey,
  type UpdateMembershipRequest,
  type UpdateMembershipResponse,
} from "@pixeltrace/schema";
import { maskSelector, requireParam } from "../util/util.js";
import { requireOrgId, requireUserId } from "../util/ids.js";
import { listPage, pageParams } from "../util/pagination.js";
import { membershipPortsOf } from "./context.js";
import { projectPortsOf } from "../project/context.js";
import {
  membershipResource,
  orgResource,
  type OrgId,
  type UserId,
} from "@pixeltrace/authz";
import { create } from "@bufbuild/protobuf";
import { membershipToProto } from "./protoconv.js";
import { roleFromProto } from "../util/roles.js";
import { requireGrant } from "../auth/grant.js";
import { requireAuth } from "../auth/context.js";
import type { Membership } from "../types/types.js";
import type { CreateMembershipGrant, DeleteMembershipGrant } from "./ports.js";

/**
 * This file contains the implementation of `pixeltrace.mgmt.v1.MembershipService`.
 */

export async function createMembership(
  req: CreateMembershipRequest,
  ctx: HandlerContext,
): Promise<CreateMembershipResponse> {
  const principal = requireAuth(ctx);
  const ports = membershipPortsOf(ctx);
  const props = requireParam(req.props);
  const role = roleFromProto(props.role);
  const { orgId, userId } = requireKey(req.key);

  // Authorize before touching the store to prevent user-existence and
  // user-is-member oracles.
  const grant = requireGrant(
    principal,
    "membership.create",
    membershipResource(orgId, userId, role),
  );

  // The store would reject an unknown user with a foreign-key failure, which
  // reads as an Internal error; catch that here and return the more appropriate
  // NotFound.
  if (!(await ports.memberships.userExists(userId, ctx.requestHeader))) {
    throw new ConnectError("createMembership: user not found", Code.NotFound);
  }

  const existing = await ports.memberships.getMembership(
    orgId,
    userId,
    ctx.requestHeader,
  );
  if (existing) {
    throw new ConnectError(
      "createMembership: updates should go through update route",
      Code.AlreadyExists,
    );
  }

  return create(CreateMembershipResponseSchema, {
    membership: membershipToProto(
      await ports.memberships.createMembership(grant, ctx.requestHeader),
    ),
  });
}

export async function getMembership(
  req: GetMembershipRequest,
  ctx: HandlerContext,
): Promise<GetMembershipResponse> {
  const principal = requireAuth(ctx);
  const ports = membershipPortsOf(ctx);
  const { orgId, userId } = requireKey(req.key);

  // Authorization compares against the member's current role, so read it first.
  const mem = await ports.memberships.getMembership(
    orgId,
    userId,
    ctx.requestHeader,
  );
  if (!mem) {
    throw new ConnectError("getMembership: not found", Code.NotFound);
  }

  // Now that we know, throw before returning the answer (if necessary).
  requireGrant(
    principal,
    "membership.read",
    membershipResource(orgId, userId, mem.role),
  );

  return create(GetMembershipResponseSchema, {
    membership: membershipToProto(mem),
  });
}

export async function listMemberships(
  req: ListMembershipsRequest,
  ctx: HandlerContext,
): Promise<ListMembershipsResponse> {
  const principal = requireAuth(ctx);
  const orgId = requireOrgId(req.orgId?.id);
  const memberships = membershipPortsOf(ctx).memberships;
  const grant = requireGrant(principal, "org.list_members", orgResource(orgId));
  const { items, nextPageToken } = await listPage(
    pageParams(req.page),
    (page) => memberships.listMemberships(grant, page, ctx.requestHeader),
  );

  return create(ListMembershipsResponseSchema, {
    memberships: items.map(membershipToProto),
    page: { nextPageToken: nextPageToken ?? "" },
  });
}

export async function updateMembership(
  req: UpdateMembershipRequest,
  ctx: HandlerContext,
): Promise<UpdateMembershipResponse> {
  const principal = requireAuth(ctx);
  const { orgId, userId } = requireKey(req.key);
  const ports = membershipPortsOf(ctx);

  // Authorization compares against the member's current role, so read it first.
  const existing = await ports.memberships.getMembership(
    orgId,
    userId,
    ctx.requestHeader,
  );
  if (!existing) {
    throw new ConnectError("updateMembership: not found", Code.NotFound);
  }

  const existingRes = membershipResource(orgId, userId, existing.role);
  const selected = maskSelector(req.updateMask);
  if (!selected(MembershipPropsSchema.field.role)) {
    // Nothing mutable was selected; this is effectively a read.
    requireGrant(principal, "membership.read", existingRes);
    return create(UpdateMembershipResponseSchema, {
      membership: membershipToProto(existing),
    });
  }

  // A role change is a revocation of the old role plus a grant of the new one.
  const newRole = roleFromProto(requireParam(req.props).role);
  const newRes = membershipResource(orgId, userId, newRole);
  const revoke = requireGrant(principal, "membership.delete", existingRes);
  const grant = requireGrant(principal, "membership.create", newRes);

  let mem: Membership | undefined;
  if (existing.role === "owner" && newRole !== "owner") {
    // Demoting an owner can leave the org with none. Mint the inverse pair up
    // front too — revoke the new role, grant owner back — so demoteOrgOwner can
    // reinstate the owner if a concurrent leave beats us to the last one.
    const revert = {
      revoke: requireGrant(principal, "membership.delete", newRes),
      grant: requireGrant(principal, "membership.create", existingRes),
    };
    mem = await demoteOrgOwner(orgId, { revoke, grant }, revert, ctx);
  } else {
    mem = await ports.memberships.updateMembership(
      revoke,
      grant,
      ctx.requestHeader,
    );
  }
  if (!mem) {
    throw new ConnectError("updateMembership: not found", Code.NotFound);
  }

  return create(UpdateMembershipResponseSchema, {
    membership: membershipToProto(mem),
  });
}

export async function deleteMembership(
  req: DeleteMembershipRequest,
  ctx: HandlerContext,
): Promise<DeleteMembershipResponse> {
  const principal = requireAuth(ctx);
  const { orgId, userId } = requireKey(req.key);
  const ports = membershipPortsOf(ctx);

  // Authorization compares against the member's current role, so read it first.
  const existing = await ports.memberships.getMembership(
    orgId,
    userId,
    ctx.requestHeader,
  );
  if (!existing) {
    throw new ConnectError("deleteMembership: not found", Code.NotFound);
  }

  const existingRes = membershipResource(orgId, userId, existing.role);
  const revoke = requireGrant(principal, "membership.delete", existingRes);

  let deleted: boolean;
  if (existing.role === "owner") {
    // Removing an owner can leave the org with none. Mint the inverse up front
    // too — recreate the owner membership — so removeOrgOwner can reinstate it
    // if a concurrent leave beats us to the last one.
    const revert = requireGrant(principal, "membership.create", existingRes);
    deleted = await removeOrgOwner(orgId, revoke, revert, ctx);
  } else {
    deleted = await ports.memberships.deleteMembership(
      revoke,
      ctx.requestHeader,
    );
  }
  if (!deleted) {
    throw new ConnectError("deleteMembership: not found", Code.NotFound);
  }

  await projectPortsOf(ctx).projects.clearOrgProjectRoles(
    orgId,
    userId,
    ctx.requestHeader,
  );

  return create(DeleteMembershipResponseSchema, {});
}

/**
 * Validates that a request carries a well-formed membership key and returns it.
 */
function requireKey(key: MembershipKey | undefined): {
  orgId: OrgId;
  userId: UserId;
} {
  return {
    orgId: requireOrgId(key?.orgId?.id),
    userId: requireUserId(key?.userId?.id),
  };
}

/**
 * Removes an owner membership while upholding the org-owner invariant: an
 * organization must always retain at least one owner. `revoke` authorizes the
 * removal; `revert` authorizes putting the owner back. If a concurrent removal
 * takes the last owner first, this reinstates the owner (via `revert`) and
 * fails, so the org is never left ownerless.
 */
async function removeOrgOwner(
  orgId: OrgId,
  revoke: DeleteMembershipGrant,
  revert: CreateMembershipGrant,
  ctx: HandlerContext,
): Promise<boolean> {
  const memberships = membershipPortsOf(ctx).memberships;
  const headers = ctx.requestHeader;
  if ((await memberships.countOwners(orgId, headers)) <= 1) {
    throw lastOwnerError();
  }

  const deleted = await memberships.deleteMembership(revoke, headers);

  // Check again after the deletion if there are now zero owners, and revert if
  // so. This catches a race where the only two owners of an org each remove
  // themselves simultaneously, so they each pass the first owner count check at
  // the same time.
  if (deleted && (await memberships.countOwners(orgId, headers)) === 0) {
    await memberships.createMembership(revert, headers);
    throw lastOwnerError();
  }
  return deleted;
}

/**
 * Demotes an owner while upholding the invariant that the last owner cannot be
 * removed.
 */
async function demoteOrgOwner(
  orgId: OrgId,
  forward: RolePair,
  revert: RolePair,
  ctx: HandlerContext,
): Promise<Membership | undefined> {
  const memberships = membershipPortsOf(ctx).memberships;
  const headers = ctx.requestHeader;

  if ((await memberships.countOwners(orgId, headers)) <= 1) {
    throw lastOwnerError();
  }
  const updated = await memberships.updateMembership(
    forward.revoke,
    forward.grant,
    headers,
  );
  if (updated && (await memberships.countOwners(orgId, headers)) === 0) {
    await memberships.updateMembership(revert.revoke, revert.grant, headers);
    throw lastOwnerError();
  }
  return updated;
}

function lastOwnerError(): ConnectError {
  return new ConnectError(
    "cannot remove the last owner of an organization",
    Code.FailedPrecondition,
  );
}

/** A membership mutation and its inverse: `revoke` removes the old role, `grant`
 * writes the new one. */
interface RolePair {
  revoke: DeleteMembershipGrant;
  grant: CreateMembershipGrant;
}
