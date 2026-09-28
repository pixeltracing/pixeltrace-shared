import { create } from "@bufbuild/protobuf";
import { Code } from "@connectrpc/connect";
import {
  kIdPrefixes,
  type OrgId,
  type Role,
  type UserId,
} from "@pixeltrace/authz";
import {
  DeleteMembershipRequestSchema,
  GetMembershipRequestSchema,
  ListMembershipsRequestSchema,
  MembershipKeySchema,
  OrganizationIdSchema,
  Role as ProtoRole,
  UpdateMembershipRequestSchema,
  UserIdSchema,
} from "@pixeltrace/schema";
import { beforeAll, describe, expect, it } from "vitest";
import type { Auth } from "../lib/auth/create-auth.js";
import { makeBetterAuthMembershipPorts } from "../lib/membership/better_auth_port.js";
import {
  createMembership,
  deleteMembership,
  getMembership,
  listMemberships,
  updateMembership,
} from "../lib/membership/service.js";
import { makeBetterAuthOrgPorts } from "../lib/org/better_auth_port.js";
import { roleToProto } from "../lib/util/roles.js";
import {
  makeContractHelpers,
  mkMembershipReq,
  signUpUser,
  type ContractHelpers,
} from "./auth-fixtures.js";

const mkKey = (orgId: OrgId, userId: UserId) =>
  create(MembershipKeySchema, {
    orgId: create(OrganizationIdSchema, { id: orgId }),
    userId: create(UserIdSchema, { id: userId }),
  });

const mkGetReq = (orgId: OrgId, userId: UserId) =>
  create(GetMembershipRequestSchema, { key: mkKey(orgId, userId) });

const mkUpdateReq = (orgId: OrgId, userId: UserId, role: Role) =>
  create(UpdateMembershipRequestSchema, {
    key: mkKey(orgId, userId),
    props: { role: roleToProto(role) },
    updateMask: { paths: ["role"] },
  });

const mkDeleteReq = (orgId: OrgId, userId: UserId) =>
  create(DeleteMembershipRequestSchema, { key: mkKey(orgId, userId) });

const mkListReq = (
  orgId: OrgId,
  page?: { pageSize?: number; pageToken?: string },
) =>
  create(ListMembershipsRequestSchema, {
    orgId: create(OrganizationIdSchema, { id: orgId }),
    page: page
      ? { pageSize: page.pageSize ?? 0, pageToken: page.pageToken ?? "" }
      : undefined,
  });

