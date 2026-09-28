import {
  canGrantRole,
  canRevokeRole,
  isMembershipAction,
  isProjectMembershipAction,
  kGrants,
  orgOf,
  type Action,
  type Decision,
  type Principal,
  type ProjectId,
  type Resource,
  type Role,
  type GrantableAction,
  type SiteKeyPrincipal,
  type UserPrincipal,
} from "./definitions";

// Module-private brand. The symbol is unexported, so `__grant` is unnameable
// outside this file and no external literal can satisfy the `Grant` interface —
// grants can only be minted here. `unique symbol` keeps the key distinct in the
// type system; the runtime value lets us actually construct grants.
const __grant: unique symbol = Symbol("grant");

// A capability allowing action A to be performed on resource type R.
export interface Grant<A extends Action, R extends Resource> {
  readonly action: A;
  readonly resource: R;
  readonly [__grant]: true; // only this module can instantiate grants
}

export function authorize<A extends Action, R extends Resource>(
  principal: Principal,
  action: A,
  resource: R,
): Grant<A, R> | null {
  const decision = can(principal, action, resource);
  if (!decision.allowed) {
    return null;
  }
  return { action, resource, [__grant]: true };
}

export function can(
  principal: Principal,
  action: Action,
  resource: Resource,
): Decision {
  switch (principal.kind) {
    case "user":
      return canUser(principal, action, resource);
    case "site_key":
      return canSiteKey(principal, action, resource);
    default:
      // Force exhaustive switch:
      assertNever(principal);
  }
}

function canUser(
  user: UserPrincipal,
  action: Action,
  resource: Resource,
): Decision {
  // Tenant boundary: the user must belong to the org the resource is scoped to.
  const orgRole = user.roles[orgOf(resource)];
  if (!orgRole) {
    return no("no membership in resource org");
  }

  // Self-service exception: a user may always remove their own membership
  // (leave the org), regardless of role or rank.
  if (
    action === "membership.delete" &&
    resource.kind === "membership" &&
    resource.userId === user.id
  ) {
    return yes();
  }

  // The same self-leave exception at project scope: a user may always drop
  // their own per-project role.
  if (
    action === "project.membership.delete" &&
    resource.kind === "project_membership" &&
    resource.userId === user.id
  ) {
    return yes();
  }

  const scope = scopeOf(action, resource);
  if (scope.kind === "invalid") {
    return no("invalid resource type; no determinable scope");
  }

  const role = effectiveRole(user, orgRole, scope);
  if (!role) {
    return no("no membership in resource project");
  }

  // The cast is sound: a non-grantable action is never in a grant set, so
  // `has` correctly answers false for it.
  if (!kGrants[role].has(action as GrantableAction)) {
    return no(`permission denied`);
  }

  // Membership mutations are a special case: you may appoint a member up to
  // your own role (e.g. admins can create other admins), but only remove one
  // strictly below you (e.g. admins cannot remove admins).
  if (isMembershipAction(action)) {
    if (resource.kind !== "membership") {
      return no("membership action requires a membership resource");
    }

    switch (action) {
      case "membership.create":
        return canGrantRole(role, resource.role)
          ? yes()
          : no("cannot appoint a role above your own");
      case "membership.delete":
        return canRevokeRole(role, resource.role)
          ? yes()
          : no("cannot remove a member at or above your own role");
      case "membership.read":
        // Reading a membership carries no hierarchy constraint.
        return yes();
      default:
        return assertNever(action);
    }
  }

  // Project membership mutations mirror the org rules above, but `role` here is
  // the actor's *effective project* role (via effectiveRole), so a project-admin
  // may manage that project's members without any org-admin role.
  if (isProjectMembershipAction(action)) {
    if (resource.kind !== "project_membership") {
      return no("invalid resource type");
    }

    switch (action) {
      case "project.membership.create":
        return canGrantRole(role, resource.role)
          ? yes()
          : no("cannot appoint a role above your own");
      case "project.membership.delete":
        return canRevokeRole(role, resource.role)
          ? yes()
          : no("cannot remove a member at or above your own role");
      case "project.membership.read":
        return yes();
      default:
        return assertNever(action);
    }
  }

  return yes();
}

function canSiteKey(
  siteKey: SiteKeyPrincipal,
  action: Action,
  resource: Resource,
): Decision {
  if (action !== "ingest.write") {
    return no("site key may only ingest");
  }

  // Tenant boundary: a site key may ingest only into the one project it's bound
  // to.
  const project = projectOf(resource);
  if (!project) {
    return no("ingest resource is not scoped to a project");
  }
  if (project !== siteKey.projectId) {
    return no("site key may not ingest into another project");
  }

  return yes();
}

// The scope whose role governs an action on a given resource:
//  - "org": governed by org role, independent of any project.
//  - "project": governed by a role on `project`.
//  - "invalid": resource has no determinable scope
type OrgScope = { kind: "org" };
type ProjectScope = { kind: "project"; project: ProjectId };
type Scope = OrgScope | ProjectScope | { kind: "invalid" };

// Returns the role that should be used for the given principal in the given
// scope.
function effectiveRole(
  user: UserPrincipal,
  orgRole: Role,
  scope: OrgScope | ProjectScope,
): Role | null {
  if (isSuperuser(orgRole) || scope.kind === "org") {
    // org role is effective
    return orgRole;
  }

  // project role is effective
  return user.projectRoles[scope.project] ?? null;
}

// Determines which type of role-scope governs `action` on `resource`. E.g. a
// project-gated action requires a project-scoped resource.
function scopeOf(action: Action, resource: Resource): Scope {
  if (!isProjectGated(action)) {
    return { kind: "org" };
  }
  const project = projectOf(resource);
  if (!project) {
    return { kind: "invalid" };
  }
  return { kind: "project", project };
}

// Whether `action`'s permission is governed by the actor's per-project role.
function isProjectGated(action: Action): boolean {
  // `project.create` targets an org (no project exists yet), so it is org-gated
  // despite its `project.` prefix.
  if (action === "project.create") {
    return false;
  }
  return action.startsWith("project.") || action.startsWith("session.");
}

// The project a resource belongs to, or null if it is not project-scoped.
function projectOf(resource: Resource): ProjectId | null {
  switch (resource.kind) {
    case "project":
      return resource.id;
    case "session":
      return resource.project;
    case "project_membership":
      return resource.project;
    default:
      return null;
  }
}

function isSuperuser(orgRole: Role): boolean {
  return orgRole === "owner" || orgRole === "admin";
}

function yes(): Decision {
  return { allowed: true, reason: "" };
}

function no(reason: string): Decision {
  return { allowed: false, reason: reason };
}

function assertNever(x: never): never {
  throw new Error(`unhandled: ${JSON.stringify(x)}`);
}
