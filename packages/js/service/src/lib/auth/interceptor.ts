import { Code, ConnectError, type Interceptor } from "@connectrpc/connect";
import { kAuth, kAuthContext, type AuthContext } from "./context.js";
import type { Auth } from "./create-auth.js";
import { kProjectPorts } from "../project/context.js";
import {
  kRoles,
  toOrgId,
  toUserId,
  userPrincipal,
  type OrgId,
  type ProjectId,
  type Role,
  type UserId,
} from "@pixeltrace/authz";

/**
 * Resolves every per-project role override a user holds, keyed by project.
 * Injected into {@link resolveAuthContext} so the auth module stays decoupled
 * from project storage.
 */
export type ProjectRoleLookup = (
  userId: UserId,
  headers: Headers,
) => Promise<Record<ProjectId, Role>>;

/**
 * Server interceptor that resolves the caller's session (if there is one) once
 * per request and stores the result under {@link kAuthContext}.
 */
export function authInterceptor(): Interceptor {
  return (next) => async (req) => {
    const auth = req.contextValues.get(kAuth);
    if (!auth) {
      // A misconfigured deployment, not an auth failure.
      throw new ConnectError(
        "authInterceptor: no Auth handle available via kAuth",
        Code.Internal,
      );
    }

    // Per-project role overrides, a required component of our authz structure,
    // come from the project store.
    const projectPorts = req.contextValues.get(kProjectPorts);
    if (!projectPorts) {
      throw new ConnectError(
        "authInterceptor: no ProjectPorts available",
        Code.Internal,
      );
    }

    const authCtx = await resolveAuthContext(
      auth,
      req.header,
      (userId, headers) =>
        projectPorts.projects.getProjectRoles(userId, headers),
    );
    req.contextValues.set(kAuthContext, authCtx);

    return await next(req);
  };
}

/**
 * Attempts to authenticate a request.
 *
 * Returns a valid AuthContext if authentication succeeds, or `null` if it
 * doesn't (missing/bad authn headers, expired session, etc).
 */
export async function resolveAuthContext(
  auth: Auth,
  headers: Headers,
  getProjectRoles: ProjectRoleLookup,
): Promise<AuthContext | null> {
  const session = await auth.api.getSession({ headers });
  if (!session) {
    return null;
  }

  const userId = toUserId(session.user.id);
  const orgIdStr = (session.session as { activeOrganizationId?: string })
    .activeOrganizationId;
  const personalOrgIdStr = (session.user as { personalOrgId?: string | null })
    .personalOrgId;
  const personalOrgId = personalOrgIdStr ? toOrgId(personalOrgIdStr) : null;

  let orgId: OrgId | null = null;
  let role: Role | null = null;
  if (orgIdStr) {
    orgId = toOrgId(orgIdStr);
    role = await resolveOrgRole(auth, headers);
  }

  const projectRoles = await getProjectRoles(userId, headers);

  const principal = userPrincipal(
    userId,
    orgId && role ? { [orgId]: role } : {},
    projectRoles,
  );

  return { userId, orgId, personalOrgId, principal };
}

/** The caller's authz Role in the active org, or null if no role was resolved. */
async function resolveOrgRole(
  auth: Auth,
  headers: Headers,
): Promise<Role | null> {
  try {
    const member = await auth.api.getActiveMemberRole({ headers });
    const role = member?.role;
    return typeof role === "string" &&
      (kRoles as readonly string[]).includes(role)
      ? (role as Role)
      : null;
  } catch {
    // No active membership: no role; other error: fail closed to no role.
    return null;
  }
}