export function runMembershipServiceTests(
  name: string,
  makeAuth: () => Promise<Auth> | Auth,
): void {
  describe(`MembershipService contract: ${name}`, () => {
    let auth: Auth;
    let mkCtx: ContractHelpers["mkCtx"];
    let initOrgAndOwner: ContractHelpers["initOrgAndOwner"];
    let addMember: ContractHelpers["addMember"];

    beforeAll(async () => {
      auth = await makeAuth();
      const orgs = makeBetterAuthOrgPorts(auth);
      const membs = makeBetterAuthMembershipPorts(auth);
      ({ mkCtx, initOrgAndOwner, addMember } = makeContractHelpers(
        auth,
        orgs,
        membs,
      ));
    });

    it("creates a membership and reads it back", async () => {
      const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
      const member = await signUpUser(auth);

      const created = await createMembership(
        mkMembershipReq(org, member.userId, "member"),
        hctx,
      );
      expect(created.membership?.key?.orgId?.id).toBe(org);
      expect(created.membership?.key?.userId?.id).toBe(member.userId);
      expect(created.membership?.props?.role).toBe(ProtoRole.MEMBER);

      const got = await getMembership(mkGetReq(org, member.userId), hctx);
      expect(got.membership?.key?.userId?.id).toBe(member.userId);
      expect(got.membership?.props?.role).toBe(ProtoRole.MEMBER);
    });

    it("rejects an unauthenticated create", async () => {
      const { orgId: org } = await initOrgAndOwner("Contract org");
      const member = await signUpUser(auth);
      const anon = await mkCtx(new Headers());
      await expect(
        createMembership(mkMembershipReq(org, member.userId, "member"), anon),
      ).rejects.toMatchObject({ code: Code.Unauthenticated });
    });

    it("rejects a create by a caller with no membership in the org", async () => {
      const { orgId: org } = await initOrgAndOwner("Contract org");
      const stranger = await signUpUser(auth);
      const member = await signUpUser(auth);
      await expect(
        createMembership(
          mkMembershipReq(org, member.userId, "member"),
          await mkCtx(stranger.headers),
        ),
      ).rejects.toMatchObject({ code: Code.PermissionDenied });
    });

    it("rejects appointing a role above the caller's own", async () => {
      const { orgId: org, hctx: ownerHctx } =
        await initOrgAndOwner("Contract org");
      const { hctx: adminHctx } = await addMember(ownerHctx, org, "admin");
      const member = await signUpUser(auth);
      await expect(
        createMembership(
          mkMembershipReq(org, member.userId, "owner"),
          adminHctx,
        ),
      ).rejects.toMatchObject({ code: Code.PermissionDenied });
    });

    it("reports a missing membership as not-found", async () => {
      const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
      const missing = await signUpUser(auth);
      await expect(
        getMembership(mkGetReq(org, missing.userId), hctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("updates a member's role and returns the updated membership", async () => {
      const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
      const member = await addMember(hctx, org, "member");

      const updated = await updateMembership(
        mkUpdateReq(org, member.sess.userId, "admin"),
        hctx,
      );
      expect(updated.membership?.props?.role).toBe(ProtoRole.ADMIN);

      const got = await getMembership(mkGetReq(org, member.sess.userId), hctx);
      expect(got.membership?.props?.role).toBe(ProtoRole.ADMIN);
    });

    it("reports an update to a missing membership as not-found", async () => {
      const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
      const missing = await signUpUser(auth);
      await expect(
        updateMembership(mkUpdateReq(org, missing.userId, "admin"), hctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("deletes a membership", async () => {
      const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
      const member = await addMember(hctx, org, "member");

      await deleteMembership(mkDeleteReq(org, member.sess.userId), hctx);

      await expect(
        getMembership(mkGetReq(org, member.sess.userId), hctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("reports a delete of a missing membership as not-found", async () => {
      const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
      const missing = await signUpUser(auth);
      await expect(
        deleteMembership(mkDeleteReq(org, missing.userId), hctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("lets a user remove their own membership regardless of rank", async () => {
      const { orgId: org, hctx: ownerHctx } =
        await initOrgAndOwner("Contract org");
      const { sess: self, hctx: selfHctx } = await addMember(
        ownerHctx,
        org,
        "member",
      );

      await deleteMembership(mkDeleteReq(org, self.userId), selfHctx);

      await expect(
        getMembership(mkGetReq(org, self.userId), ownerHctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("rejects removing a member at or above the caller's own role", async () => {
      const { orgId: org, hctx: ownerHctx } =
        await initOrgAndOwner("Contract org");
      const { hctx: adminHctx } = await addMember(ownerHctx, org, "admin");
      const otherAdmin = await addMember(ownerHctx, org, "admin");

      await expect(
        deleteMembership(mkDeleteReq(org, otherAdmin.sess.userId), adminHctx),
      ).rejects.toMatchObject({ code: Code.PermissionDenied });
    });

    it("prevents the sole owner from leaving the org", async () => {
      const {
        orgId: org,
        sess: owner,
        hctx,
      } = await initOrgAndOwner("Contract org");
      await expect(
        deleteMembership(mkDeleteReq(org, owner.userId), hctx),
      ).rejects.toMatchObject({ code: Code.FailedPrecondition });

      const got = await getMembership(mkGetReq(org, owner.userId), hctx);
      expect(got.membership?.props?.role).toBe(ProtoRole.OWNER);
    });

    it("prevents the sole owner from self-demoting", async () => {
      const {
        orgId: org,
        sess: owner,
        hctx,
      } = await initOrgAndOwner("Contract org");

      await expect(
        updateMembership(mkUpdateReq(org, owner.userId, "viewer"), hctx),
      ).rejects.toMatchObject({ code: Code.FailedPrecondition });

      const got = await getMembership(mkGetReq(org, owner.userId), hctx);
      expect(got.membership?.props?.role).toBe(ProtoRole.OWNER);
    });

    it("lets an owner leave once another owner remains", async () => {
      const { orgId: org, hctx: ownerHctx } =
        await initOrgAndOwner("Contract org");
      const second = await addMember(ownerHctx, org, "owner");

      await deleteMembership(mkDeleteReq(org, second.sess.userId), second.hctx);

      await expect(
        getMembership(mkGetReq(org, second.sess.userId), ownerHctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("lets an owner self-demote once another owner remains", async () => {
      const {
        orgId: org,
        sess: owner,
        hctx: ownerHctx,
      } = await initOrgAndOwner("Contract org");
      await addMember(ownerHctx, org, "owner");

      const demoted = await updateMembership(
        mkUpdateReq(org, owner.userId, "viewer"),
        ownerHctx,
      );
      expect(demoted.membership?.props?.role).toBe(ProtoRole.VIEWER);
    });

    it("rejects a malformed id as invalid-argument, not internal", async () => {
      const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
      const member = await signUpUser(auth);

      await expect(
        getMembership(mkGetReq("not-an-org-id" as OrgId, member.userId), hctx),
      ).rejects.toMatchObject({ code: Code.InvalidArgument });
      await expect(
        getMembership(mkGetReq(org, "not-a-user-id" as UserId), hctx),
      ).rejects.toMatchObject({ code: Code.InvalidArgument });
    });

    it("reports a create for an unknown user as not-found", async () => {
      const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
      const unknown = `${kIdPrefixes.user}nosuchuser` as UserId;
      await expect(
        createMembership(mkMembershipReq(org, unknown, "member"), hctx),
      ).rejects.toMatchObject({ code: Code.NotFound });
    });

    it("denies a create before revealing whether the membership exists", async () => {
      const { orgId: org, hctx: ownerHctx } =
        await initOrgAndOwner("Contract org");
      const { hctx: viewerHctx } = await addMember(ownerHctx, org, "viewer");
      const existing = await addMember(ownerHctx, org, "member");

      // A viewer cannot appoint members, so both an existing and an absent
      // target must read the same to them: AlreadyExists here would tell a
      // viewer who is in the org.
      await expect(
        createMembership(
          mkMembershipReq(org, existing.sess.userId, "member"),
          viewerHctx,
        ),
      ).rejects.toMatchObject({ code: Code.PermissionDenied });
    });

    it("treats an update selecting no writable field as a read", async () => {
      const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
      const member = await addMember(hctx, org, "member");

      // Props are only needed to write, so a props-less no-op update is a read,
      // not an InvalidArgument.
      const resp = await updateMembership(
        create(UpdateMembershipRequestSchema, {
          key: mkKey(org, member.sess.userId),
          updateMask: { paths: ["doesnotexist"] },
        }),
        hctx,
      );
      expect(resp.membership?.props?.role).toBe(ProtoRole.MEMBER);
    });

    describe("listMemberships", () => {
      it("lists an org's memberships, one page at a time", async () => {
        const { orgId: org, sess: owner, hctx } =
          await initOrgAndOwner("Contract org");
        const a = await addMember(hctx, org, "member");
        const b = await addMember(hctx, org, "admin");
        const all = [owner.userId, a.sess.userId, b.sess.userId];

        const seen: string[] = [];
        let pageToken = "";
        do {
          const resp = await listMemberships(
            mkListReq(org, { pageSize: 2, pageToken }),
            hctx,
          );
          expect(resp.memberships.length).toBeLessThanOrEqual(2);
          seen.push(...resp.memberships.map((m) => m.key!.userId!.id));
          pageToken = resp.page?.nextPageToken ?? "";
        } while (pageToken);

        expect(seen.sort()).toEqual([...all].sort());
      });

      it("rejects a list by a caller with no membership in the org", async () => {
        const { orgId: org } = await initOrgAndOwner("Contract org");
        const stranger = await signUpUser(auth);
        await expect(
          listMemberships(mkListReq(org), await mkCtx(stranger.headers)),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
      });

      it("rejects a list by a viewer", async () => {
        const { orgId: org, hctx: ownerHctx } =
          await initOrgAndOwner("Contract org");
        const { hctx: viewerHctx } = await addMember(ownerHctx, org, "viewer");
        await expect(
          listMemberships(mkListReq(org), viewerHctx),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
      });

      it("rejects a malformed page token", async () => {
        const { orgId: org, hctx } = await initOrgAndOwner("Contract org");
        await expect(
          listMemberships(mkListReq(org, { pageToken: "not-a-cursor" }), hctx),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });
    });
  });
}
