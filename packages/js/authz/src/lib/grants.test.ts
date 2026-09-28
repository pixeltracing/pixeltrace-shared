import { describe, expect, it } from "vitest";
import type {
  Action,
  GrantableAction,
  OrgId,
  ProjectId,
  Resource,
  Role,
  SiteKeyId,
  SiteKeyPrincipal,
  UserId,
  UserPrincipal,
} from "./definitions";
import {
  kAllActions,
  kGrantableActions,
  kGrants,
  kRoles,
  outranks,
  projectMembershipResource,
  projectResource,
  siteKeyPrincipal,
  userPrincipal,
  withProjectRole,
} from "./definitions";
import type { Grant } from "./ops";
import { authorize, can } from "./ops";

// Convenience ids
const kTestOrgA: OrgId = "org_test";
const kTestOrgB: OrgId = "org_other";
const kTestProj: ProjectId = "proj_test";
const kTestUser: UserId = "user_test";
const kOtherUser: UserId = "user_other";

// Make a new User belonging to the given organization
function makeUserOf(role: Role, org: OrgId = kTestOrgA): UserPrincipal {
  return userPrincipal(kTestUser, { [org]: role });
}

// Adds a user to the given project with the given role; returns the new
// principal.
function addToProject(
  user: UserPrincipal,
  role: Role,
  project: ProjectId = kTestProj,
): UserPrincipal {
  return withProjectRole(user, project, role);
}

// Makes a Resource valid for receiving action
function makeResourceFor(action: Action, org: OrgId = kTestOrgA): Resource {
  if (action.startsWith("org.")) {
    return { kind: "org", id: org };
  }
  if (action.startsWith("membership.")) {
    return { kind: "membership", org, userId: kOtherUser, role: "member" };
  }
  if (action.startsWith("project.membership.")) {
    // Target is another user holding `member`, so rank checks have something
    // below owner/admin to compare against.
    return projectMembershipResource(org, kTestProj, kOtherUser, "member");
  }
  if (action.startsWith("session.")) {
    return {
      kind: "session",
      org,
      project: kTestProj,
      id: "sess_1",
    };
  }
  // project.* and ingest.write both act on a project.
  return { kind: "project", org, id: kTestProj };
}

// Expected policies per role. This is deliberately not derived from definitions
// so that we can encode the full expectations here, and catch any drift.
const EXPECTED_ALLOW: Record<Role, readonly Action[]> = {
  viewer: [
    "org.read",
    "org.list_projects",
    "project.read",
    "session.read",
    "session.list",
  ],
  member: [
    "org.read",
    "org.list_projects",
    "membership.read",
    "org.list_members",
    "project.read",
    "session.read",
    "session.list",
    "project.create",
    "project.update",
    "project.delete",
    "session.update",
    "session.delete",
    "session.restore",
    "session.clear",
    "project.ingest.read_credentials",
    "project.ingest.manage_credentials",
    "project.list_members",
    "project.membership.read",
  ],
  admin: [
    "org.read",
    "org.list_projects",
    "membership.read",
    "org.list_members",
    "project.read",
    "session.read",
    "session.list",
    "project.create",
    "project.update",
    "project.delete",
    "session.update",
    "session.delete",
    "session.restore",
    "session.clear",
    "project.ingest.read_credentials",
    "project.ingest.manage_credentials",
    "project.list_members",
    "project.membership.read",
    "org.invite_via_email",
    "membership.create",
    "membership.delete",
    "project.membership.create",
    "project.membership.delete",
  ],
  owner: [
    "org.read",
    "org.list_projects",
    "membership.read",
    "org.list_members",
    "project.read",
    "session.read",
    "session.list",
    "project.create",
    "project.update",
    "project.delete",
    "session.update",
    "session.delete",
    "session.restore",
    "session.clear",
    "project.ingest.read_credentials",
    "project.ingest.manage_credentials",
    "project.list_members",
    "project.membership.read",
    "org.invite_via_email",
    "membership.create",
    "membership.delete",
    "project.membership.create",
    "project.membership.delete",
    "org.update",
    "org.delete",
  ],
};

