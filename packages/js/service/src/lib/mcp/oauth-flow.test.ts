import { getMigrations } from "better-auth/db/migration";
import { createHash, randomBytes } from "node:crypto";
import { DatabaseSync } from "node:sqlite";
import { afterEach, beforeEach, describe, expect, it, vi } from "vitest";
import { createAuth, type Auth } from "../auth/create-auth.js";
import {
  handleBetterAuthReq,
  handleOAuthDiscoveryReq,
} from "../auth/entrypoint.js";
import { handleMcpReq } from "./handler.js";

const kOrigin = "http://localhost:3000";
const kFrontend = "http://localhost:5173";
const kResource = `${kOrigin}/mcp`;

// Claude Code's published metadata document, as served on 2026-11-17.
const kClientId = "https://claude.ai/oauth/claude-code-client-metadata";
const kClientMetadata = {
  client_id: kClientId,
  client_name: "Claude Code",
  client_uri: "https://claude.ai",
  redirect_uris: ["http://localhost/callback", "http://127.0.0.1/callback"],
  grant_types: ["authorization_code", "refresh_token"],
  response_types: ["code"],
  token_endpoint_auth_method: "none",
};
// Claude Code listens on an ephemeral port the metadata cannot name.
const kRedirectUri = "http://localhost:53076/callback";

let auth: Auth;
let metadataFetches: string[];

beforeEach(async () => {
  auth = createAuth({
    database: new DatabaseSync(":memory:"),
    secret: "test-secret-value-that-is-at-least-32-chars",
    baseURL: kOrigin,
    frontendURL: kFrontend,
    mcpOrigin: kOrigin,
  });
  const { runMigrations } = await getMigrations(auth.options);
  await runMigrations();

  metadataFetches = [];
  vi.stubGlobal("fetch", async (input: Parameters<typeof fetch>[0]) => {
    const url = input instanceof Request ? input.url : String(input);
    metadataFetches.push(url);
    if (url !== kClientId) {
      return new Response(null, { status: 404 });
    }
    return Response.json(kClientMetadata);
  });
});

afterEach(() => {
  vi.unstubAllGlobals();
});

/** Routes a request the way a backend mounts the three entrypoints. */
function serve(req: Request): Promise<Response> {
  const { pathname } = new URL(req.url);
  if (pathname === "/mcp") {
    return handleMcpReq(auth, req);
  }
  if (pathname.startsWith("/.well-known/")) {
    return handleOAuthDiscoveryReq(auth, req);
  }
  return handleBetterAuthReq(auth, req);
}

async function signUp(): Promise<string> {
  const res = await serve(
    new Request(`${kOrigin}/api/auth/sign-up/email`, {
      method: "POST",
      headers: { "content-type": "application/json", origin: kOrigin },
      body: JSON.stringify({
        email: "mcp@example.com",
        name: "MCP User",
        password: "abcd1234",
      }),
    }),
  );
  expect(res.status).toBe(200);
  return res.headers
    .getSetCookie()
    .map((c) => c.split(";")[0])
    .join("; ");
}

function pkce(): { verifier: string; challenge: string } {
  const verifier = randomBytes(32).toString("base64url");
  const challenge = createHash("sha256").update(verifier).digest("base64url");
  return { verifier, challenge };
}

/**
 * Runs authorize and consent as the signed-in browser would, returning the
 * authorization code delivered to the redirect URI.
 */
async function authorize(cookie: string, challenge: string): Promise<string> {
  const query = new URLSearchParams({
    response_type: "code",
    client_id: kClientId,
    redirect_uri: kRedirectUri,
    scope: "pixeltrace:read pixeltrace:write offline_access",
    state: "state-1",
    code_challenge: challenge,
    code_challenge_method: "S256",
    resource: kResource,
  });
  const authz = await serve(
    new Request(`${kOrigin}/api/auth/oauth2/authorize?${query}`, {
      headers: { cookie },
      redirect: "manual",
    }),
  );
  expect(authz.status).toBe(302);
  const consentUrl = new URL(authz.headers.get("location")!);
  expect(consentUrl.origin + consentUrl.pathname).toBe(
    `${kFrontend}/oauth/authorize`,
  );

  const consent = await serve(
    new Request(`${kOrigin}/api/auth/oauth2/consent`, {
      method: "POST",
      headers: { "content-type": "application/json", origin: kOrigin, cookie },
      body: JSON.stringify({
        accept: true,
        oauth_query: consentUrl.search.slice(1),
      }),
    }),
  );
  expect(consent.status).toBe(200);
  const { url } = (await consent.json()) as { url: string };
  const callback = new URL(url);
  expect(callback.origin + callback.pathname).toBe(kRedirectUri);
  expect(callback.searchParams.get("state")).toBe("state-1");
  return callback.searchParams.get("code")!;
}

