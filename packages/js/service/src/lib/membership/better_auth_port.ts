import { kRoles, type OrgId, type Role, type UserId } from "@pixeltrace/authz";
import { APIError } from "better-auth/api";
import type { Auth } from "../auth/create-auth";
import type { Membership } from "../types/types";
import {
  decodeCursor,
  encodeCursor,
  resolvePageSize,
} from "../util/pagination";
import type { MembershipPorts, MembershipStore } from "./ports";

/**
 * Validates a role string read back from Better Auth.
 */
function toRole(value: string, context: string): Role {
  if ((kRoles as readonly string[]).includes(value)) {
    return value as Role;
  }
  throw new Error(`${context}: unrecognized role from Better Auth: "${value}"`);
}

/** Whether `err` is a Better Auth error carrying the given `body.code`. */
function hasErrorCode(err: unknown, ...codes: string[]): boolean {
  return (
    err instanceof APIError &&
    typeof err.body?.code === "string" &&
    codes.includes(err.body.code)
  );
}

/** Offset cursor over an org's members. */
interface MemberCursor {
  offset: number;
}

function isErrorNonMember(err: unknown): boolean {
  return hasErrorCode(
    err,
    "YOU_ARE_NOT_A_MEMBER_OF_THIS_ORGANIZATION",
    "ORGANIZATION_NOT_FOUND",
  );
}

function makeBetterAuthMembershipStore(auth: Auth): MembershipStore {
  return {
    getMembership: async (orgId, userId, headers) => {
      let members;
      try {
        ({ members } = await auth.api.listMembers({
          headers,
          query: {
            organizationId: orgId,
            filterField: "userId",
            filterOperator: "eq",
            filterValue: userId,
          },
        }));
      } catch (err) {
        if (isErrorNonMember(err)) {
          return undefined;
        }
        throw err;
      }
      const member = members[0];
      return member
        ? {
            orgId,
            userId,
            role: toRole(member.role, "getMembership"),
            createdAt: member.createdAt,
          }
        : undefined;
    },

    userExists: async (userId) => {
      // No headers: this is an existence check on a user, not a read of one.
      const { internalAdapter } = await auth.$context;
      return (await internalAdapter.findUserById(userId)) !== null;
    },

    listMemberships: async (grant, page, headers) => {
      const orgId = grant.resource.id;
      const size = resolvePageSize(page);
      // Better Auth's member list is offset-paged, so that is what the cursor
      // carries. Ordering by createdAt keeps a page stable against later joins;
      // a member removed mid-listing can still shift a row across the seam.
      const offset = decodeCursor<MemberCursor>(page.pageToken)?.offset ?? 0;
      const { members, total } = await auth.api.listMembers({
        headers,
        query: {
          organizationId: orgId,
          limit: size,
          offset,
          sortBy: "createdAt",
          sortDirection: "asc",
        },
      });

      const items: Membership[] = members.map((member) => ({
        orgId,
        userId: member.userId as UserId,
        role: toRole(member.role, "listMemberships"),
        createdAt: member.createdAt,
      }));
      const next = offset + items.length;
      return {
        items,
        nextPageToken:
          next < total ? encodeCursor({ offset: next } as MemberCursor) : undefined,
      };
    },

    countOwners: async (orgId) => {
      // Counted through the adapter rather than the session-scoped member list:
      // the service re-checks the owner count *after* a removal, and by then the
      // caller may have just removed themselves out of the org.
      const { adapter } = await auth.$context;
      return adapter.count({
        model: "member",
        where: [
          { field: "organizationId", value: orgId },
          { field: "role", value: "owner" },
        ],
      });
    },

    createMembership: async (grant, headers) => {
      const { org, userId, role } = grant.resource;
      const created = await auth.api.addMember({
        body: { userId, organizationId: org, role },
      });
      if (!created) {
        throw new Error("createMembership: Better Auth returned no member");
      }
      return {
        orgId: org,
        userId,
        role: toRole(created.role, "createMembership"),
        createdAt: created.createdAt,
      };
    },

    updateMembership: async (revoke, grant, headers) => {
      const { org, userId, role } = grant.resource;
      if (revoke.resource.org !== org || revoke.resource.userId !== userId) {
        throw new Error(
          "updateMembership: revoke and grant target different memberships",
        );
      }

      // user id -> member id
      const { members } = await auth.api.listMembers({
        headers,
        query: {
          organizationId: org,
          filterField: "userId",
          filterOperator: "eq",
          filterValue: userId,
        },
      });
      const existing = members[0];
      if (!existing) {
        return undefined;
      }

      const updated = await auth.api.updateMemberRole({
        headers,
        body: { memberId: existing.id, organizationId: org, role },
      });
      return updated
        ? {
            orgId: org,
            userId,
            role: toRole(updated.role, "updateMembership"),
            createdAt: updated.createdAt,
          }
        : undefined;
    },

    deleteMembership: async (grant, headers) => {
      const { org, userId } = grant.resource;

      // user id -> member id
      const { members } = await auth.api.listMembers({
        headers,
        query: {
          organizationId: org,
          filterField: "userId",
          filterOperator: "eq",
          filterValue: userId,
        },
      });
      const existing = members[0];
      if (!existing) {
        return false;
      }

      const session = await auth.api.getSession({ headers });
      if (session?.user.id === userId) {
        // Better Auth rejects remove-self; that is done by leaving instead.
        await auth.api.leaveOrganization({
          headers,
          body: { organizationId: org },
        });
      } else {
        await auth.api.removeMember({
          headers,
          body: { memberIdOrEmail: existing.id, organizationId: org },
        });
      }

      return true;
    },
  };
}

export function makeBetterAuthMembershipPorts(auth: Auth): MembershipPorts {
  return { memberships: makeBetterAuthMembershipStore(auth) };
}