// Actions for which a non-admin user must hold a role on the resource's project
// (org membership alone is not enough).
const ACTIONS_REQUIRING_PROJECT_ROLE: readonly Action[] = [
  "project.read",
  "project.update",
  "project.delete",
  "project.ingest.read_credentials",
  "project.ingest.manage_credentials",
  "session.read",
  "session.list",
  "session.update",
  "session.delete",
  "session.restore",
  "session.clear",
  "project.list_members",
  "project.membership.read",
  "project.membership.create",
  "project.membership.delete",
];

describe("check all expected user roles+actions", () => {
  for (const role of kRoles) {
    for (const action of kAllActions) {
      const expected = EXPECTED_ALLOW[role].includes(action);
      it(`${role} ${expected ? "can" : "cannot"} ${action}`, () => {
        const user = addToProject(makeUserOf(role), role);
        const decision = can(user, action, makeResourceFor(action));
        expect(decision.allowed).toBe(expected);
      });
    }
  }
});

describe("check all cross-org boundaries", () => {
  for (const role of kRoles) {
    for (const action of kAllActions) {
      it(`${role} in org A cannot ${action} on an org-B resource`, () => {
        const userInA = makeUserOf(role, kTestOrgA);
        const resourceInB = makeResourceFor(action, kTestOrgB);
        const decision = can(userInA, action, resourceInB);
        // All actions denied cross-org, due to missing membership.
        expect(decision.allowed).toBe(false);
        expect(decision.reason).toMatch(/membership/i);
      });
    }
  }
});

describe("check all project membership boundaries", () => {
  for (const role of kRoles) {
    for (const action of kGrantableActions) {
      const orgAllows = EXPECTED_ALLOW[role].includes(action);
      const requiresProjectRole =
        ACTIONS_REQUIRING_PROJECT_ROLE.includes(action);
      const superuser = role === "owner" || role === "admin";
      const expectAllowed = requiresProjectRole ? superuser : orgAllows;

      it(`${role} (no project role) ${expectAllowed ? "can" : "cannot"} ${action}`, () => {
        // User was invited to the org but never added to the project.
        const user = makeUserOf(role, kTestOrgA);
        const decision = can(user, action, makeResourceFor(action));
        expect(decision.allowed).toBe(expectAllowed);
        if (requiresProjectRole && !superuser) {
          expect(decision.reason).toMatch(/membership in resource project/i);
        }
      });
    }
  }
});

describe("check all role rankings", () => {
  // Deliberately hardcoded rather than derived from kRoles, so that reordering
  // or extending the role hierarchy fails these tests until updated here.
  const kExpectedOrder: readonly Role[] = [
    "viewer",
    "member",
    "admin",
    "owner",
  ];

  it("roles are declared lowest- to highest-privilege", () => {
    expect(kRoles).toEqual(kExpectedOrder);
  });

  for (const [i, a] of kExpectedOrder.entries()) {
    for (const [j, b] of kExpectedOrder.entries()) {
      const expected = i > j;
      it(`${a} ${expected ? "outranks" : "does not outrank"} ${b}`, () => {
        expect(outranks(a, b)).toBe(expected);
      });
    }
  }
});

describe("membership role hierarchy", () => {
  function otherMember(role: Role): Resource {
    return { kind: "membership", org: kTestOrgA, userId: kOtherUser, role };
  }

  // Independent oracle for the relational layer, deliberately not expressed via
  // canGrantRole/canRevokeRole (the code under test): only admins and owners may
  // manage other members' memberships at all. The rank comparison uses the
  // separately-tested `outranks`, so a bug in either predicate is still caught.
  const canManageMemberships = (r: Role) => r === "admin" || r === "owner";

  describe("appoint: create up to and including your own role", () => {
    for (const actor of kRoles) {
      for (const target of kRoles) {
        // Appoint is allowed up to and including your own rank (>=), i.e. the
        // target does not outrank the actor.
        const allowed = canManageMemberships(actor) && !outranks(target, actor);
        it(`${actor} ${allowed ? "can" : "cannot"} create a ${target}`, () => {
          expect(
            can(makeUserOf(actor), "membership.create", otherMember(target))
              .allowed,
          ).toBe(allowed);
        });
      }
    }
  });

  describe("remove: delete only members strictly below you", () => {
    for (const actor of kRoles) {
      for (const target of kRoles) {
        // Removal is allowed only strictly below your own rank (>).
        const allowed = canManageMemberships(actor) && outranks(actor, target);
        it(`${actor} ${allowed ? "can" : "cannot"} delete a ${target}`, () => {
          expect(
            can(makeUserOf(actor), "membership.delete", otherMember(target))
              .allowed,
          ).toBe(allowed);
        });
      }
    }
  });

  describe("self-removal is always allowed", () => {
    function selfMembership(role: Role): Resource {
      return { kind: "membership", org: kTestOrgA, userId: kTestUser, role };
    }

    for (const role of kRoles) {
      it(`a ${role} can remove their own membership`, () => {
        expect(
          can(makeUserOf(role), "membership.delete", selfMembership(role))
            .allowed,
        ).toBe(true);
      });
    }

    it("does not apply cross-org", () => {
      const userInA = makeUserOf("owner", kTestOrgA);
      const ownEdgeInB: Resource = {
        kind: "membership",
        org: kTestOrgB,
        userId: kTestUser,
        role: "owner",
      };
      expect(can(userInA, "membership.delete", ownEdgeInB).allowed).toBe(false);
    });
  });
});

