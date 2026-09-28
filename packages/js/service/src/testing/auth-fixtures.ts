import { create } from "@bufbuild/protobuf";
import { createContextValues, type HandlerContext } from "@connectrpc/connect";
import {
  toOrgId,
  toUserId,
  type OrgId,
  type Role,
  type UserId,
} from "@pixeltrace/authz";
import {
  CreateMembershipRequestSchema,
  CreateOrganizationRequestSchema,
  MembershipKeySchema,
  OrganizationIdSchema,
  UserIdSchema,
} from "@pixeltrace/schema";
import { type User } from "better-auth";
import { applySetCookies } from "better-auth/cookies";
import { randomUUID } from "crypto";
import { kAuthContext } from "../lib/auth/context.js";
import type { Auth } from "../lib/auth/create-auth.js";
import {
  resolveAuthContext,
  type ProjectRoleLookup,
} from "../lib/auth/interceptor.js";
import { kMembershipPorts } from "../lib/membership/context.js";
import type { MembershipPorts } from "../lib/membership/ports.js";
import { createMembership } from "../lib/membership/service.js";
import { makeBetterAuthOrgPorts } from "../lib/org/better_auth_port.js";
import { kOrgPorts } from "../lib/org/context.js";
import type { OrgPorts } from "../lib/org/ports.js";
import { createOrganization } from "../lib/org/service.js";
import { kProjectPorts } from "../lib/project/context.js";
import type { ProjectPorts, ProjectStore } from "../lib/project/ports.js";
import { roleToProto } from "../lib/util/roles.js";

/**
 * A minimal ProjectStore for the org and membership tests, implementing only
 * the methods needed for those tests.
 */
function stubProjectPorts(): ProjectPorts {
  const unsupported = () => {
    throw new Error("project store not available in this contract");
  };
  return {
    projects: {
      listProjects: () =>
        Promise.resolve({ items: [], nextPageToken: undefined }),
      getProjectRoles: () => Promise.resolve({}),
      // These contracts have no projects, so there is never anything to clear.
      clearOrgProjectRoles: () => Promise.resolve(),
      createProject: unsupported,
      getProject: unsupported,
      getProjectMember: unsupported,
      assignProjectMember: unsupported,
      updateProjectMember: unsupported,
      removeProjectMember: unsupported,
      listProjectMembers: unsupported,
      deleteProject: unsupported,
      updateProject: unsupported,
      createSiteKey: unsupported,
      getSiteKey: unsupported,
      listSiteKeys: unsupported,
      updateSiteKey: unsupported,
      deleteSiteKey: unsupported,
    } as unknown as ProjectStore,
  };
}

/** A signed-up user: their Better Auth record, id, and session-bearing headers. */
export interface TestSession {
  user: User;
  userId: UserId;
  personalOrgId: OrgId;
  headers: Headers;
}

/**
 * Turns the `Set-Cookie`s on a Better Auth response into the `Cookie` request
 * header a subsequent authenticated call should carry.
 */
export function asRequestHeaders(responseHeaders: Headers): Headers {
  const headers = new Headers();
  applySetCookies(headers, responseHeaders.getSetCookie());
  return headers;
}

/**
 * A {@link ProjectRoleLookup} that resolves no per-project overrides, for tests
 * whose flows don't touch project roles.
 */
export const noProjectRoles: ProjectRoleLookup = () => Promise.resolve({});

/** Signs up a new, uniquely-named user and returns their session. */
export async function signUpUser(auth: Auth): Promise<TestSession> {
  const r = randomUUID().slice(0, 6);
  const { headers } = await auth.api.signUpEmail({
    body: {
      name: `Test User ${r}`,
      email: `testuser-${r}@example.com`,
      password: "test-passwd",
    },
    returnHeaders: true,
  });

  const session = await auth.api.getSession({
    headers: asRequestHeaders(headers),
  });
  const user = session?.user;
  if (!user?.personalOrgId) {
    throw new Error("expected signup to provision a personal org");
  }

  return {
    user,
    userId: toUserId(user.id),
    personalOrgId: toOrgId(user.personalOrgId),
    headers,
  };
}

/** Makes `orgId` the active organization for the given user's session. */
export async function switchOrg(
  auth: Auth,
  headers: Headers,
  orgId: OrgId,
): Promise<void> {
  await auth.api.setActiveOrganization({
    body: { organizationId: orgId },
    headers: asRequestHeaders(headers),
  });
}

