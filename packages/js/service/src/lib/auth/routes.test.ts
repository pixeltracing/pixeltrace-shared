import { memoryAdapter, type MemoryDB } from "better-auth/adapters/memory";
import { describe, expect, it } from "vitest";
import { createAuth, type Auth } from "./create-auth.js";
import { handleBetterAuthReq } from "./entrypoint.js";
import { isAuthRouteAllowed } from "./routes.js";

/**
 * Signs `email` up with a real Better Auth instance, asks it for a password
 * reset, and returns the link it put in the outgoing email.
 */
async function passwordResetLink(email: string): Promise<URL> {
  const db: MemoryDB = {
    user: [],
    session: [],
    account: [],
    verification: [],
    organization: [],
    member: [],
    invitation: [],
    rateLimit: [],
  };
  const sent: string[] = [];
  const auth = createAuth({
    database: memoryAdapter(db),
    secret: "test-secret-value-that-is-at-least-32-chars",
    baseURL: "http://localhost:3000",
    frontendURL: "http://localhost:5173",
    // The reset link is the only URL in the message; pull it back out of the
    // rendered body.
    sendEmail: (msg) => {
      sent.push(...(msg.text.match(/https?:\/\/\S+/g) ?? []));
      return Promise.resolve();
    },
  });

  await auth.api.signUpEmail({
    body: { email, name: "Reset Test", password: "abcd1234" },
  });
  await auth.api.requestPasswordReset({
    body: { email, redirectTo: "http://localhost:5173/reset-password" },
  });

  const link = sent.find((u) => u.includes("/reset-password/"));
  if (!link) {
    throw new Error(`no reset link in sent mail: ${sent.join(", ")}`);
  }
  return new URL(link);
}

/** A stand-in Better Auth instance that records whether its handler ran. */
function fakeAuth(): { auth: Auth; handled: () => boolean } {
  let handled = false;
  const auth = {
    handler: (_req: Request) => {
      handled = true;
      return Promise.resolve(new Response("ok"));
    },
  } as unknown as Auth;
  return { auth, handled: () => handled };
}

describe("isAuthRouteAllowed", () => {
  it("allows the normal sign-up, sign-in flows", () => {
    for (const p of [
      "/api/auth/sign-up/email",
      "/api/auth/sign-in/email",
      "/api/auth/sign-in/social",
      "/api/auth/sign-out",
      "/api/auth/get-session",
      "/api/auth/error",
    ]) {
      expect(isAuthRouteAllowed(p)).toBe(true);
    }
  });

  it("allows the error page an OAuth callback redirects to on failure", () => {
    // Better Auth 302s the browser to this page on a failed social callback;
    // it must reach the handler so the real error shows instead of our 403.
    expect(isAuthRouteAllowed("/api/auth/error?error=internal_server_error")).toBe(
      true,
    );
  });

  it("allows routes that carry a dynamic segment in the path", () => {
    expect(isAuthRouteAllowed("/api/auth/reset-password/some-token")).toBe(
      true,
    );
    expect(isAuthRouteAllowed("/api/auth/callback/github")).toBe(true);
  });

  it("allows the link Better Auth actually emails for a password reset", async () => {
    const url = await passwordResetLink("reset@example.com");
    expect(url.pathname).toMatch(/^\/api\/auth\/reset-password\/.+/);
    expect(isAuthRouteAllowed(url.pathname)).toBe(true);
  });

  it("denies dot-segment paths", () => {
    // `%2e%2e` == `..`, so without catching this a downstream router that
    // decodes first could be walked out of the subtree and into a disallowed
    // route.
    for (const p of [
      "/api/auth/callback/../organization/create",
      "/api/auth/callback/%2e%2e/organization/create",
      "/api/auth/callback/%2E%2E",
      "/api/auth/reset-password/%2e%2e%2forganization%2fcreate",
      "/api/auth/reset-password/..",
      "/api/auth/reset-password/.",
    ]) {
      expect(isAuthRouteAllowed(p)).toBe(false);
    }

    // one that resolves back to an allowed route is still allowed.
    expect(isAuthRouteAllowed("/api/auth/organization/../sign-out")).toBe(true);
    // A query string is not part of the route.
    expect(isAuthRouteAllowed("/api/auth/sign-out?next=/x")).toBe(true);
  });

  it("denies a deeper path under an allowed subtree", () => {
    expect(isAuthRouteAllowed("/api/auth/callback/github/extra")).toBe(false);
    expect(isAuthRouteAllowed("/api/auth/callback/")).toBe(false);
  });

  it("denies paths outside the Better Auth mount point", () => {
    for (const p of ["/sign-out", "/api/sign-out", "/api/authz/sign-out", ""]) {
      expect(isAuthRouteAllowed(p)).toBe(false);
    }
  });

  it("denies other routes (sample)", () => {
    for (const p of [
      "/api/auth/change-password",
      "/api/auth/change-email",
      "/api/auth/delete-user",
      "/api/auth/link-social",
      "/api/auth/reset-password-foo",
      "/api/auth/callback-foo",
      "/api/auth/organization/remove-member",
      "/api/auth/organization/update-member-role",
      "/api/auth/organization/create",
      "/api/auth/organization/list-members",
    ]) {
      expect(isAuthRouteAllowed(p)).toBe(false);
    }
  });
});

describe("handleBetterAuthReq", () => {
  it("forwards an allowed route to the Better Auth handler", async () => {
    const { auth, handled } = fakeAuth();
    const resp = await handleBetterAuthReq(
      auth,
      new Request("https://api.example.com/api/auth/sign-in/email?next=/x"),
    );
    expect(resp.status).toBe(200);
    expect(handled()).toBe(true);
  });

  it("answers 403 without reaching the handler for a disallowed route", async () => {
    const { auth, handled } = fakeAuth();
    const resp = await handleBetterAuthReq(
      auth,
      new Request("https://api.example.com/api/auth/organization/create"),
    );
    expect(resp.status).toBe(403);
    expect(handled()).toBe(false);
  });

  it("resolves a literal dot-segment before matching, so it can't escape a subtree", async () => {
    const { auth, handled } = fakeAuth();
    const resp = await handleBetterAuthReq(
      auth,
      new Request(
        "https://api.example.com/api/auth/callback/../organization/create",
      ),
    );
    expect(resp.status).toBe(403);
    expect(handled()).toBe(false);
  });
});