describe("project role overrides org role for that project", () => {
  function userWith(orgRole: Role, projectRole: Role): UserPrincipal {
    return addToProject(makeUserOf(orgRole), projectRole);
  }

  it("org viewer + project member can delete a session in that project", () => {
    const u = userWith("viewer", "member");
    expect(
      can(u, "session.delete", makeResourceFor("session.delete")).allowed,
    ).toBe(true);
  });

  it("org member + project viewer cannot delete a session in that project", () => {
    const u = userWith("member", "viewer");
    const d = can(u, "session.delete", makeResourceFor("session.delete"));
    expect(d.allowed).toBe(false);
    expect(d.reason).toMatch(/permission denied/i);
  });

  it("project role does not widen non-scoped access (org role still governs)", () => {
    // Project admin does not grant org-level org.update; org role is
    // member.
    const u = userWith("member", "admin");
    expect(can(u, "org.update", makeResourceFor("org.update")).allowed).toBe(
      false,
    );
  });

  it("superuser org role ignores a downgrading project override", () => {
    const u = withProjectRole(makeUserOf("admin"), kTestProj, "viewer");
    expect(
      can(u, "session.delete", makeResourceFor("session.delete")).allowed,
    ).toBe(true);
  });

  it("regular user with no project override is denied by default", () => {
    // A cleared (null) override leaves the org member without project
    // membership, so the project-gated action is denied.
    const u = withProjectRole(
      addToProject(makeUserOf("member"), "member"),
      kTestProj,
      null,
    );
    expect(
      can(u, "session.delete", makeResourceFor("session.delete")).allowed,
    ).toBe(false);
  });
});

