import { create } from "@bufbuild/protobuf";
import { Code } from "@connectrpc/connect";
import { type OrgId, type UserId } from "@pixeltrace/authz";
import {
  DeleteMembershipRequestSchema,
  GetMembershipRequestSchema,
  MembershipKeySchema,
  OrganizationIdSchema,
  UserIdSchema,
} from "@pixeltrace/schema";
import { getMigrations } from "better-auth/db/migration";
import { DatabaseSync } from "node:sqlite";
import { beforeAll, describe, expect, it } from "vitest";
import { createAuth, type Auth } from "../lib/auth/create-auth.js";
import { handleBetterAuthReq } from "../lib/auth/entrypoint.js";
import { makeBetterAuthMembershipPorts } from "../lib/membership/better_auth_port.js";
import { deleteMembership, getMembership } from "../lib/membership/service.js";
import { makeBetterAuthOrgPorts } from "../lib/org/better_auth_port.js";
import {
  asRequestHeaders,
  makeContractHelpers,
  type ContractHelpers,
} from "./auth-fixtures.js";

// The Better Auth server's own origin; requests carrying it clear the plugin's
// CSRF/origin check the same way a logged-in admin's browser would.
const kBaseURL = "http://localhost:3000";

async function createSqliteAuth(): Promise<Auth> {
  const auth = createAuth({
    database: new DatabaseSync(":memory:"),
    secret: "test-secret-value-that-is-at-least-32-chars",
    baseURL: kBaseURL,
  });
  const { runMigrations } = await getMigrations(auth.options);
  await runMigrations();
  return auth;
}

const mkKey = (orgId: OrgId, userId: UserId) =>
  create(MembershipKeySchema, {
    orgId: create(OrganizationIdSchema, { id: orgId }),
    userId: create(UserIdSchema, { id: userId }),
  });

const mkDeleteReq = (orgId: OrgId, userId: UserId) =>
  create(DeleteMembershipRequestSchema, { key: mkKey(orgId, userId) });

const mkGetReq = (orgId: OrgId, userId: UserId) =>
  create(GetMembershipRequestSchema, { key: mkKey(orgId, userId) });

describe("the /api/auth allowlist blocks org routes that bypass the rank rules", () => {
  let auth: Auth;
  let helpers: ContractHelpers;

  beforeAll(async () => {
    auth = await createSqliteAuth();
    helpers = makeContractHelpers(
      auth,
      makeBetterAuthOrgPorts(auth),
      makeBetterAuthMembershipPorts(auth),
    );
  });

  it("denies remove-member, the route that would let an admin drop a peer admin", async () => {
    const { orgId: org, hctx: ownerHctx } =
      await helpers.initOrgAndOwner("Gated org");
    const { sess: admin } = await helpers.addMember(ownerHctx, org, "admin");
    const { sess: victim } = await helpers.addMember(ownerHctx, org, "admin");

    await expect(
      deleteMembership(
        mkDeleteReq(org, victim.userId),
        await helpers.mkCtx(admin.headers),
      ),
    ).rejects.toMatchObject({ code: Code.PermissionDenied });

    const headers = asRequestHeaders(admin.headers);
    headers.set("content-type", "application/json");
    headers.set("origin", kBaseURL);
    const res = await handleBetterAuthReq(
      auth,
      new Request(`${kBaseURL}/api/auth/organization/remove-member`, {
        method: "POST",
        headers,
        body: JSON.stringify({
          memberIdOrEmail: victim.user.email,
          organizationId: org,
        }),
      }),
    );
    expect(res.status).toBe(403);

    const { membership } = await getMembership(
      mkGetReq(org, victim.userId),
      ownerHctx,
    );
    expect(membership).toBeDefined();
  });

  it("forwards an allowlisted route to the handler", async () => {
    const { sess: owner } = await helpers.initOrgAndOwner("Passthrough org");
    const res = await handleBetterAuthReq(
      auth,
      new Request(`${kBaseURL}/api/auth/get-session`, {
        headers: asRequestHeaders(owner.headers),
      }),
    );
    expect(res.status).toBe(200);
  });
});
