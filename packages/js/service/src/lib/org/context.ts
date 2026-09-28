import { createContextKey, type HandlerContext } from "@connectrpc/connect";
import { requirePorts } from "../util/context";
import type { OrgPorts } from "./ports";

/**
 * The Connect context key through which a deployment should provide the org
 * ports implementations.
 */
export const kOrgPorts = createContextKey<OrgPorts | null>(null);

/** Reads the {@link OrgPorts} set on the current request. */
export function orgPortsOf(ctx: HandlerContext): OrgPorts {
  return requirePorts(ctx, kOrgPorts, "org");
}