describe("project membership management", () => {
  const kOtherProj: ProjectId = "proj_other";

  // An org *member* (not an org-admin) elevated to admin on kTestProj only.
  const projectAdmin = withProjectRole(
    makeUserOf("member"),
    kTestProj,
    "admin",
  );

  // A membership edge to appoint/remove: `role` is the target's role, on the
  // named project.
  const edge = (role: Role, project: ProjectId = kTestProj) =>
    projectMembershipResource(kTestOrgA, project, kOtherUser, role);

  it("lets a project-admin appoint a member of their own project", () => {
    expect(
      can(projectAdmin, "project.membership.create", edge("member")).allowed,
    ).toBe(true);
  });

  it("forbids a project-admin appointing above their own project role", () => {
    const d = can(projectAdmin, "project.membership.create", edge("owner"));
    expect(d.allowed).toBe(false);
    expect(d.reason).toMatch(/above your own/i);
  });

  it("forbids a project-admin removing a peer admin", () => {
    const d = can(projectAdmin, "project.membership.delete", edge("admin"));
    expect(d.allowed).toBe(false);
    expect(d.reason).toMatch(/at or above your own/i);
  });

  it("lets a project-admin remove a member below them", () => {
    expect(
      can(projectAdmin, "project.membership.delete", edge("member")).allowed,
    ).toBe(true);
  });

  it("denies a project-member any membership mutation", () => {
    const projectMember = withProjectRole(
      makeUserOf("member"),
      kTestProj,
      "member",
    );
    expect(
      can(projectMember, "project.membership.create", edge("viewer")).allowed,
    ).toBe(false);
    // ...but a project-member may read the roster.
    expect(
      can(projectMember, "project.membership.read", edge("member")).allowed,
    ).toBe(true);
  });

  it("lets an org superuser manage a project they hold no project role in", () => {
    const orgAdmin = makeUserOf("admin"); // no projectRoles entry
    expect(
      can(orgAdmin, "project.membership.create", edge("member")).allowed,
    ).toBe(true);
  });

  it("confines a project-admin's authority to their own project", () => {
    expect(
      can(projectAdmin, "project.membership.create", edge("member", kOtherProj))
        .allowed,
    ).toBe(false);
  });

  it("lets a user drop their own project membership regardless of rank", () => {
    const self = withProjectRole(makeUserOf("member"), kTestProj, "owner");
    const ownEdge = projectMembershipResource(
      kTestOrgA,
      kTestProj,
      kTestUser,
      "owner",
    );
    expect(can(self, "project.membership.delete", ownEdge).allowed).toBe(true);
  });

  it("authorizes listing members against the project resource (project-member)", () => {
    const projectMember = withProjectRole(
      makeUserOf("member"),
      kTestProj,
      "member",
    );
    expect(
      can(
        projectMember,
        "project.list_members",
        projectResource(kTestOrgA, kTestProj),
      ).allowed,
    ).toBe(true);
  });

  it("denies listing to a project-viewer (project.list_members is member+)", () => {
    const projectViewer = withProjectRole(
      makeUserOf("member"),
      kTestProj,
      "viewer",
    );
    expect(
      can(
        projectViewer,
        "project.list_members",
        projectResource(kTestOrgA, kTestProj),
      ).allowed,
    ).toBe(false);
  });

  it("does not let a project role grant org-membership management", () => {
    // project-admin is only an org member, so org membership.create is denied.
    expect(
      can(projectAdmin, "membership.create", {
        kind: "membership",
        org: kTestOrgA,
        userId: kOtherUser,
        role: "member",
      }).allowed,
    ).toBe(false);
  });
});

describe("predefined grants matches the explicit allow-lists", () => {
  for (const role of kRoles) {
    it(`${role}'s grant set equals its expected allow-list`, () => {
      const actual = [...kGrants[role]].sort();
      const expected = [...EXPECTED_ALLOW[role]].sort();
      expect(actual).toEqual(expected);
    });
  }
});

// This action is structurally only allowed for ingestion principals, not users.
describe("ingest.write is granted by no role", () => {
  for (const role of kRoles) {
    it(`${role} cannot ingest.write`, () => {
      expect(
        can(makeUserOf(role), "ingest.write", makeResourceFor("ingest.write"))
          .allowed,
      ).toBe(false);
    });
  }
});

describe("org permission boundaries", () => {
  const kTestUserNoRoles: UserPrincipal = {
    kind: "user",
    id: kTestUser,
    roles: {},
    projectRoles: {},
  };

  it("owner in org A is denied on a resource owned by org B", () => {
    const ownerOfA = makeUserOf("owner", kTestOrgA);
    const resourceInA = makeResourceFor("project.delete", kTestOrgA);
    const resourceInB = makeResourceFor("project.delete", kTestOrgB);
    expect(can(ownerOfA, "project.delete", resourceInA).allowed).toBe(true);
    expect(can(ownerOfA, "project.delete", resourceInB).allowed).toBe(false);
  });

  it("a user with no membership in the resource's org is denied", () => {
    expect(
      can(kTestUserNoRoles, "project.read", makeResourceFor("project.read"))
        .allowed,
    ).toBe(false);
  });

  it("deny reason names the missing membership", () => {
    const d = can(
      kTestUserNoRoles,
      "project.read",
      makeResourceFor("project.read"),
    );
    expect(d.allowed).toBe(false);
    expect(d.reason).toMatch(/membership/i);
  });
});

