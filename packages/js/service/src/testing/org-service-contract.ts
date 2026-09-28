import { create } from "@bufbuild/protobuf";
import { Code } from "@connectrpc/connect";
import { kIdPrefixes, newId, toOrgId, type OrgId } from "@pixeltrace/authz";
import {
  CreateOrganizationRequestSchema,
  DeleteOrganizationRequestSchema,
  GetMembershipRequestSchema,
  GetOrganizationRequestSchema,
  MembershipKeySchema,
  Role as ProtoRole,
  UpdateOrganizationRequestSchema,
} from "@pixeltrace/schema";
import { afterEach, beforeAll, describe, expect, it } from "vitest";
import type { Auth } from "../lib/auth/create-auth.js";
import { makeBetterAuthMembershipPorts } from "../lib/membership/better_auth_port.js";
import { getMembership } from "../lib/membership/service.js";
import { makeBetterAuthOrgPorts } from "../lib/org/better_auth_port.js";
import { defaultSlugSuffix } from "../lib/org/ports.js";
import {
  createOrganization,
  deleteOrganization,
  getOrganization,
  updateOrganization,
} from "../lib/org/service.js";
import {
  makeContractHelpers,
  signUpUser,
  switchOrg,
  type ContractHelpers,
} from "./auth-fixtures.js";

const mkCreateReq = (name: string) =>
  create(CreateOrganizationRequestSchema, { props: { name } });
const mkGetReq = (id: OrgId) =>
  create(GetOrganizationRequestSchema, { id: { id } });
const mkUpdateReq = (id: OrgId, name: string) =>
  create(UpdateOrganizationRequestSchema, { id: { id }, props: { name } });
const mkDeleteReq = (id: OrgId, dangerouslyAllowProjectDeletion = false) =>
  create(DeleteOrganizationRequestSchema, {
    id: { id },
    dangerouslyAllowProjectDeletion,
  });
// An update that selects no writable field (`name` is the only one), so the
// endpoint treats it as a read. Used to exercise the read-authz branch.
const mkReadOnlyUpdateReq = (id: OrgId) =>
  create(UpdateOrganizationRequestSchema, {
    id: { id },
    props: { name: "ignored" },
    updateMask: { paths: ["unwritable"] },
  });

