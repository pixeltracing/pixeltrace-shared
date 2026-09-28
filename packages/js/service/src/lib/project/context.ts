import { createContextKey, type HandlerContext } from "@connectrpc/connect";
import { requirePorts } from "../util/context";
import type { ProjectPorts } from "./ports";

/** The Connect context key under which a deployment provides the project ports. */
export const kProjectPorts = createContextKey<ProjectPorts | null>(null);

/** Reads the {@link ProjectPorts} injected for the current request. */
export function projectPortsOf(ctx: HandlerContext): ProjectPorts {
  return requirePorts(ctx, kProjectPorts, "project");
}
