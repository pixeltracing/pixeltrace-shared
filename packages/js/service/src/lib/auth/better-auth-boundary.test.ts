import { describe, expect, it } from "vitest";
import {
  authorize,
  membershipResource,
  userPrincipal,
  type Grant,
  type MembershipResource,
  type OrgId,
  type ProjectId,
  type Role,
  type UserId,
} from "@pixeltrace/authz";
import type { Auth } from "./create-auth.js";
import { resolveAuthContext } from "./interceptor.js";
import { makeBetterAuthMembershipPorts } from "../membership/better_auth_port.js";

// This file contains tests for role data coming from Better Auth, which stores
// roles as free-form, comma-delimited strings. The roles must be resolved into
// our authz model and fail closed on anything we don't recognize.

function fakeAuth(opts: {
  userId?: string;
  activeOrg?: string;
  role?: string;
  member?: { role: string } | null;
}): Auth {
  const record =
    opts.member != null
      ? { id: "mbr_1", role: opts.member.role, createdAt: new Date(0) }
      : null;
  return {
    api: {
      getSession: async () =>
        opts.userId
          ? {
              user: { id: opts.userId },
              session: { activeOrganizationId: opts.activeOrg },
            }
          : null,
      getActiveMemberRole: async () => (opts.role ? { role: opts.role } : null),
      listMembers: async () => ({ members: record ? [record] : [] }),
      addMember: async () => record,
      updateMemberRole: async () => record,
    },
  } as unknown as Auth;
}

describe("resolveAuthContext (session + role resolution)", () => {
  it("populates principal.projectRoles", async () => {
    const auth = fakeAuth({
      userId: "user_a",
      activeOrg: "org_a",
      role: "member",
    });

    const overrides: Record<ProjectId, Role> = {
      ["proj_x" as ProjectId]: "admin",
    };
    let sawUser: string | undefined;
    const ctx = await resolveAuthContext(
      auth,
      new Headers(),
      async (userId) => {
        sawUser = userId;
        return overrides;
      },
    );

    expect(sawUser).toBe("user_a");
    expect(ctx?.principal.projectRoles).toEqual({ proj_x: "admin" });
    expect(ctx?.principal.roles).toEqual({ org_a: "member" });
  });

  it("does not call lookup when there is no session", async () => {
    const auth = fakeAuth({}); // getSession returns null
    let called = false;
    const ctx = await resolveAuthContext(auth, new Headers(), async () => {
      called = true;
      return {};
    });
    expect(ctx).toBeNull();
    expect(called).toBe(false);
  });
});

describe("better-auth membership role validation", () => {
  const kOrg = "org_a" as OrgId;
  const kUser = "user_target" as UserId;
  const kActor = "user_owner" as UserId;

  function memberships(member: { role: string } | null) {
    return makeBetterAuthMembershipPorts(fakeAuth({ member })).memberships;
  }

  function grantFor<A extends "membership.create" | "membership.delete">(
    action: A,
    role: Role,
  ): Grant<A, MembershipResource> {
    const owner = userPrincipal(kActor, { [kOrg]: "owner" });
    const grant = authorize(
      owner,
      action,
      membershipResource(kOrg, kUser, role),
    );
    if (!grant) {
      throw new Error(`test setup: owner unexpectedly denied ${action}`);
    }
    return grant;
  }

  it("reads back a recognized single role", async () => {
    const got = await memberships({ role: "owner" }).getMembership(
      kOrg,
      kUser,
      new Headers(),
    );
    expect(got?.role).toBe("owner");
  });

  // Better Auth allows comma-joined multi-role strings; such a value has
  // rankOf() === -1, which would make an owner appear to outrank nobody and be
  // removable by any admin. We should fail closed rather than coerce it or
  // attempt to extract a single role.
  it("fails closed reading a multi-role string (getMembership)", async () => {
    await expect(
      memberships({ role: "owner,admin" }).getMembership(
        kOrg,
        kUser,
        new Headers(),
      ),
    ).rejects.toThrow(/unrecognized role/);
  });

  it("fails closed reading a multi-role string (createMembership)", async () => {
    await expect(
      memberships({ role: "owner,admin" }).createMembership(
        grantFor("membership.create", "owner"),
        new Headers(),
      ),
    ).rejects.toThrow(/unrecognized role/);
  });

  it("fails closed reading a multi-role string (updateMembership)", async () => {
    await expect(
      memberships({ role: "owner,admin" }).updateMembership(
        grantFor("membership.delete", "member"),
        grantFor("membership.create", "owner"),
        new Headers(),
      ),
    ).rejects.toThrow(/unrecognized role/);
  });
});
