import { requireMcpAuth } from "@better-auth/mcp";
import { createMcpHandler, McpServer } from "@modelcontextprotocol/server";
import type { Auth, AuthInstance } from "../auth/create-auth.js";
import { mcpResourceOf } from "../auth/create-auth.js";
import { kProductName } from "../constants.js";

/**
 * The single entrypoint for MCP requests: mount it at `kMcpPath` on the MCP
 * origin. Only a request bearing a valid access token for this resource
 * reaches the MCP server; anything else gets the 401 challenge that starts an
 * MCP client's OAuth flow.
 */
export function handleMcpReq(auth: Auth, req: Request): Promise<Response> {
  return requireMcpAuth(
    auth as AuthInstance,
    (request, claims) =>
      createMcpHandler(() => buildServer(claims)).fetch(request),
    { resource: mcpResourceOf(auth) },
  )(req);
}

/** The verified access-token claims `requireMcpAuth` hands its handler. */
type AccessTokenClaims = Parameters<Parameters<typeof requireMcpAuth>[1]>[1];

function buildServer(claims: AccessTokenClaims): McpServer {
  const server = new McpServer({ name: kProductName, version: "1.0.0" });
  server.registerTool(
    "whoami",
    {
      description:
        "Returns the Pixeltrace user and scopes this connection acts as.",
      annotations: { readOnlyHint: true },
    },
    () => ({
      content: [
        {
          type: "text",
          text: JSON.stringify({
            user_id: claims.sub,
            scopes:
              typeof claims.scope === "string" ? claims.scope.split(" ") : [],
          }),
        },
      ],
    }),
  );
  return server;
}
