import type { ContextKey, HandlerContext } from "@connectrpc/connect";

/**
 * Reads a typed set of backing-store ports from the request context, throwing
 * an error if the deployment did not provide them.
 */
export function requirePorts<T>(
  ctx: HandlerContext,
  key: ContextKey<T | null>,
  name: string,
): T {
  const ports = ctx.values.get(key);
  if (!ports) {
    throw new Error(`${name} ports not provided`);
  }
  return ports;
}
