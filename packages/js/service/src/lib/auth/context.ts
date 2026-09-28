import {
  Code,
  ConnectError,
  createContextKey,
  type HandlerContext,
} from "@connectrpc/connect";
import type { Auth } from "./create-auth.js";
import {
  kRoles,
  toOrgId,
  toUserId,
  type OrgId,
  type Role,
  type UserId,
  type UserPrincipal,
} from "@pixeltrace/authz";

/**
 * The Connect context key through which a deployment provides its Better Auth
 * handle.
 */
export const kAuth = createContextKey<Auth | null>(null);

/**
 * The Connect context key under which the auth interceptor stores the session.
 */
export const kAuthContext = createContextKey<AuthContext | null>(null);

/** The authenticated identity/principal resolved from a request. */
export interface AuthContext {
  userId: UserId;
  orgId: OrgId | null;
  personalOrgId: OrgId | null;
  principal: UserPrincipal;
}

/**
 * Returns the full authenticated context for the current request, throwing
 * `Unauthenticated` if the request carried no valid session. NB: this does not
 * authorize the request, only authenticates the requestor.
 */
export function requireAuthContext(ctx: HandlerContext): AuthContext {
  const authCtx = ctx.values.get(kAuthContext);
  if (!authCtx) {
    throw new ConnectError("unauthenticated", Code.Unauthenticated);
  }
  return authCtx;
}

/**
 * Returns the authenticated `UserPrincipal` for the current request, throwing
 * `Unauthenticated` if the request carried no valid session. NB: this does not
 * authorize the request, only authenticates the requestor.
 */
export function requireAuth(ctx: HandlerContext): UserPrincipal {
  return requireAuthContext(ctx).principal;
}