export function runOrgServiceTests(
  name: string,
  makeAuth: () => Promise<Auth> | Auth,
): void {
  describe(`OrganizationService contract: ${name}`, () => {
    let auth: Auth;
    let mkCtx: ContractHelpers["mkCtx"];
    let initOrgAndOwner: ContractHelpers["initOrgAndOwner"];
    let addMember: ContractHelpers["addMember"];

    // Per-test optional override for the org slug suffix.
    let slugSuffix: () => string = defaultSlugSuffix;
    afterEach(() => {
      slugSuffix = defaultSlugSuffix;
    });

    beforeAll(async () => {
      auth = await makeAuth();
      const orgs = makeBetterAuthOrgPorts(auth, () => slugSuffix());
      const membs = makeBetterAuthMembershipPorts(auth);
      ({ mkCtx, initOrgAndOwner, addMember } = makeContractHelpers(
        auth,
        orgs,
        membs,
      ));
    });

    it("creates an org, assigns an id, and reads it back", async () => {
      const sess = await signUpUser(auth);
      const created = await createOrganization(
        mkCreateReq("Acme"),
        await mkCtx(sess.headers),
      );
      expect(created.id?.id).toBeTruthy();
      expect(created.props?.name).toBe("Acme");

      // Reading requires the org to be the caller's active org (that's where the
      // principal's role is resolved from), so switch to it before reading back.
      const orgId = toOrgId(created.id!.id);
      await switchOrg(auth, sess.headers, orgId);
      const got = await getOrganization(
        mkGetReq(orgId),
        await mkCtx(sess.headers),
      );
      expect(got.organization?.id?.id).toBe(orgId);
      expect(got.organization?.props?.name).toBe("Acme");
    });

    it("makes the creating user the org owner", async () => {
      const { sess, orgId, hctx } = await initOrgAndOwner("Acme");

      const resp = await getMembership(
        create(GetMembershipRequestSchema, {
          key: create(MembershipKeySchema, {
            orgId: { id: orgId },
            userId: { id: sess.userId },
          }),
        }),
        hctx,
      );

      const m = resp.membership;
      expect(m?.key?.orgId?.id).toBe(orgId);
      expect(m?.key?.userId?.id).toBe(sess.userId);
      expect(m?.props?.role).toBe(ProtoRole.OWNER);
    });

    it("rejects an unauthenticated create", async () => {
      const hctx = await mkCtx(new Headers());
      await expect(
        createOrganization(mkCreateReq("Acme"), hctx),
      ).rejects.toMatchObject({ code: Code.Unauthenticated });
    });

    it("reports a missing organization as not-found", async () => {
      const { hctx } = await initOrgAndOwner("Acme");
      const missing = newId(kIdPrefixes.org);
      await expect(
        getOrganization(mkGetReq(missing), hctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("updates an organization's name and returns the updated org", async () => {
      const { orgId, hctx } = await initOrgAndOwner("Acme");

      const updated = await updateOrganization(
        mkUpdateReq(orgId, "Renamed"),
        hctx,
      );
      expect(updated.organization?.props?.name).toBe("Renamed");

      const got = await getOrganization(mkGetReq(orgId), hctx);
      expect(got.organization?.props?.name).toBe("Renamed");
    });

    it("reports an update to a missing organization as not-found", async () => {
      const { hctx } = await initOrgAndOwner("Acme");
      const missing = newId(kIdPrefixes.org);
      await expect(
        updateOrganization(mkUpdateReq(missing, "x"), hctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("rejects an unauthenticated get", async () => {
      const { orgId } = await initOrgAndOwner("Acme");
      const anon = await mkCtx(new Headers());
      await expect(
        getOrganization(mkGetReq(orgId), anon),
      ).rejects.toMatchObject({ code: Code.Unauthenticated });
    });

    it("lets a non-owner member read the organization", async () => {
      const { orgId, hctx: ownerHctx } = await initOrgAndOwner("Acme");
      const { hctx: memberHctx } = await addMember(ownerHctx, orgId, "member");

      const got = await getOrganization(mkGetReq(orgId), memberHctx);
      expect(got.organization?.id?.id).toBe(orgId);
    });

    it("hides the organization from a non-member (not-found)", async () => {
      const { orgId } = await initOrgAndOwner("Acme");
      const stranger = await signUpUser(auth);
      await expect(
        getOrganization(mkGetReq(orgId), await mkCtx(stranger.headers)),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("rejects an unauthenticated update", async () => {
      const { orgId } = await initOrgAndOwner("Acme");
      const anon = await mkCtx(new Headers());
      await expect(
        updateOrganization(mkUpdateReq(orgId, "Renamed"), anon),
      ).rejects.toMatchObject({ code: Code.Unauthenticated });
    });

    it("rejects a name update by a non-owner member", async () => {
      const { orgId, hctx: ownerHctx } = await initOrgAndOwner("Acme");
      const { hctx: memberHctx } = await addMember(ownerHctx, orgId, "member");

      await expect(
        updateOrganization(mkUpdateReq(orgId, "Renamed"), memberHctx),
      ).rejects.toMatchObject({ code: Code.PermissionDenied });

      // The org name is unchanged.
      const got = await getOrganization(mkGetReq(orgId), ownerHctx);
      expect(got.organization?.props?.name).toBe("Acme");
    });

    it("allows a member's read-only update (no writable field selected)", async () => {
      const { orgId, hctx: ownerHctx } = await initOrgAndOwner("Acme");
      const { hctx: memberHctx } = await addMember(ownerHctx, orgId, "member");

      const resp = await updateOrganization(
        mkReadOnlyUpdateReq(orgId),
        memberHctx,
      );
      expect(resp.organization?.props?.name).toBe("Acme");
    });

    it("hides the organization from a non-member on update (not-found)", async () => {
      const { orgId } = await initOrgAndOwner("Acme");
      const stranger = await signUpUser(auth);
      await expect(
        updateOrganization(
          mkReadOnlyUpdateReq(orgId),
          await mkCtx(stranger.headers),
        ),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("deletes an organization, then reports it not-found", async () => {
      const { orgId, hctx } = await initOrgAndOwner("Acme");

      await deleteOrganization(mkDeleteReq(orgId), hctx);

      await expect(
        getOrganization(mkGetReq(orgId), hctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("refuses to delete a personal organization", async () => {
      const sess = await signUpUser(auth);
      // The personal org must be active so the caller resolves as its owner;
      // otherwise we'd trip PermissionDenied first and not reach the
      // personal-org guard we're testing.
      await switchOrg(auth, sess.headers, sess.personalOrgId);
      const hctx = await mkCtx(sess.headers);

      await expect(
        deleteOrganization(mkDeleteReq(sess.personalOrgId), hctx),
      ).rejects.toMatchObject({ code: Code.FailedPrecondition });

      // Still there.
      const got = await getOrganization(mkGetReq(sess.personalOrgId), hctx);
      expect(got.organization?.id?.id).toBe(sess.personalOrgId);
    });

    it("refuses to delete a personal organization even with the cascade flag", async () => {
      const sess = await signUpUser(auth);
      await switchOrg(auth, sess.headers, sess.personalOrgId);
      const hctx = await mkCtx(sess.headers);

      await expect(
        deleteOrganization(mkDeleteReq(sess.personalOrgId, true), hctx),
      ).rejects.toMatchObject({ code: Code.FailedPrecondition });
    });

    it("reports a delete of a missing organization as not-found", async () => {
      const { hctx } = await initOrgAndOwner("Acme");
      const missing = newId(kIdPrefixes.org);
      await expect(
        deleteOrganization(mkDeleteReq(missing), hctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("rejects an unauthenticated delete", async () => {
      const { orgId } = await initOrgAndOwner("Acme");
      const anon = await mkCtx(new Headers());
      await expect(
        deleteOrganization(mkDeleteReq(orgId), anon),
      ).rejects.toMatchObject({ code: Code.Unauthenticated });
    });

    it("rejects a delete by a non-owner member", async () => {
      const { orgId, hctx: ownerHctx } = await initOrgAndOwner("Acme");
      const { hctx: memberHctx } = await addMember(ownerHctx, orgId, "member");

      await expect(
        deleteOrganization(mkDeleteReq(orgId), memberHctx),
      ).rejects.toMatchObject({ code: Code.PermissionDenied });

      // The org still exists.
      const got = await getOrganization(mkGetReq(orgId), ownerHctx);
      expect(got.organization?.id?.id).toBe(orgId);
    });

    it("hides the organization from a non-member on delete (not-found)", async () => {
      const { orgId } = await initOrgAndOwner("Acme");
      const stranger = await signUpUser(auth);
      await expect(
        deleteOrganization(mkDeleteReq(orgId), await mkCtx(stranger.headers)),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("retries with a new slug when the derived one collides", async () => {
      const suffixes = ["dup", "dup", "unique"];
      slugSuffix = () => suffixes.shift() ?? "unique";

      const sess = await signUpUser(auth);
      const hctx = await mkCtx(sess.headers);

      const first = await createOrganization(mkCreateReq("Acme"), hctx);
      const second = await createOrganization(mkCreateReq("Acme"), hctx);

      expect(first.id?.id).toBeTruthy();
      expect(second.id?.id).toBeTruthy();
      expect(second.id?.id).not.toBe(first.id?.id);
    });

    it("gives up after exhausting slug retries", async () => {
      slugSuffix = () => "fixed";

      const sess = await signUpUser(auth);
      const hctx = await mkCtx(sess.headers);

      await createOrganization(mkCreateReq("Acme"), hctx);
      await expect(
        createOrganization(mkCreateReq("Acme"), hctx),
      ).rejects.toMatchObject({ code: Code.Aborted });
    });
  });
}