/** A request appointing `userId` into `orgId` at `role`. */
export function mkMembershipReq(orgId: OrgId, userId: UserId, role: Role) {
  return create(CreateMembershipRequestSchema, {
    key: create(MembershipKeySchema, {
      orgId: create(OrganizationIdSchema, { id: orgId }),
      userId: create(UserIdSchema, { id: userId }),
    }),
    props: { role: roleToProto(role) },
  });
}

/**
 * Signs up a new user, has the caller behind `ownerHctx` appoint them into
 * `org` at `role`, and makes `org` their active org. Returns the new member's
 * session; wrap it in your contract's handler context to act as them.
 */
export async function appointMember(
  auth: Auth,
  ownerHctx: HandlerContext,
  org: OrgId,
  role: Role,
): Promise<TestSession> {
  const sess = await signUpUser(auth);
  await createMembership(mkMembershipReq(org, sess.userId, role), ownerHctx);
  await switchOrg(auth, sess.headers, org);
  return sess;
}

/**
 * Signs up a user and creates an organization they own. Returns the owner's
 * session and the org's id, with that org active for the session.
 */
export async function initOrgWithOwner(
  auth: Auth,
  orgName: string,
): Promise<{ sess: TestSession; orgId: OrgId }> {
  const sess = await signUpUser(auth);
  const values = createContextValues();
  const requestHeader = asRequestHeaders(sess.headers);
  values.set(kOrgPorts, makeBetterAuthOrgPorts(auth));
  values.set(kProjectPorts, stubProjectPorts());
  values.set(
    kAuthContext,
    await resolveAuthContext(auth, requestHeader, noProjectRoles),
  );

  const ctx = { values, requestHeader } as unknown as HandlerContext;
  const created = await createOrganization(
    create(CreateOrganizationRequestSchema, { props: { name: orgName } }),
    ctx,
  );
  const orgId = toOrgId(created.id!.id);
  await switchOrg(auth, sess.headers, orgId);
  return { sess, orgId };
}

/**
 * The per-contract context and session helpers shared by the org and
 * membership service tests. See {@link makeContractHelpers}.
 */
export interface ContractHelpers {
  /** Wraps `headers` in a handler context exposing the org and membership ports. */
  mkCtx(headers: Headers): Promise<HandlerContext>;
  /**
   * Seeds an owner and their org (that org active for the session), then wraps
   * the owner's session in this contract's handler context.
   */
  initOrgAndOwner(
    orgName: string,
  ): Promise<{ sess: TestSession; orgId: OrgId; hctx: HandlerContext }>;
  /**
   * Signs up a fresh user, has the caller behind `ownerHctx` appoint them into
   * `org` at `role` (a genuinely authorized grant) with `org` active, and
   * returns a context in which they act with that role.
   */
  addMember(
    ownerHctx: HandlerContext,
    org: OrgId,
    role: Role,
  ): Promise<{ sess: TestSession; hctx: HandlerContext }>;
}

/**
 * Builds the context and session helpers shared by the org and membership
 * service contract tests. `orgs`/`membs` are the ports the handler context
 * exposes; project roles are not resolved (these flows don't touch them).
 */
export function makeContractHelpers(
  auth: Auth,
  orgs: OrgPorts,
  membs: MembershipPorts,
): ContractHelpers {
  async function mkCtx(headers: Headers): Promise<HandlerContext> {
    const values = createContextValues();
    values.set(kOrgPorts, orgs);
    values.set(kMembershipPorts, { memberships: membs.memberships });
    values.set(kProjectPorts, stubProjectPorts());

    const requestHeader = asRequestHeaders(headers);
    values.set(
      kAuthContext,
      await resolveAuthContext(auth, requestHeader, noProjectRoles),
    );

    return { values, requestHeader } as unknown as HandlerContext;
  }

  async function initOrgAndOwner(orgName: string) {
    const { sess, orgId } = await initOrgWithOwner(auth, orgName);
    return { sess, orgId, hctx: await mkCtx(sess.headers) };
  }

  async function addMember(ownerHctx: HandlerContext, org: OrgId, role: Role) {
    const sess = await appointMember(auth, ownerHctx, org, role);
    return { sess, hctx: await mkCtx(sess.headers) };
  }

  return { mkCtx, initOrgAndOwner, addMember };
}