describe("project-gated action on a non-project resource fails closed", () => {
  const orgRes: Resource = { kind: "org", id: kTestOrgA };
  const membershipRes: Resource = {
    kind: "membership",
    org: kTestOrgA,
    userId: kOtherUser,
    role: "member",
  };

  it("denies project.read on an org resource", () => {
    const d = can(makeUserOf("viewer"), "project.read", orgRes);
    expect(d.allowed).toBe(false);
    expect(d.reason).toMatch(/invalid resource type/i);
  });

  it("denies project.read on an org resource even for an org owner", () => {
    expect(can(makeUserOf("owner"), "project.read", orgRes).allowed).toBe(
      false,
    );
  });

  it("denies session.delete on an org resource", () => {
    expect(can(makeUserOf("owner"), "session.delete", orgRes).allowed).toBe(
      false,
    );
  });

  it("denies project.list_members on a membership resource", () => {
    expect(
      can(makeUserOf("admin"), "project.list_members", membershipRes).allowed,
    ).toBe(false);
  });
});

describe("site_key permissions", () => {
  const kTestSiteKey: SiteKeyId = "pubk_test";
  // `makeResourceFor("ingest.write")` targets `kTestProj`, so bind the key to it.
  const siteKey: SiteKeyPrincipal = siteKeyPrincipal(kTestSiteKey, kTestProj);

  it("is allowed ingest.write into its own project", () => {
    expect(
      can(siteKey, "ingest.write", makeResourceFor("ingest.write")).allowed,
    ).toBe(true);
  });

  it("is denied ingest.write into another project", () => {
    const otherProject: Resource = {
      kind: "project",
      org: kTestOrgA,
      id: "proj_other",
    };
    expect(can(siteKey, "ingest.write", otherProject).allowed).toBe(false);
  });

  for (const action of kGrantableActions) {
    it(`is denied ${action}`, () => {
      expect(can(siteKey, action, makeResourceFor(action)).allowed).toBe(false);
    });
  }
});

describe("grants", () => {
  it("returns a grant carrying the action and resource on allow", () => {
    const resource = makeResourceFor("session.delete");
    const member = addToProject(makeUserOf("member"), "member");
    const grant = authorize(member, "session.delete", resource);
    expect(grant).not.toBeNull();
    expect(grant?.action).toBe("session.delete");
    expect(grant?.resource).toEqual(resource);
  });

  it("returns null on deny", () => {
    expect(
      authorize(
        addToProject(makeUserOf("viewer"), "viewer"),
        "session.delete",
        makeResourceFor("session.delete"),
      ),
    ).toBeNull();

    expect(
      authorize(
        makeUserOf("owner"),
        "ingest.write",
        makeResourceFor("ingest.write"),
      ),
    ).toBeNull();
  });

  describe("site keys", () => {
    const kTestSiteKey: SiteKeyId = "pubk_test";
    // Bound to `kTestProj`, the project `makeResourceFor("ingest.write")` targets.
    const siteKey: SiteKeyPrincipal = siteKeyPrincipal(kTestSiteKey, kTestProj);

    it("mints a grant for ingest into the key's own project", () => {
      const proj = makeResourceFor("ingest.write");
      const grant = authorize(siteKey, "ingest.write", proj);
      expect(grant).not.toBeNull();
      expect(grant?.action).toBe("ingest.write");
      expect(grant?.resource).toEqual(proj);
    });

    it("mints no grant for ingest into another project", () => {
      const otherProject: Resource = {
        kind: "project",
        org: kTestOrgA,
        id: "proj_other",
      };
      expect(authorize(siteKey, "ingest.write", otherProject)).toBeNull();
    });
  });
});

// Type-level tests, enforced by typecheck, not runtime testing.
function _typeChecks() {
  const resource = makeResourceFor("session.delete");

  // @ts-expect-error: Grants cannot be constructed outside of the auth module.
  const _forged: Grant<"session.delete", Resource> = {
    action: "session.delete",
    resource,
  };
  void _forged;

  // @ts-expect-error: a ProjectId is not assignable where an OrgId is required
  const _badOrg: OrgId = kTestProj;
  void _badOrg;

  // @ts-expect-error: ingest.write is not grantable, so no role's kGrants set
  // (typed ReadonlySet<GrantableAction>) can ever contain it.
  const _badGrant: GrantableAction = "ingest.write";
  void _badGrant;
}
void _typeChecks;
