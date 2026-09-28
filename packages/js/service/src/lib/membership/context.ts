import { createContextKey, type HandlerContext } from "@connectrpc/connect";
import { requirePorts } from "../util/context";
import type { MembershipPorts } from "./ports";

/**
 * The Connect context key through which a deployment should provide the
 * membership ports implementations.
 */
export const kMembershipPorts = createContextKey<MembershipPorts | null>(null);

/** Reads the {@link MembershipPorts} set on the current request. */
export function membershipPortsOf(ctx: HandlerContext): MembershipPorts {
  return requirePorts(ctx, kMembershipPorts, "membership");
}
