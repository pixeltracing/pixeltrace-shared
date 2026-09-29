import { customAlphabet } from "nanoid";

// -- Identifiers --

// Required id prefixes.
export const kIdPrefixes = {
  org: "org_",
  project: "proj_",
  user: "user_",
  siteKey: "pubk_",
  session: "sess_",
  projectTag: "tag_",
} as const;

export type OrgId = `${typeof kIdPrefixes.org}${string}`;
export type ProjectId = `${typeof kIdPrefixes.project}${string}`;
export type UserId = `${typeof kIdPrefixes.user}${string}`;
export type SiteKeyId = `${typeof kIdPrefixes.siteKey}${string}`;
export type SessionId = `${typeof kIdPrefixes.session}${string}`;
export type ProjectTagId = `${typeof kIdPrefixes.projectTag}${string}`;

/** One of the known id prefix values, e.g. `"org_"`. */
export type IdPrefix = (typeof kIdPrefixes)[keyof typeof kIdPrefixes];

export const { is: isOrgId, to: toOrgId } = idOf(kIdPrefixes.org, "OrgId");
export const { is: isProjectId, to: toProjectId } = idOf(
  kIdPrefixes.project,
  "ProjectId",
);
export const { is: isUserId, to: toUserId } = idOf(kIdPrefixes.user, "UserId");
export const { is: isSiteKeyId, to: toSiteKeyId } = idOf(
  kIdPrefixes.siteKey,
  "SiteKeyId",
);
export const { is: isSessionId, to: toSessionId } = idOf(
  kIdPrefixes.session,
  "SessionId",
);
export const { is: isProjectTagId, to: toProjectTagId } = idOf(
  kIdPrefixes.projectTag,
  "ProjectTagId",
);

/** Creates a new unique id of the specified type. */
export function newId<P extends IdPrefix>(prefix: P): `${P}${string}`;

/**
 * Creates a new id from an arbitrary string: if `prefix` is a known id prefix
 * it's used as such, otherwise a generic unique identifier string is returned.
 */
export function newId(prefix: string): string;
export function newId(prefix: string): string {
  return isIdPrefix(prefix) ? `${prefix}${uniqueId()}` : uniqueId();
}

/**
 * Reports whether `s` is exactly what `newId(prefix)` mints: the prefix
 * followed by the full-length entropy portion. Stricter than the per-type
 * guards (`isSessionId` and friends), which only check the prefix, so callers
 * that interpolate an id into a path or key can use this to reject anything
 * they did not mint themselves.
 */
export function isMintedId<P extends IdPrefix>(
  prefix: P,
  s: string,
): s is `${P}${string}` {
  return s.startsWith(prefix) && kMintedBodyPattern.test(s.slice(prefix.length));
}

// Unexported id defns
const kCrockfordBase32 = "0123456789abcdefghjkmnpqrstvwxyz";
const kIdChars = 25;
const kIdPrefixValues: readonly string[] = Object.values(kIdPrefixes);

/** Mints the entropy portion of an id. */
const uniqueId = customAlphabet(kCrockfordBase32, kIdChars);

const kMintedBodyPattern = new RegExp(`^[${kCrockfordBase32}]{${kIdChars}}$`);

function isIdPrefix(s: string): s is IdPrefix {
  return kIdPrefixValues.includes(s);
}

function idOf<P extends string>(prefix: P, label: string) {
  type Id = `${P}${string}`;
  const is = (s: string): s is Id => s.startsWith(prefix);
  const to = (s: string): Id => {
    if (!is(s)) throw new Error(`not a ${label}: ${s}`);
    return s;
  };
  return { is, to };
}

// -- Roles --

// Our roles are organization-scoped, so read these as "___ of an organization".
// Additionally, the ordering here is strictly from lowest-privilege to
// highest-privilege.
export const kRoles = ["viewer", "member", "admin", "owner"] as const;
export type Role = (typeof kRoles)[number];

export type RoleRank = number;

export function rankOf(role: Role): RoleRank {
  return kRoles.indexOf(role) as RoleRank;
}

