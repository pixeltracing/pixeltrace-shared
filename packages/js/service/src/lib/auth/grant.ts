import { Code, ConnectError } from "@connectrpc/connect";
import {
  authorize,
  type Action,
  type Grant,
  type Principal,
  type Resource,
} from "@pixeltrace/authz";

/**
 * Authorizes `principal` to perform `action` on `resource`, returning a
 * capability on success and throwing `PermissionDenied` otherwise.
 */
export function requireGrant<A extends Action, R extends Resource>(
  principal: Principal,
  action: A,
  resource: R,
): Grant<A, R> {
  const grant = authorize(principal, action, resource);
  if (!grant) {
    throw new ConnectError(
      `permission denied: ${action}`,
      Code.PermissionDenied,
    );
  }
  return grant;
}
