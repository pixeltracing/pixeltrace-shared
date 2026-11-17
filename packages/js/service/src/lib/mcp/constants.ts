/** Path of the MCP endpoint under `AuthConfig.mcpOrigin`. */
export const kMcpPath = "/mcp";

/** OAuth scopes an MCP connection can be granted. */
export const kMcpScopes = {
  read: "pixeltrace:read",
  write: "pixeltrace:write",
} as const;

/** The MCP protected-resource identifier: the URL users add to their client. */
export function mcpResource(mcpOrigin: string): string {
  return new URL(kMcpPath, mcpOrigin).toString();
}