/** Returns true if role `a` outranks role `b`. Roles do not outrank themselves. */
export function outranks(a: Role, b: Role): boolean {
  return rankOf(a) > rankOf(b);
}

/**
 * Whether an actor holding `actorRole` can grant a membership of role `role`.
 */
export function canGrantRole(actorRole: Role, role: Role): boolean {
  return rankOf(actorRole) >= rankOf(role);
}

/**
 * Whether an actor holding `actorRole` may remove a membership of role `role`.
 */
export function canRevokeRole(actorRole: Role, role: Role): boolean {
  return outranks(actorRole, role);
}

// -- Actions --
export const kOrgActions = [
  "org.read",
  "org.update",
  "org.delete",
  "org.invite_via_email",
  "org.list_projects",
  "org.list_members",
] as const;

// Note no `membership.update`: changing a role is modeled as revoking the old
// role (delete) and granting the new one (create).
export const kMembershipActions = [
  "membership.create",
  "membership.read",
  "membership.delete",
] as const;

// Distinct from the org-level membership actions: these are governed by the
// actor's effective *project* role.
export const kProjectMembershipActions = [
  "project.membership.create",
  "project.membership.read",
  "project.membership.delete",
] as const;

export const kProjectActions = [
  "project.create",
  "project.read",
  "project.update",
  "project.delete",
  "project.list_members",
  "project.ingest.read_credentials",
  "project.ingest.manage_credentials",
  ...kProjectMembershipActions,
] as const;

export const kSessionActions = [
  "session.read",
  "session.list",
  "session.update",
  "session.delete",
  "session.restore",
  "session.clear",
] as const;

export const kIngestActions = ["ingest.write"] as const;

// Actions that may be granted to a principal via a role. Notably this excludes
// ingest actions, which are structural to site keys and not role-grantable.
export const kGrantableActions = [
  ...kOrgActions,
  ...kMembershipActions,
  ...kProjectActions,
  ...kSessionActions,
] as const;

export const kAllActions = [...kGrantableActions, ...kIngestActions] as const;

export type OrgAction = (typeof kOrgActions)[number];
export type MembershipAction = (typeof kMembershipActions)[number];
export type ProjectMembershipAction =
  (typeof kProjectMembershipActions)[number];
export type ProjectAction = (typeof kProjectActions)[number];
export type SessionAction = (typeof kSessionActions)[number];
export type IngestAction = (typeof kIngestActions)[number];

export type GrantableAction =
  | OrgAction
  | MembershipAction
  // ProjectAction already includes ProjectMembershipAction (project.membership.*
  // is spread into kProjectActions), so it's not listed separately here.
  | ProjectAction
  | SessionAction;

export type Action = GrantableAction | IngestAction;

export function isMembershipAction(action: Action): action is MembershipAction {
  return action.startsWith("membership.");
}

export function isProjectMembershipAction(
  action: Action,
): action is ProjectMembershipAction {
  return action.startsWith("project.membership.");
}

// -- Resources --
export interface OrgResource {
  kind: "org";
  id: OrgId;
}

export interface ProjectResource {
  kind: "project";
  org: OrgId;
  id: ProjectId;
}

export interface MembershipResource {
  kind: "membership";
  org: OrgId;
  userId: UserId;
  role: Role;
}

export interface ProjectMembershipResource {
  kind: "project_membership";
  org: OrgId;
  project: ProjectId;
  userId: UserId;
  role: Role;
}

export interface SessionResource {
  kind: "session";
  org: OrgId;
  project: ProjectId;
  id: SessionId;
}

export type Resource =
  | OrgResource
  | ProjectResource
  | SessionResource
  | MembershipResource
  | ProjectMembershipResource;

/** The authz resource for an org. */
export function orgResource(id: OrgId): OrgResource {
  return { kind: "org", id };
}

/** The authz resource for a project. */
export function projectResource(
  orgId: OrgId,
  projId: ProjectId,
): ProjectResource {
  return { kind: "project", org: orgId, id: projId };
}
/** The authz resource for a recorded session belonging to a project. */
export function sessionResource(
  orgId: OrgId,
  projectId: ProjectId,
  sessionId: SessionId,
): SessionResource {
  return { kind: "session", org: orgId, project: projectId, id: sessionId };
}