async function exchange(code: string, verifier: string) {
  const res = await serve(
    new Request(`${kOrigin}/api/auth/oauth2/token`, {
      method: "POST",
      headers: { "content-type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams({
        grant_type: "authorization_code",
        code,
        redirect_uri: kRedirectUri,
        client_id: kClientId,
        code_verifier: verifier,
        resource: kResource,
      }),
    }),
  );
  return {
    status: res.status,
    body: (await res.json()) as Record<string, unknown>,
  };
}

function mcpCall(headers: Record<string, string>): Request {
  return new Request(kResource, {
    method: "POST",
    headers: {
      "content-type": "application/json",
      accept: "application/json, text/event-stream",
      "mcp-protocol-version": "2025-06-18",
      ...headers,
    },
    body: JSON.stringify({
      jsonrpc: "2.0",
      id: 1,
      method: "tools/call",
      params: { name: "whoami", arguments: {} },
    }),
  });
}

describe("MCP OAuth flow", () => {
  it("challenges an unauthenticated request with the resource metadata URL", async () => {
    const res = await serve(mcpCall({}));
    expect(res.status).toBe(401);
    const challenge = res.headers.get("www-authenticate") ?? "";
    const metadataUrl = /resource_metadata="([^"]+)"/.exec(challenge)?.[1];
    expect(metadataUrl).toBe(
      `${kOrigin}/.well-known/oauth-protected-resource/mcp`,
    );

    const metadata = await serve(new Request(metadataUrl!));
    expect(metadata.status).toBe(200);
    expect(await metadata.json()).toMatchObject({
      resource: kResource,
      authorization_servers: [`${kOrigin}/api/auth`],
    });
  });

  it("advertises what Claude needs to pick CIMD and ask for a refresh token", async () => {
    const res = await serve(
      new Request(`${kOrigin}/.well-known/oauth-authorization-server/api/auth`),
    );
    expect(res.status).toBe(200);
    const metadata = (await res.json()) as Record<string, string[] | boolean>;
    expect(metadata.client_id_metadata_document_supported).toBe(true);
    expect(metadata.token_endpoint_auth_methods_supported).toContain("none");
    expect(metadata.code_challenge_methods_supported).toEqual(["S256"]);
    expect(metadata.scopes_supported).toContain("offline_access");
  });

  it("signs a user in through a CIMD client and serves whoami", async () => {
    const cookie = await signUp();
    const { verifier, challenge } = pkce();
    const code = await authorize(cookie, challenge);
    expect(metadataFetches).toEqual([kClientId]);

    const token = await exchange(code, verifier);
    expect(token.status).toBe(200);
    expect(token.body.refresh_token).toBeTruthy();
    expect(token.body.expires_in).toBe(600);

    const res = await serve(
      mcpCall({ authorization: `Bearer ${String(token.body.access_token)}` }),
    );
    expect(res.status).toBe(200);
    const text = await res.text();
    const session = await auth.api.getSession({ headers: { cookie } });
    expect(text).toContain(`\\"user_id\\":\\"${session!.user.id}\\"`);
    expect(text).toContain("pixeltrace:read");
  });

  it("does not redeem an authorization code twice", async () => {
    const cookie = await signUp();
    const { verifier, challenge } = pkce();
    const code = await authorize(cookie, challenge);
    expect((await exchange(code, verifier)).status).toBe(200);
    expect((await exchange(code, verifier)).status).toBe(400);
  });

  it("rejects a session cookie in place of an access token", async () => {
    const cookie = await signUp();
    const res = await serve(mcpCall({ cookie }));
    expect(res.status).toBe(401);
  });

  it("refuses a client whose metadata is not on Claude's origin", async () => {
    const cookie = await signUp();
    const query = new URLSearchParams({
      response_type: "code",
      client_id: "https://evil.example/client-metadata",
      redirect_uri: "https://evil.example/callback",
      code_challenge: pkce().challenge,
      code_challenge_method: "S256",
    });
    const res = await serve(
      new Request(`${kOrigin}/api/auth/oauth2/authorize?${query}`, {
        headers: { cookie },
        redirect: "manual",
      }),
    );
    expect(res.headers.get("location") ?? "").not.toContain("code=");
    expect(metadataFetches).toEqual([]);
  });
});
