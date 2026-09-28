import { describe, expect, it } from "vitest";
import type { OrgId, ProjectId, Role, UserId } from "./definitions";
import { userPrincipal, withProjectRole } from "./definitions";

const kUser: UserId = "user_test";
const kOrg: OrgId = "org_test";
const kProj: ProjectId = "proj_test";
const kOtherProj: ProjectId = "proj_other";

describe("userPrincipal", () => {
  it("builds a user principal with empty project overrides by default", () => {
    const u = userPrincipal(kUser, { [kOrg]: "member" });
    expect(u).toEqual({
      kind: "user",
      id: kUser,
      roles: { [kOrg]: "member" },
      projectRoles: {},
    });
  });

  it("uses supplied project overrides", () => {
    const u = userPrincipal(kUser, { [kOrg]: "viewer" }, { [kProj]: "admin" });
    expect(u.projectRoles).toEqual({ [kProj]: "admin" });
  });
});

describe("withProjectRole", () => {
  const base = userPrincipal(kUser, { [kOrg]: "member" });

  it("adds an override for a project", () => {
    expect(base.projectRoles).toEqual({});
    const u = withProjectRole(base, kProj, "admin");
    expect(u.projectRoles).toEqual({ [kProj]: "admin" });
    expect(base.projectRoles).toEqual({});
  });

  it("overwrites an existing override for the same project", () => {
    const u = withProjectRole(
      withProjectRole(base, kProj, "viewer"),
      kProj,
      "admin",
    );
    expect(u.projectRoles).toEqual({ [kProj]: "admin" });
  });

  it("leaves overrides for other projects untouched", () => {
    const u = withProjectRole(
      withProjectRole(base, kOtherProj, "viewer"),
      kProj,
      "admin",
    );
    expect(u.projectRoles).toEqual({
      [kProj]: "admin",
      [kOtherProj]: "viewer",
    });
  });

  it("clears the override when role is null", () => {
    const withOverride = withProjectRole(base, kProj, "admin");
    const cleared = withProjectRole(withOverride, kProj, null);
    expect(cleared.projectRoles).toEqual({});
  });

  it("is a no-op when clearing a project that has no override", () => {
    const u = withProjectRole(base, kProj, null);
    expect(u.projectRoles).toEqual({});
  });

  it("does not affect org-level roles", () => {
    const u = withProjectRole(base, kProj, "admin");
    expect(u.roles).toEqual({ [kOrg]: "member" });
  });

  it("does not mutate the input principal", () => {
    const u = withProjectRole(base, kProj, "admin");
    expect(u).not.toBe(base);
    expect(base.projectRoles).toEqual({});
    // Mutating the result must not leak back into the input.
    (u.projectRoles as Record<ProjectId, Role>)[kOtherProj] = "viewer";
    expect(base.projectRoles).toEqual({});
  });
});
