import { Code, ConnectError } from "@connectrpc/connect";
import {
  toOrgId,
  toProjectId,
  toProjectTagId,
  toSessionId,
  toSiteKeyId,
  toUserId,
} from "@pixeltrace/authz";
import { requireParam } from "./util.js";

/**
 * Builds a parser for a required, client-supplied id field. A malformed one is
 * thrown as a Connect InvalidArgument.
 */
function idParser<T extends string>(to: (s: string) => T, kind: string) {
  return (raw: string | undefined): T => {
    const id = requireParam(raw);
    try {
      return to(id);
    } catch {
      throw new ConnectError(
        `malformed ${kind}: "${id}"`,
        Code.InvalidArgument,
      );
    }
  };
}

export const requireOrgId = idParser(toOrgId, "organization id");
export const requireProjectId = idParser(toProjectId, "project id");
export const requireUserId = idParser(toUserId, "user id");
export const requireSiteKeyId = idParser(toSiteKeyId, "site key");
export const requireSessionId = idParser(toSessionId, "session id");
export const requireProjectTagId = idParser(toProjectTagId, "project tag id");