/** The authz resource for a membership. */
export function membershipResource(
  orgId: OrgId,
  userId: UserId,
  role: Role,
): MembershipResource {
  return { kind: "membership", org: orgId, userId: userId, role: role };
}

/** The authz resource for a per-project membership (role override). */
export function projectMembershipResource(
  orgId: OrgId,
  projectId: ProjectId,
  userId: UserId,
  role: Role,
): ProjectMembershipResource {
  return {
    kind: "project_membership",
    org: orgId,
    project: projectId,
    userId: userId,
    role: role,
  };
}

/**
 * The org `resource` is scoped to, i.e. the org whose grants govern the
 * resource. An org is scoped to itself.
 */
export function orgOf(resource: Resource): OrgId {
  return resource.kind === "org" ? resource.id : resource.org;
}

// -- Principals --
export interface UserPrincipal {
  kind: "user";
  id: UserId;
  roles: Record<OrgId, Role>;
  // Optional per-project overrides.
  projectRoles: Record<ProjectId, Role>;
}

export interface SiteKeyPrincipal {
  kind: "site_key";
  id: SiteKeyId;
  projectId: ProjectId;
}

export type Principal = UserPrincipal | SiteKeyPrincipal;

/**
 * Constructs a user principal from its org-level roles and (optional)
 * per-project overrides.
 */
export function userPrincipal(
  id: UserId,
  roles: Record<OrgId, Role>,
  projectRoles: Record<ProjectId, Role> = {},
): UserPrincipal {
  return { kind: "user", id, roles, projectRoles };
}

/**
 * Constructs a site-key principal bound to the project it ingests into.
 */
export function siteKeyPrincipal(
  id: SiteKeyId,
  projectId: ProjectId,
): SiteKeyPrincipal {
  return { kind: "site_key", id, projectId };
}

/**
 * Returns a copy of `user` with a per-project role override applied for
 * `projectId`. A null `role` removes any existing role for the given project.
 *
 * Org-level roles are not modified by this function, and the input principal
 * instance is not mutated.
 */
export function withProjectRole(
  user: UserPrincipal,
  projectId: ProjectId,
  role: Role | null,
): UserPrincipal {
  const projectRoles = { ...user.projectRoles };
  if (role) {
    projectRoles[projectId] = role;
  } else {
    delete projectRoles[projectId];
  }
  return { ...user, projectRoles };
}

/**
 * The principal's org-level role in `orgId`, or null if they hold no
 * membership there.
 */
export function orgRoleOf(principal: Principal, orgId: OrgId): Role | null {
  if (principal.kind !== "user") {
    return null;
  }
  return principal.roles[orgId] ?? null;
}

// -- Enforcement --
export interface Decision {
  allowed: boolean;
  reason: string;
}

// -- Policies --
// Typed as GrantableAction (not Action) so that granting a non-grantable
// action (e.g. "ingest.write") to a role is a compile error.
const kGrantsViewer: Set<GrantableAction> = new Set([
  "org.read",
  "org.list_projects",
  "project.read",
  "session.read",
  "session.list",
]);
const kGrantsMember: Set<GrantableAction> = new Set([
  ...kGrantsViewer,
  "membership.read",
  "org.list_members",
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
]);
const kGrantsAdmin: Set<GrantableAction> = new Set([
  ...kGrantsMember,
  "org.invite_via_email",
  "membership.create",
  "membership.delete",
  "project.membership.create",
  "project.membership.delete",
]);
const kGrantsOwner: Set<GrantableAction> = new Set([
  ...kGrantsAdmin,
  "org.update",
  "org.delete",
]);

export const kGrants: Record<Role, ReadonlySet<GrantableAction>> = {
  viewer: kGrantsViewer,
  member: kGrantsMember,
  admin: kGrantsAdmin,
  owner: kGrantsOwner,
};
