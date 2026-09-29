import { create } from "@bufbuild/protobuf";
import {
  Code,
  createContextValues,
  type HandlerContext,
} from "@connectrpc/connect";
import {
  authorize,
  kIdPrefixes,
  newId,
  projectMembershipResource,
  projectResource,
  toOrgId,
  toProjectId,
  userPrincipal,
  type Action,
  type Grant,
  type OrgId,
  type ProjectId,
  type Resource,
  type Role,
  type UserId,
  type UserPrincipal,
} from "@pixeltrace/authz";
import {
  AssignProjectMemberRequestSchema,
  ClearSessionsRequestSchema,
  ListDeletedSessionsRequestSchema,
  RestoreSessionRequestSchema,
  CreateProjectRequestSchema,
  CreateSiteKeyRequestSchema,
  DataResidency,
  DeleteProjectRequestSchema,
  DeleteSessionRequestSchema,
  GetProjectMemberRequestSchema,
  GetProjectRequestSchema,
  GetSessionPlaybackUrlRequestSchema,
  GetSessionRequestSchema,
  GetSiteKeyRequestSchema,
  GetUnseenSessionCountRequestSchema,
  DeleteMembershipRequestSchema,
  ListProjectMembersRequestSchema,
  ListProjectsRequestSchema,
  MembershipKeySchema,
  ListLiveSessionsRequestSchema,
  ListSessionsRequestSchema,
  WatchLiveSessionRequestSchema,
  ListSiteKeysRequestSchema,
  MarkAllSessionsSeenRequestSchema,
  MarkSessionsSeenRequestSchema,
  SessionIdSchema,
  SessionTagUpdateSchema,
  CreateProjectTagRequestSchema,
  DeleteProjectTagRequestSchema,
  ListProjectTagsRequestSchema,
  ProjectTagColor,
  ProjectTagKind,
  ProjectTagIdSchema,
  ProjectTagPropsSchema,
  UpdateProjectTagRequestSchema,
  UpdateSessionRequestSchema,
  CreateOrganizationRequestSchema,
  DeleteOrganizationRequestSchema,
  GetOrganizationRequestSchema,
  OrganizationIdSchema,
  ProjectIdSchema,
  ProjectMemberKeySchema,
  Role as ProtoRole,
  ProjectSiteKey_Status,
  RemoveProjectMemberRequestSchema,
  RevokeSiteKeyRequestSchema,
  SiteKeySchema,
  StorageBackend,
  UpdateProjectMemberRequestSchema,
  UpdateProjectRequestSchema,
  UpdateSiteKeyRequestSchema,
  UserIdSchema,
} from "@pixeltrace/schema";
import { beforeAll, describe, expect, it } from "vitest";
import { kAuthContext } from "../lib/auth/context";
import type { Auth } from "../lib/auth/create-auth";
import { resolveAuthContext } from "../lib/auth/interceptor";
import { makeBetterAuthMembershipPorts } from "../lib/membership/better_auth_port";
import { kMembershipPorts } from "../lib/membership/context";
import type { MembershipPorts } from "../lib/membership/ports";
import { deleteMembership } from "../lib/membership/service";
import { makeBetterAuthOrgPorts } from "../lib/org/better_auth_port";
import { kOrgPorts } from "../lib/org/context";
import type { OrgPorts } from "../lib/org/ports";
import { kProjectPorts } from "../lib/project/context";
import {
  kMaxMarkSeenIds,
  kMaxTagLength,
  kMaxTagsPerProject,
  kMaxTagsPerSession,
  kStarterTagSeeds,
  kSystemTagSeeds,
  type ProjectPorts,
} from "../lib/project/ports";
import {
  assignProjectMember,
  createProject,
  createProjectTag,
  createSiteKey,
  clearSessions,
  listDeletedSessions,
  restoreSession,
  deleteProject,
  deleteProjectTag,
  deleteSession,
  getProject,
  getProjectMember,
  getSession,
  getSessionPlaybackUrl,
  getSiteKey,
  getUnseenSessionCount,
  listProjectMembers,
  listProjectTags,
  listLiveSessions,
  listSessions,
  watchLiveSession,
  listSiteKeys,
  markAllSessionsSeen,
  markSessionsSeen,
  removeProjectMember,
  revokeSiteKey,
  updateProject,
  updateProjectMember,
  updateProjectTag,
  updateSession,
  updateSiteKey,
} from "../lib/project/service";
import {
  createOrganization,
  deleteOrganization,
  getOrganization,
  listProjects,
} from "../lib/org/service";
import { encodeCursor } from "../lib/util/pagination";
import { roleToProto } from "../lib/util/roles";
import {
  appointMember,
  asRequestHeaders,
  signUpUser,
  switchOrg,
  type TestSession,
} from "./auth-fixtures";

interface ProjectStoreTestHarness {
  makeAuth: () => Promise<Auth> | Auth;
  makePorts: () => ProjectPorts;
}

/**
 * Page tokens that decode cleanly but carry none of the keyset a listing
 * paginates by. A store has to read these as the malformed tokens they are,
 * rather than feeding undefined into its query and failing internally.
 */
const kShapelessPageTokens = [
  encodeCursor({}),
  encodeCursor({ notAKeyset: true }),
  encodeCursor(5),
  encodeCursor("x"),
  encodeCursor(null),
];

/** A create request. An empty `name` leaves the props off the request. */
const mkCreateReq = (
  orgId: OrgId,
  storageBackend: StorageBackend = StorageBackend.MANAGED,
  name = "",
) =>
  create(CreateProjectRequestSchema, {
    orgId: create(OrganizationIdSchema, { id: orgId }),
    dataResidency: DataResidency.US,
    storageBackend,
    props: name === "" ? undefined : { name },
  });

/** A create request missing the required data-residency field. */
const mkCreateReqNoResidency = (orgId: OrgId) =>
  create(CreateProjectRequestSchema, {
    orgId: create(OrganizationIdSchema, { id: orgId }),
    storageBackend: StorageBackend.MANAGED,
  });

const mkGetReq = (projId: ProjectId) =>
  create(GetProjectRequestSchema, {
    id: create(ProjectIdSchema, { id: projId }),
  });

const mkUpdateReq = (projId: ProjectId, name: string) =>
  create(UpdateProjectRequestSchema, {
    id: create(ProjectIdSchema, { id: projId }),
    props: { name },
    updateMask: { paths: ["name"] },
  });

const mkNonNameUpdateReq = (projId: ProjectId) =>
  create(UpdateProjectRequestSchema, {
    id: create(ProjectIdSchema, { id: projId }),
    props: { name: "should be ignored", recordingDisabled: true },
    updateMask: { paths: ["doesnotexist"] },
  });

const mkRecordingUpdateReq = (projId: ProjectId, recordingDisabled: boolean) =>
  create(UpdateProjectRequestSchema, {
    id: create(ProjectIdSchema, { id: projId }),
    props: { name: "should be ignored", recordingDisabled },
    updateMask: { paths: ["recording_disabled"] },
  });

/** The optional numeric props, as (mask path, props key) pairs. */
const kNumericProps = [
  ["discard_under_seconds", "discardUnderSeconds"],
  ["idle_timeout_seconds", "idleTimeoutSeconds"],
  ["retention_days", "retentionDays"],
] as const;

/** The subset of {@link kNumericProps} that must be strictly positive. */
const kPositiveProps = [
  ["idle_timeout_seconds", "idleTimeoutSeconds"],
  ["retention_days", "retentionDays"],
] as const;

const mkNumericUpdateReq = (
  projId: ProjectId,
  path: (typeof kNumericProps)[number][0],
  key: (typeof kNumericProps)[number][1],
  value: number | undefined,
) =>
  create(UpdateProjectRequestSchema, {
    id: create(ProjectIdSchema, { id: projId }),
    props: { name: "should be ignored", [key]: value },
    updateMask: { paths: [path] },
  });

const mkDeleteReq = (projId: ProjectId) =>
  create(DeleteProjectRequestSchema, {
    id: create(ProjectIdSchema, { id: projId }),
  });

/** A well-formed project id that refers to no stored project. */
const mkUnknownId = () => toProjectId(newId(kIdPrefixes.project));

const mkCreateSiteKeyReq = (projId: ProjectId, label = "") =>
  create(CreateSiteKeyRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    props: { label },
  });

const mkGetSiteKeyReq = (projId: ProjectId, key: string) =>
  create(GetSiteKeyRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    key: create(SiteKeySchema, { key }),
  });

const mkListSiteKeysReq = (
  projId: ProjectId,
  page?: { pageSize?: number; pageToken?: string },
) =>
  create(ListSiteKeysRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    page: page
      ? { pageSize: page.pageSize ?? 0, pageToken: page.pageToken ?? "" }
      : undefined,
  });

const mkUpdateSiteKeyReq = (projId: ProjectId, key: string, label: string) =>
  create(UpdateSiteKeyRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    key: create(SiteKeySchema, { key }),
    props: { label },
    updateMask: { paths: ["label"] },
  });

const mkRevokeSiteKeyReq = (projId: ProjectId, key: string) =>
  create(RevokeSiteKeyRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    key: create(SiteKeySchema, { key }),
  });

const mkListSessionsReq = (
  projId: ProjectId,
  page?: { pageSize?: number; pageToken?: string },
  unseenOnly = false,
) =>
  create(ListSessionsRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    unseenOnly,
    page: page
      ? { pageSize: page.pageSize ?? 0, pageToken: page.pageToken ?? "" }
      : undefined,
  });

const mkListLiveSessionsReq = (projId: ProjectId) =>
  create(ListLiveSessionsRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
  });

const mkWatchLiveSessionReq = (
  projId: ProjectId,
  sessionId: string,
  sdpOffer = "v=0\r\n",
) =>
  create(WatchLiveSessionRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    sessionId: create(SessionIdSchema, { id: sessionId }),
    sdpOffer,
  });

const mkGetSessionReq = (projId: ProjectId, sessionId: string) =>
  create(GetSessionRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    id: create(SessionIdSchema, { id: sessionId }),
  });

const mkPlaybackUrlReq = (projId: ProjectId, sessionId: string) =>
  create(GetSessionPlaybackUrlRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    sessionId: create(SessionIdSchema, { id: sessionId }),
  });

const mkUpdateSessionReq = (
  projId: ProjectId,
  sessionId: string,
  opts: { add?: string[]; remove?: string[] } = {},
) =>
  create(UpdateSessionRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    id: create(SessionIdSchema, { id: sessionId }),
    tags: create(SessionTagUpdateSchema, {
      add: (opts.add ?? []).map((id) => create(ProjectTagIdSchema, { id })),
      remove: (opts.remove ?? []).map((id) =>
        create(ProjectTagIdSchema, { id }),
      ),
    }),
  });

const mkCreateProjectTagReq = (
  projId: ProjectId,
  props: { label: string; color?: ProjectTagColor; customHex?: string },
) =>
  create(CreateProjectTagRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    props: create(ProjectTagPropsSchema, {
      label: props.label,
      color: props.color ?? ProjectTagColor.GRAY,
      customHex: props.customHex,
    }),
  });

const mkListProjectTagsReq = (projId: ProjectId, includeCounts = false) =>
  create(ListProjectTagsRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    includeSessionCounts: includeCounts,
  });

const mkUpdateProjectTagReq = (
  projId: ProjectId,
  tagId: string,
  props: { label?: string; color?: ProjectTagColor; customHex?: string },
  paths: string[],
) =>
  create(UpdateProjectTagRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    id: create(ProjectTagIdSchema, { id: tagId }),
    props: create(ProjectTagPropsSchema, {
      label: props.label ?? "",
      color: props.color ?? ProjectTagColor.UNSPECIFIED,
      customHex: props.customHex,
    }),
    updateMask: { paths },
  });

const mkDeleteProjectTagReq = (projId: ProjectId, tagId: string) =>
  create(DeleteProjectTagRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    id: create(ProjectTagIdSchema, { id: tagId }),
  });

const mkUnknownTagId = () => newId(kIdPrefixes.projectTag);

const mkDeleteSessionReq = (projId: ProjectId, sessionId: string) =>
  create(DeleteSessionRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    id: create(SessionIdSchema, { id: sessionId }),
  });

const mkListDeletedSessionsReq = (
  projId: ProjectId,
  page?: { pageSize?: number; pageToken?: string },
) =>
  create(ListDeletedSessionsRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    page: page
      ? { pageSize: page.pageSize ?? 0, pageToken: page.pageToken ?? "" }
      : undefined,
  });

const mkRestoreSessionReq = (projId: ProjectId, sessionId: string) =>
  create(RestoreSessionRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    id: create(SessionIdSchema, { id: sessionId }),
  });

const mkClearSessionsReq = (projId: ProjectId) =>
  create(ClearSessionsRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
  });

const mkMarkSeenReq = (
  projId: ProjectId,
  sessionIds: readonly string[],
  seen = true,
) =>
  create(MarkSessionsSeenRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    ids: sessionIds.map((id) => create(SessionIdSchema, { id })),
    seen,
  });

const mkMarkAllSeenReq = (projId: ProjectId) =>
  create(MarkAllSessionsSeenRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
  });

const mkUnseenCountReq = (projId: ProjectId) =>
  create(GetUnseenSessionCountRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
  });

const mkAssignReq = (projId: ProjectId, userId: UserId, role: Role) =>
  create(AssignProjectMemberRequestSchema, {
    key: create(ProjectMemberKeySchema, {
      projectId: create(ProjectIdSchema, { id: projId }),
      userId: create(UserIdSchema, { id: userId }),
    }),
    props: { role: roleToProto(role) },
  });

const mkDeleteMembershipReq = (orgId: OrgId, userId: UserId) =>
  create(DeleteMembershipRequestSchema, {
    key: create(MembershipKeySchema, {
      orgId: create(OrganizationIdSchema, { id: orgId }),
      userId: create(UserIdSchema, { id: userId }),
    }),
  });

const mkGetMemberReq = (projId: ProjectId, userId: UserId) =>
  create(GetProjectMemberRequestSchema, {
    key: create(ProjectMemberKeySchema, {
      projectId: create(ProjectIdSchema, { id: projId }),
      userId: create(UserIdSchema, { id: userId }),
    }),
  });

const mkUpdateMemberReq = (projId: ProjectId, userId: UserId, role: Role) =>
  create(UpdateProjectMemberRequestSchema, {
    key: create(ProjectMemberKeySchema, {
      projectId: create(ProjectIdSchema, { id: projId }),
      userId: create(UserIdSchema, { id: userId }),
    }),
    props: { role: roleToProto(role) },
    updateMask: { paths: ["role"] },
  });

/** An update request whose mask selects no writable field. */
const mkNonRoleUpdateMemberReq = (projId: ProjectId, userId: UserId) =>
  create(UpdateProjectMemberRequestSchema, {
    key: create(ProjectMemberKeySchema, {
      projectId: create(ProjectIdSchema, { id: projId }),
      userId: create(UserIdSchema, { id: userId }),
    }),
    props: { role: roleToProto("admin") },
    updateMask: { paths: ["doesnotexist"] },
  });

const mkRemoveMemberReq = (projId: ProjectId, userId: UserId) =>
  create(RemoveProjectMemberRequestSchema, {
    key: create(ProjectMemberKeySchema, {
      projectId: create(ProjectIdSchema, { id: projId }),
      userId: create(UserIdSchema, { id: userId }),
    }),
  });

const mkListMembersReq = (
  projId: ProjectId,
  page?: { pageSize?: number; pageToken?: string },
) =>
  create(ListProjectMembersRequestSchema, {
    projectId: create(ProjectIdSchema, { id: projId }),
    page: page
      ? { pageSize: page.pageSize ?? 0, pageToken: page.pageToken ?? "" }
      : undefined,
  });

const mkListProjectsReq = (
  orgId: OrgId,
  page?: { pageSize?: number; pageToken?: string },
) =>
  create(ListProjectsRequestSchema, {
    orgId: create(OrganizationIdSchema, { id: orgId }),
    page: page
      ? { pageSize: page.pageSize ?? 0, pageToken: page.pageToken ?? "" }
      : undefined,
  });

/**
 * Asserts that every site-key operation rejects with `code` for the caller
 * behind `hctx`. `projId`/`key` name the project and key the ops target.
 */
async function expectSiteKeyOpsRejected(
  hctx: HandlerContext,
  projId: ProjectId,
  key: string,
  code: Code,
): Promise<void> {
  await expect(
    createSiteKey(mkCreateSiteKeyReq(projId), hctx),
  ).rejects.toMatchObject({ code });
  await expect(
    getSiteKey(mkGetSiteKeyReq(projId, key), hctx),
  ).rejects.toMatchObject({ code });
  await expect(
    listSiteKeys(mkListSiteKeysReq(projId), hctx),
  ).rejects.toMatchObject({ code });
  await expect(
    updateSiteKey(mkUpdateSiteKeyReq(projId, key, "x"), hctx),
  ).rejects.toMatchObject({ code });
  await expect(
    revokeSiteKey(mkRevokeSiteKeyReq(projId, key), hctx),
  ).rejects.toMatchObject({ code });
}

export function runProjectServiceContract(
  name: string,
  harness: ProjectStoreTestHarness,
): void {
  describe(`ProjectService contract: ${name}`, () => {
    let auth: Auth;
    let projs: ProjectPorts;
    let orgs: OrgPorts;
    let membs: MembershipPorts;

    beforeAll(async () => {
      auth = await harness.makeAuth();
      projs = harness.makePorts();
      orgs = makeBetterAuthOrgPorts(auth);
      membs = makeBetterAuthMembershipPorts(auth);
    });

    async function mkCtx(headers: Headers): Promise<HandlerContext> {
      const values = createContextValues();
      values.set(kProjectPorts, projs);
      values.set(kOrgPorts, orgs);
      values.set(kMembershipPorts, { memberships: membs.memberships });

      const requestHeader = asRequestHeaders(headers);
      values.set(
        kAuthContext,
        await resolveAuthContext(auth, requestHeader, (userId, hdrs) =>
          projs.projects.getProjectRoles(userId, hdrs),
        ),
      );
      return { values, requestHeader } as unknown as HandlerContext;
    }

    // Signs up a new owner and returns their session, personal org, and a
    // handler context acting as that owner.
    async function initOwner(): Promise<{
      sess: TestSession;
      org: OrgId;
      hctx: HandlerContext;
    }> {
      const sess = await signUpUser(auth);
      return { sess, org: sess.personalOrgId, hctx: await mkCtx(sess.headers) };
    }

    // Creates a project in `org` and returns the created proto message
    // (asserting it came back with an id).
    async function createProj(
      hctx: HandlerContext,
      org: OrgId,
      storageBackend: StorageBackend = StorageBackend.MANAGED,
    ) {
      const resp = await createProject(mkCreateReq(org, storageBackend), hctx);
      if (!resp.project?.id) {
        throw new Error(
          "expected createProject to return a project with an id",
        );
      }
      return resp.project;
    }

    describe("operations", () => {
      it("creates a personal-org project and reads it back", async () => {
        const { org, hctx } = await initOwner();
        const createResp = await createProject(
          mkCreateReq(org, StorageBackend.MANAGED, "Marketing site"),
          hctx,
        );
        const proj = createResp.project;
        expect(proj?.orgId?.id).toBe(org);
        expect(proj?.props?.name).toBe("Marketing site");
        expect(proj?.dataResidency).toBe(DataResidency.US);
        expect(proj?.storageBackend).toBe(StorageBackend.MANAGED);

        const getResp = await getProject(
          mkGetReq(toProjectId(proj!.id!.id)),
          hctx,
        );
        expect(getResp.project).toEqual(proj);
      });

      it("names a project created without one", async () => {
        const { org, hctx } = await initOwner();
        const createResp = await createProject(mkCreateReq(org), hctx);
        expect(createResp.project?.props?.name).toBe("Untitled project");
      });

      it("trims a whitespace-only name down to the default", async () => {
        const { org, hctx } = await initOwner();
        const createResp = await createProject(
          mkCreateReq(org, StorageBackend.MANAGED, "  Padded name  "),
          hctx,
        );
        expect(createResp.project?.props?.name).toBe("Padded name");

        const blank = await createProject(
          mkCreateReq(org, StorageBackend.MANAGED, "   "),
          hctx,
        );
        expect(blank.project?.props?.name).toBe("Untitled project");
      });

      it("reports an unknown project as not-found", async () => {
        const { hctx } = await initOwner();
        await expect(
          getProject(mkGetReq(mkUnknownId()), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("rejects a malformed project id as invalid-argument", async () => {
        const { hctx } = await initOwner();
        await expect(
          getProject(mkGetReq("not-a-project-id" as ProjectId), hctx),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("updates a project's name and reads it back", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        expect(proj?.props?.name).toBe("Untitled project");

        const updated = await updateProject(mkUpdateReq(id, "Renamed"), hctx);
        expect(updated.project?.props?.name).toBe("Renamed");

        const got = await getProject(mkGetReq(id), hctx);
        expect(got.project?.props?.name).toBe("Renamed");
      });

      it("leaves a project unchanged when the mask omits name", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const resp = await updateProject(mkNonNameUpdateReq(id), hctx);
        expect(resp.project?.props?.name).toBe("Untitled project");

        const got = await getProject(mkGetReq(id), hctx);
        expect(got.project?.props?.name).toBe("Untitled project");
      });

      it("toggles recording off and back on, reading each state back", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        expect(proj.props?.recordingDisabled).toBe(false);

        const off = await updateProject(mkRecordingUpdateReq(id, true), hctx);
        expect(off.project?.props?.recordingDisabled).toBe(true);
        // The recording-only mask must not clobber the name.
        expect(off.project?.props?.name).toBe("Untitled project");

        let got = await getProject(mkGetReq(id), hctx);
        expect(got.project?.props?.recordingDisabled).toBe(true);

        const on = await updateProject(mkRecordingUpdateReq(id, false), hctx);
        expect(on.project?.props?.recordingDisabled).toBe(false);

        got = await getProject(mkGetReq(id), hctx);
        expect(got.project?.props?.recordingDisabled).toBe(false);
      });

      it.each(kNumericProps)(
        "sets, rereads, and clears %s",
        async (path, key) => {
          const { org, hctx } = await initOwner();
          const proj = await createProj(hctx, org);
          const id = toProjectId(proj.id!.id);
          expect(proj.props?.[key]).toBeUndefined();

          const set = await updateProject(
            mkNumericUpdateReq(id, path, key, 42),
            hctx,
          );
          expect(set.project?.props?.[key]).toBe(42);
          // The numeric-only mask must not clobber the name.
          expect(set.project?.props?.name).toBe("Untitled project");

          let got = await getProject(mkGetReq(id), hctx);
          expect(got.project?.props?.[key]).toBe(42);

          // Selected by the mask but absent from props: clears the setting.
          const cleared = await updateProject(
            mkNumericUpdateReq(id, path, key, undefined),
            hctx,
          );
          expect(cleared.project?.props?.[key]).toBeUndefined();

          got = await getProject(mkGetReq(id), hctx);
          expect(got.project?.props?.[key]).toBeUndefined();
        },
      );

      it.each(kPositiveProps)("rejects a zero %s", async (path, key) => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          updateProject(mkNumericUpdateReq(id, path, key, 0), hctx),
        ).rejects.toThrow(/positive/);
      });

      // Unlike the strictly-positive props, an explicit 0 discard floor is a
      // valid setting (keep every session), distinct from the cleared state.
      it("accepts a zero discard_under_seconds", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const set = await updateProject(
          mkNumericUpdateReq(id, "discard_under_seconds", "discardUnderSeconds", 0),
          hctx,
        );
        expect(set.project?.props?.discardUnderSeconds).toBe(0);

        const got = await getProject(mkGetReq(id), hctx);
        expect(got.project?.props?.discardUnderSeconds).toBe(0);
      });

      it("leaves recording untouched by a name-only update", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await updateProject(mkRecordingUpdateReq(id, true), hctx);
        const renamed = await updateProject(mkUpdateReq(id, "Renamed"), hctx);
        expect(renamed.project?.props?.name).toBe("Renamed");
        expect(renamed.project?.props?.recordingDisabled).toBe(true);
      });

      it("renames a project blank back to the default", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        await updateProject(mkUpdateReq(id, "Named"), hctx);

        // Normalized as on create: blank in, default out.
        const blanked = await updateProject(mkUpdateReq(id, "   "), hctx);
        expect(blanked.project?.props?.name).toBe("Untitled project");

        const got = await getProject(mkGetReq(id), hctx);
        expect(got.project?.props?.name).toBe("Untitled project");
      });

      it("reports an update to an unknown project as not-found", async () => {
        const { hctx } = await initOwner();
        await expect(
          updateProject(mkUpdateReq(mkUnknownId(), "x"), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("deletes a project, then reports it not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await deleteProject(mkDeleteReq(id), hctx);

        await expect(getProject(mkGetReq(id), hctx)).rejects.toMatchObject({
          code: Code.NotFound,
        });
      });

      it("reports a delete of an unknown project as not-found", async () => {
        const { hctx } = await initOwner();
        await expect(
          deleteProject(mkDeleteReq(mkUnknownId()), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("rejects a create with no data residency", async () => {
        const { org, hctx } = await initOwner();
        await expect(
          createProject(mkCreateReqNoResidency(org), hctx),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });
    });

    describe("list projects", () => {
      it("lists the projects in an org", async () => {
        const { org, hctx } = await initOwner();
        const a = await createProj(hctx, org);
        const b = await createProj(hctx, org);

        const resp = await listProjects(mkListProjectsReq(org), hctx);
        const ids = resp.projects.map((p) => p.id?.id);
        expect(ids).toContain(a.id!.id);
        expect(ids).toContain(b.id!.id);
        expect(resp.projects).toHaveLength(2);
        expect(resp.page?.nextPageToken ?? "").toBe("");
      });

      it("lists no projects for an org with none", async () => {
        const { org, hctx } = await initOwner();
        const resp = await listProjects(mkListProjectsReq(org), hctx);
        expect(resp.projects).toEqual([]);
        expect(resp.page?.nextPageToken ?? "").toBe("");
      });

      it("pages through every project without gaps or duplicates", async () => {
        const { org, hctx } = await initOwner();
        const created = new Set<string>();
        for (let i = 0; i < 5; i++) {
          created.add((await createProj(hctx, org)).id!.id);
        }

        const seen: string[] = [];
        let token = "";
        // Bounded so a broken cursor can't spin forever; 5 items at 2/page is
        // 3 pages, well under the guard.
        for (let guard = 0; guard < 10; guard++) {
          const resp = await listProjects(
            mkListProjectsReq(org, { pageSize: 2, pageToken: token }),
            hctx,
          );
          expect(resp.projects.length).toBeLessThanOrEqual(2);
          for (const p of resp.projects) {
            seen.push(p.id!.id);
          }
          token = resp.page?.nextPageToken ?? "";
          if (!token) {
            break;
          }
        }

        expect(seen).toHaveLength(created.size);
        expect(new Set(seen)).toEqual(created);
      });

      it("excludes projects owned by another org", async () => {
        const a = await initOwner();
        const projA = (await createProj(a.hctx, a.org)).id!.id;
        const b = await initOwner();
        await createProj(b.hctx, b.org);

        const resp = await listProjects(mkListProjectsReq(a.org), a.hctx);
        expect(resp.projects.map((p) => p.id?.id)).toEqual([projA]);
      });

      it("lets a viewer list projects", async () => {
        const { org, hctx: ownerHctx } = await initOwner();
        await createProj(ownerHctx, org);
        const viewer = await appointMember(auth, ownerHctx, org, "viewer");
        const viewerHctx = await mkCtx(viewer.headers);

        const resp = await listProjects(mkListProjectsReq(org), viewerHctx);
        expect(resp.projects).toHaveLength(1);
      });

      it("rejects an unauthenticated list", async () => {
        const { org } = await initOwner();
        const anon = await mkCtx(new Headers());
        await expect(
          listProjects(mkListProjectsReq(org), anon),
        ).rejects.toMatchObject({ code: Code.Unauthenticated });
      });

      it("rejects a list by a non-member of the org", async () => {
        const { org } = await initOwner();
        const stranger = await mkCtx((await signUpUser(auth)).headers);
        await expect(
          listProjects(mkListProjectsReq(org), stranger),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
      });

      it("rejects a malformed page token", async () => {
        const { org, hctx } = await initOwner();
        await expect(
          listProjects(
            mkListProjectsReq(org, { pageToken: "!!!not-a-cursor" }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("rejects a decodable page token that carries no keyset", async () => {
        const { org, hctx } = await initOwner();
        for (const pageToken of kShapelessPageTokens) {
          await expect(
            listProjects(mkListProjectsReq(org, { pageToken }), hctx),
          ).rejects.toMatchObject({ code: Code.InvalidArgument });
        }
      });

      it("serves a nonsense page size as an unpaged list", async () => {
        const { org, hctx } = await initOwner();
        await createProj(hctx, org);
        await createProj(hctx, org);

        const resp = await listProjects(
          mkListProjectsReq(org, { pageSize: -5 }),
          hctx,
        );
        expect(resp.projects).toHaveLength(2);
        expect(resp.page?.nextPageToken ?? "").toBe("");
      });
    });

    describe("site keys", () => {
      // Creates a site key on `projId` and returns the created proto (asserting
      // it came back with a key value).
      async function createKey(
        hctx: HandlerContext,
        projId: ProjectId,
        label = "",
      ) {
        const resp = await createSiteKey(
          mkCreateSiteKeyReq(projId, label),
          hctx,
        );
        if (!resp.siteKey?.key?.key) {
          throw new Error("expected createSiteKey to return a key");
        }
        return resp.siteKey;
      }

      it("issues an active site key and reads it back", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const created = await createKey(hctx, id);
        expect(created.status).toBe(ProjectSiteKey_Status.ACTIVE);
        expect(created.revokedAt).toBeUndefined();

        const got = await getSiteKey(
          mkGetSiteKeyReq(id, created.key!.key),
          hctx,
        );
        expect(got.siteKey).toEqual(created);
      });

      it("stores the label given at creation", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const created = await createKey(hctx, id, "production");
        expect(created.props?.label).toBe("production");

        const got = await getSiteKey(
          mkGetSiteKeyReq(id, created.key!.key),
          hctx,
        );
        expect(got.siteKey?.props?.label).toBe("production");
      });

      it("updates a site key's label and reads it back", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const created = await createKey(hctx, id, "before");

        const updated = await updateSiteKey(
          mkUpdateSiteKeyReq(id, created.key!.key, "after"),
          hctx,
        );
        expect(updated.siteKey?.props?.label).toBe("after");

        const got = await getSiteKey(
          mkGetSiteKeyReq(id, created.key!.key),
          hctx,
        );
        expect(got.siteKey?.props?.label).toBe("after");
      });

      it("lists every site key issued for a project", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const first = await createKey(hctx, id, "one");
        const second = await createKey(hctx, id, "two");

        const listed = await listSiteKeys(mkListSiteKeysReq(id), hctx);
        const keys = listed.siteKeys.map((sk) => sk.key?.key);
        expect(keys).toContain(first.key!.key);
        expect(keys).toContain(second.key!.key);
        expect(listed.siteKeys).toHaveLength(2);
      });

      it("lists no site keys for a project that has none", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listSiteKeys(mkListSiteKeysReq(id), hctx);
        expect(listed.siteKeys).toEqual([]);
        expect(listed.page?.nextPageToken).toBe("");
      });

      it("pages through a project's site keys", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const issued = [
          (await createKey(hctx, id, "one")).key!.key,
          (await createKey(hctx, id, "two")).key!.key,
          (await createKey(hctx, id, "three")).key!.key,
        ];

        const seen: string[] = [];
        let pageToken = "";
        do {
          const resp = await listSiteKeys(
            mkListSiteKeysReq(id, { pageSize: 2, pageToken }),
            hctx,
          );
          expect(resp.siteKeys.length).toBeLessThanOrEqual(2);
          seen.push(...resp.siteKeys.map((sk) => sk.key!.key));
          pageToken = resp.page?.nextPageToken ?? "";
        } while (pageToken);

        expect(seen.sort()).toEqual([...issued].sort());
      });

      it("rejects a malformed site-key page token", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          listSiteKeys(
            mkListSiteKeysReq(id, { pageToken: "not-a-cursor" }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("rejects a decodable site-key page token with no keyset", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        for (const pageToken of kShapelessPageTokens) {
          await expect(
            listSiteKeys(mkListSiteKeysReq(id, { pageToken }), hctx),
          ).rejects.toMatchObject({ code: Code.InvalidArgument });
        }
      });

      it("revokes a site key, marking it revoked", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const created = await createKey(hctx, id);

        await revokeSiteKey(mkRevokeSiteKeyReq(id, created.key!.key), hctx);
        const got = await getSiteKey(
          mkGetSiteKeyReq(id, created.key!.key),
          hctx,
        );
        expect(got.siteKey?.status).toBe(ProjectSiteKey_Status.REVOKED);
        expect(got.siteKey?.revokedAt).toBeDefined();
      });

      it("refuses to relabel a revoked key", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const created = await createKey(hctx, id, "before");
        await revokeSiteKey(mkRevokeSiteKeyReq(id, created.key!.key), hctx);

        await expect(
          updateSiteKey(mkUpdateSiteKeyReq(id, created.key!.key, "after"), hctx),
        ).rejects.toMatchObject({ code: Code.FailedPrecondition });

        const got = await getSiteKey(
          mkGetSiteKeyReq(id, created.key!.key),
          hctx,
        );
        expect(got.siteKey?.props?.label).toBe("before");
      });

      it("reports a revoke of a key the project never issued as not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const stranger = newId(kIdPrefixes.siteKey);
        await expect(
          revokeSiteKey(mkRevokeSiteKeyReq(id, stranger), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports a second revoke of the same key as not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const created = await createKey(hctx, id);

        await revokeSiteKey(mkRevokeSiteKeyReq(id, created.key!.key), hctx);
        await expect(
          revokeSiteKey(mkRevokeSiteKeyReq(id, created.key!.key), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports site-key ops against an unknown project as not-found", async () => {
        const { hctx } = await initOwner();
        const unknown = mkUnknownId();
        const key = newId(kIdPrefixes.siteKey);

        await expectSiteKeyOpsRejected(hctx, unknown, key, Code.NotFound);
      });

      it("does not read a site key that the project never issued", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        // A well-formed key the project never issued reads as absent.
        const stranger = newId(kIdPrefixes.siteKey);
        await expect(
          getSiteKey(mkGetSiteKeyReq(id, stranger), hctx),
        ).rejects.toThrow();
      });

      it("cannot get or revoke a real key issued by another org's project", async () => {
        // Two owners, two orgs, two projects. Org B creates a key.
        const a = await initOwner();
        const projA = toProjectId((await createProj(a.hctx, a.org)).id!.id);

        const b = await initOwner();
        const projB = toProjectId(
          (await createProj(b.hctx, b.org, StorageBackend.BYOB)).id!.id,
        );
        const keyB = (await createKey(b.hctx, projB)).key!.key;

        // A holds credentials access on its *own* project, but is unable to see
        // or modify B's site keys.
        await expect(
          getSiteKey(mkGetSiteKeyReq(projA, keyB), a.hctx),
        ).rejects.toThrow();
        await revokeSiteKey(mkRevokeSiteKeyReq(projA, keyB), a.hctx).catch(
          () => undefined,
        );

        // B's key is untouched
        const got = await getSiteKey(mkGetSiteKeyReq(projB, keyB), b.hctx);
        expect(got.siteKey?.status).toBe(ProjectSiteKey_Status.ACTIVE);
      });
    });

    describe("project tags", () => {
      const kSeededLabels = new Set(
        [...kSystemTagSeeds, ...kStarterTagSeeds].map((s) => s.label),
      );
      const kSeedCount = kSystemTagSeeds.length + kStarterTagSeeds.length;

      /** The tags a test defined itself, with the creation seeds dropped. */
      function definedByTest<T extends { props?: { label?: string } }>(
        tags: T[],
      ): T[] {
        return tags.filter((t) => !kSeededLabels.has(t.props?.label ?? ""));
      }

      async function mkTag(
        hctx: HandlerContext,
        projId: ProjectId,
        label: string,
        color: ProjectTagColor = ProjectTagColor.GRAY,
      ) {
        const resp = await createProjectTag(
          mkCreateProjectTagReq(projId, { label, color }),
          hctx,
        );
        if (!resp.tag?.id?.id) {
          throw new Error("expected createProjectTag to return a tag with an id");
        }
        return resp.tag;
      }

      it("defines a tag and lists it back", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const created = await mkTag(hctx, id, "Flaky", ProjectTagColor.RED);
        expect(created.props?.label).toBe("Flaky");
        expect(created.props?.color).toBe(ProjectTagColor.RED);
        expect(created.projectId?.id).toBe(id);
        expect(created.kind).toBe(ProjectTagKind.CUSTOM);

        const listed = await listProjectTags(mkListProjectTagsReq(id), hctx);
        expect(definedByTest(listed.tags)).toEqual([created]);
      });

      it("seeds a fresh project with the system and starter tags", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listProjectTags(mkListProjectTagsReq(id), hctx);
        expect(
          listed.tags.map((t) => ({
            kind: t.kind,
            label: t.props?.label,
            color: t.props?.color,
          })),
        ).toEqual([
          {
            kind: ProjectTagKind.CUSTOM,
            label: "Bug",
            color: ProjectTagColor.MAGENTA,
          },
          {
            kind: ProjectTagKind.CUSTOM,
            label: "Confused",
            color: ProjectTagColor.YELLOW,
          },
          {
            kind: ProjectTagKind.CUSTOM,
            label: "Conversion",
            color: ProjectTagColor.GREEN,
          },
          {
            kind: ProjectTagKind.CUSTOM,
            label: "Dropped off",
            color: ProjectTagColor.ORANGE,
          },
          {
            kind: ProjectTagKind.FLAGGED,
            label: "Flagged",
            color: ProjectTagColor.RED,
          },
          {
            kind: ProjectTagKind.CUSTOM,
            label: "Needs followup",
            color: ProjectTagColor.PURPLE,
          },
          {
            kind: ProjectTagKind.PINNED,
            label: "Pinned",
            color: ProjectTagColor.GRAY,
          },
          {
            kind: ProjectTagKind.CUSTOM,
            label: "Signup",
            color: ProjectTagColor.BLUE,
          },
        ]);
        for (const tag of listed.tags) {
          expect(tag.projectId?.id).toBe(id);
          expect(tag.id?.id).toMatch(/^tag_/);
        }
      });

      it("lets a project delete a starter tag", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listProjectTags(mkListProjectTagsReq(id), hctx);
        const starter = listed.tags.find((t) => t.props?.label === "Bug");
        await deleteProjectTag(mkDeleteProjectTagReq(id, starter!.id!.id), hctx);

        const after = await listProjectTags(mkListProjectTagsReq(id), hctx);
        expect(after.tags.map((t) => t.props?.label)).not.toContain("Bug");
      });

      it("seeds each project with its own system tags", async () => {
        const { org, hctx } = await initOwner();
        const a = toProjectId((await createProj(hctx, org)).id!.id);
        const b = toProjectId((await createProj(hctx, org)).id!.id);

        const tagsA = (await listProjectTags(mkListProjectTagsReq(a), hctx))
          .tags;
        const tagsB = (await listProjectTags(mkListProjectTagsReq(b), hctx))
          .tags;
        const idsA = new Set(tagsA.map((t) => t.id?.id));
        for (const tag of tagsB) {
          expect(idsA.has(tag.id?.id)).toBe(false);
        }
      });

      it("orders the listing by label", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await mkTag(hctx, id, "Zebra");
        await mkTag(hctx, id, "Apple");
        await mkTag(hctx, id, "Maple");

        const listed = await listProjectTags(mkListProjectTagsReq(id), hctx);
        expect(listed.tags.map((t) => t.props?.label)).toEqual([
          "Apple",
          "Bug",
          "Confused",
          "Conversion",
          "Dropped off",
          "Flagged",
          "Maple",
          "Needs followup",
          "Pinned",
          "Signup",
          "Zebra",
        ]);
      });

      it("trims a label and rejects one that is blank or over-long", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const created = await mkTag(hctx, id, "  padded  ");
        expect(created.props?.label).toBe("padded");

        await expect(
          createProjectTag(mkCreateProjectTagReq(id, { label: "   " }), hctx),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });

        await expect(
          createProjectTag(
            mkCreateProjectTagReq(id, { label: "x".repeat(kMaxTagLength + 1) }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("requires a palette color even when a custom hex is given", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          createProjectTag(
            mkCreateProjectTagReq(id, {
              label: "no color",
              color: ProjectTagColor.UNSPECIFIED,
              customHex: "#ff0000",
            }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("normalizes a custom hex and rejects a malformed one", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const created = await createProjectTag(
          mkCreateProjectTagReq(id, {
            label: "custom",
            color: ProjectTagColor.GRAY,
            customHex: "#AABBCC",
          }),
          hctx,
        );
        expect(created.tag?.props?.customHex).toBe("#aabbcc");

        await expect(
          createProjectTag(
            mkCreateProjectTagReq(id, {
              label: "bad",
              color: ProjectTagColor.GRAY,
              customHex: "red",
            }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("rejects a label already taken in the project, ignoring case", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await mkTag(hctx, id, "Regression");

        await expect(
          createProjectTag(
            mkCreateProjectTagReq(id, { label: "regression" }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.AlreadyExists });
      });

      it("rejects a label already taken by a system tag", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          createProjectTag(mkCreateProjectTagReq(id, { label: "pinned" }), hctx),
        ).rejects.toMatchObject({ code: Code.AlreadyExists });
      });

      it("lets two projects define the same label", async () => {
        const { org, hctx } = await initOwner();
        const a = toProjectId((await createProj(hctx, org)).id!.id);
        const b = toProjectId((await createProj(hctx, org)).id!.id);

        await mkTag(hctx, a, "shared");
        await expect(mkTag(hctx, b, "shared")).resolves.toBeDefined();
      });

      it("caps custom tags per project without counting system tags", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        // The starter tags are custom, so they already eat into the cap.
        for (let i = 0; i < kMaxTagsPerProject - kStarterTagSeeds.length; i++) {
          await mkTag(hctx, id, `tag ${i}`);
        }

        await expect(
          createProjectTag(
            mkCreateProjectTagReq(id, { label: "one too many" }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.FailedPrecondition });
      });

      it("updates only the fields the mask selects", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const tag = await mkTag(hctx, id, "before", ProjectTagColor.BLUE);

        const recolored = await updateProjectTag(
          mkUpdateProjectTagReq(
            id,
            tag.id!.id,
            { color: ProjectTagColor.GREEN },
            ["color"],
          ),
          hctx,
        );
        expect(recolored.tag?.props?.color).toBe(ProjectTagColor.GREEN);
        expect(recolored.tag?.props?.label).toBe("before");

        const renamed = await updateProjectTag(
          mkUpdateProjectTagReq(id, tag.id!.id, { label: "after" }, ["label"]),
          hctx,
        );
        expect(renamed.tag?.props?.label).toBe("after");
        expect(renamed.tag?.props?.color).toBe(ProjectTagColor.GREEN);
      });

      it("rejects a rename onto another tag's label", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        await mkTag(hctx, id, "taken");
        const other = await mkTag(hctx, id, "free");

        await expect(
          updateProjectTag(
            mkUpdateProjectTagReq(id, other.id!.id, { label: "TAKEN" }, [
              "label",
            ]),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.AlreadyExists });
      });

      it("reports an unknown tag as not-found on update and delete", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          updateProjectTag(
            mkUpdateProjectTagReq(id, mkUnknownTagId(), { label: "x" }, [
              "label",
            ]),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });

        await expect(
          deleteProjectTag(mkDeleteProjectTagReq(id, mkUnknownTagId()), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("hides another project's tag from update and delete", async () => {
        const { org, hctx } = await initOwner();
        const a = toProjectId((await createProj(hctx, org)).id!.id);
        const b = toProjectId((await createProj(hctx, org)).id!.id);
        const tagA = await mkTag(hctx, a, "a only");

        await expect(
          deleteProjectTag(mkDeleteProjectTagReq(b, tagA.id!.id), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });

        const listed = await listProjectTags(mkListProjectTagsReq(a), hctx);
        expect(definedByTest(listed.tags)).toHaveLength(1);
      });

      it("drops a deleted tag from the listing", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const doomed = await mkTag(hctx, id, "doomed");
        await mkTag(hctx, id, "kept");

        const resp = await deleteProjectTag(
          mkDeleteProjectTagReq(id, doomed.id!.id),
          hctx,
        );
        expect(resp.sessionsUntagged).toBe(0);

        const listed = await listProjectTags(mkListProjectTagsReq(id), hctx);
        expect(definedByTest(listed.tags).map((t) => t.props?.label)).toEqual([
          "kept",
        ]);
      });

      it("refuses to delete a system tag", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listProjectTags(mkListProjectTagsReq(id), hctx);
        const system = listed.tags.filter(
          (t) => t.kind !== ProjectTagKind.CUSTOM,
        );
        expect(system).toHaveLength(kSystemTagSeeds.length);
        for (const tag of system) {
          await expect(
            deleteProjectTag(mkDeleteProjectTagReq(id, tag.id!.id), hctx),
          ).rejects.toMatchObject({ code: Code.FailedPrecondition });
        }
        const after = await listProjectTags(mkListProjectTagsReq(id), hctx);
        expect(after.tags).toHaveLength(listed.tags.length);
      });

      it("lets a system tag be renamed and recolored, keeping its kind", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listProjectTags(mkListProjectTagsReq(id), hctx);
        const pinned = listed.tags.find(
          (t) => t.kind === ProjectTagKind.PINNED,
        );

        const updated = await updateProjectTag(
          mkUpdateProjectTagReq(
            id,
            pinned!.id!.id,
            { label: "Bookmarked", color: ProjectTagColor.BLUE },
            ["label", "color"],
          ),
          hctx,
        );
        expect(updated.tag?.props?.label).toBe("Bookmarked");
        expect(updated.tag?.props?.color).toBe(ProjectTagColor.BLUE);
        expect(updated.tag?.kind).toBe(ProjectTagKind.PINNED);
      });

      it("omits session counts unless the listing asks for them", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        await mkTag(hctx, id, "counted");

        const without = await listProjectTags(mkListProjectTagsReq(id), hctx);
        expect(without.sessionCounts).toEqual({});

        const withCounts = await listProjectTags(
          mkListProjectTagsReq(id, true),
          hctx,
        );
        expect(withCounts.sessionCounts).toEqual(
          Object.fromEntries(withCounts.tags.map((t) => [t.id!.id, 0])),
        );
        expect(withCounts.tags).toHaveLength(kSeedCount + 1);
      });

      it("rejects a session tagged with a tag this project does not define", async () => {
        const { org, hctx } = await initOwner();
        const a = toProjectId((await createProj(hctx, org)).id!.id);
        const b = toProjectId((await createProj(hctx, org)).id!.id);
        const tagB = await mkTag(hctx, b, "b only");

        await expect(
          updateSession(
            mkUpdateSessionReq(a, newId(kIdPrefixes.session), {
              add: [tagB.id!.id],
            }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("lets a viewer read tags but not define, rename, or delete them", async () => {
        const { org, hctx: ownerHctx } = await initOwner();
        const proj = await createProj(ownerHctx, org);
        const id = toProjectId(proj.id!.id);
        const tag = await mkTag(ownerHctx, id, "readable");
        // Tag actions are project-gated, so an org member alone can't reach
        // them: give the target an explicit per-project "viewer" role.
        const target = await appointMember(auth, ownerHctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "viewer"),
          ownerHctx,
        );
        const viewerHctx = await mkCtx(target.headers);

        const listed = await listProjectTags(
          mkListProjectTagsReq(id),
          viewerHctx,
        );
        expect(listed.tags).toHaveLength(kSeedCount + 1);

        await expect(
          createProjectTag(
            mkCreateProjectTagReq(id, { label: "nope" }),
            viewerHctx,
          ),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
        await expect(
          updateProjectTag(
            mkUpdateProjectTagReq(id, tag.id!.id, { label: "nope" }, ["label"]),
            viewerHctx,
          ),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
        await expect(
          deleteProjectTag(mkDeleteProjectTagReq(id, tag.id!.id), viewerHctx),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
      });

      it("hides tags of a project in an org the caller isn't in", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const stranger = await mkCtx((await signUpUser(auth)).headers);

        await expect(
          listProjectTags(mkListProjectTagsReq(id), stranger),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          createProjectTag(mkCreateProjectTagReq(id, { label: "x" }), stranger),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });
    });

    describe("authorization", () => {
      it("requires authentication for every operation", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const anon = await mkCtx(new Headers());

        await expect(
          createProject(mkCreateReq(org), anon),
        ).rejects.toMatchObject({ code: Code.Unauthenticated });
        await expect(getProject(mkGetReq(id), anon)).rejects.toMatchObject({
          code: Code.Unauthenticated,
        });
        await expect(
          updateProject(mkUpdateReq(id, "x"), anon),
        ).rejects.toMatchObject({ code: Code.Unauthenticated });
        await expect(
          deleteProject(mkDeleteReq(id), anon),
        ).rejects.toMatchObject({ code: Code.Unauthenticated });
      });

      it("rejects a create by a non-member of the org", async () => {
        const { org } = await initOwner();
        const stranger = await signUpUser(auth);
        await expect(
          createProject(mkCreateReq(org), await mkCtx(stranger.headers)),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
      });

      it("hides a project in an org the caller isn't in (not-found)", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const stranger = await mkCtx((await signUpUser(auth)).headers);

        await expect(getProject(mkGetReq(id), stranger)).rejects.toMatchObject({
          code: Code.NotFound,
        });
        await expect(
          updateProject(mkUpdateReq(id, "x"), stranger),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          deleteProject(mkDeleteReq(id), stranger),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("rejects a create by a viewer", async () => {
        const { org, hctx: ownerHctx } = await initOwner();
        const viewer = await appointMember(auth, ownerHctx, org, "viewer");
        const viewerHctx = await mkCtx(viewer.headers);
        await expect(
          createProject(mkCreateReq(org), viewerHctx),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
      });

      it("requires authentication for every site-key operation", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const created = await createSiteKey(mkCreateSiteKeyReq(id), hctx);
        const key = created.siteKey!.key!.key;
        const anon = await mkCtx(new Headers());

        await expectSiteKeyOpsRejected(anon, id, key, Code.Unauthenticated);
      });

      it("denies a viewer any site-key operation", async () => {
        const { org, hctx: ownerHctx } = await initOwner();
        const proj = await createProj(ownerHctx, org);
        const id = toProjectId(proj.id!.id);
        const created = await createSiteKey(mkCreateSiteKeyReq(id), ownerHctx);
        const key = created.siteKey!.key!.key;

        // A viewer holds neither read_credentials nor manage_credentials.
        const viewer = await appointMember(auth, ownerHctx, org, "viewer");
        const viewerHctx = await mkCtx(viewer.headers);

        await expectSiteKeyOpsRejected(
          viewerHctx,
          id,
          key,
          Code.PermissionDenied,
        );
      });

      it("hides site keys from a caller outside the org (not-found)", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const created = await createSiteKey(mkCreateSiteKeyReq(id), hctx);
        const key = created.siteKey!.key!.key;
        const stranger = await mkCtx((await signUpUser(auth)).headers);

        // The project is hidden from a non-member, so its site-key ops report
        // NotFound rather than leaking the project's existence.
        await expectSiteKeyOpsRejected(stranger, id, key, Code.NotFound);
      });
    });

    describe("project members (service)", () => {
      it("assigns an org member a project role and reads it back", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        // The target must already belong to the project's org.
        const target = await appointMember(auth, hctx, org, "member");

        const assigned = await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );
        expect(assigned.member?.key?.projectId?.id).toBe(id);
        expect(assigned.member?.key?.userId?.id).toBe(target.userId);
        expect(assigned.member?.props?.role).toBe(ProtoRole.MEMBER);

        const got = await projs.projects.getProjectMember(
          id,
          target.userId,
          new Headers(),
        );
        expect(got?.role).toBe("member");
      });

      it("reports a second assignment as already-exists", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );

        await expect(
          assignProjectMember(mkAssignReq(id, target.userId, "admin"), hctx),
        ).rejects.toMatchObject({ code: Code.AlreadyExists });
      });

      it("reads an assigned member back through the service", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "admin"),
          hctx,
        );

        const got = await getProjectMember(
          mkGetMemberReq(id, target.userId),
          hctx,
        );
        expect(got.member?.key?.projectId?.id).toBe(id);
        expect(got.member?.key?.userId?.id).toBe(target.userId);
        expect(got.member?.props?.role).toBe(ProtoRole.ADMIN);
      });

      it("reports a get for an unknown project as not-found", async () => {
        const { hctx } = await initOwner();
        const someUser = (await signUpUser(auth)).userId;
        await expect(
          getProjectMember(mkGetMemberReq(mkUnknownId(), someUser), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports a get for a user with no role override as not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await expect(
          getProjectMember(mkGetMemberReq(id, target.userId), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("requires authentication for a get", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );
        const anon = await mkCtx(new Headers());
        await expect(
          getProjectMember(mkGetMemberReq(id, target.userId), anon),
        ).rejects.toMatchObject({ code: Code.Unauthenticated });
      });

      it("hides a member get from a caller outside the org (not-found)", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );
        const stranger = await mkCtx((await signUpUser(auth)).headers);
        await expect(
          getProjectMember(mkGetMemberReq(id, target.userId), stranger),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("denies a get to an org member with no role on the project", async () => {
        const { org, hctx: ownerHctx } = await initOwner();
        const proj = await createProj(ownerHctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, ownerHctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          ownerHctx,
        );
        const outsider = await appointMember(auth, ownerHctx, org, "member");
        const outsiderHctx = await mkCtx(outsider.headers);
        await expect(
          getProjectMember(mkGetMemberReq(id, target.userId), outsiderHctx),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
      });

      it("lets a caller with a project-scoped role read a member", async () => {
        const { org, hctx: ownerHctx } = await initOwner();
        const proj = await createProj(ownerHctx, org);
        const id = toProjectId(proj.id!.id);
        // The reader's org role of `member` alone wouldn't grant the read; their
        // effective *project* role is what authorizes it.
        const reader = await appointMember(auth, ownerHctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, reader.userId, "member"),
          ownerHctx,
        );
        // Resolve the reader's context after the assignment so their project
        // role is reflected in the principal.
        const readerHctx = await mkCtx(reader.headers);

        const got = await getProjectMember(
          mkGetMemberReq(id, reader.userId),
          readerHctx,
        );
        expect(got.member?.props?.role).toBe(ProtoRole.MEMBER);
      });

      it("changes a member's role and reads it back", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );

        const updated = await updateProjectMember(
          mkUpdateMemberReq(id, target.userId, "admin"),
          hctx,
        );
        expect(updated.member?.props?.role).toBe(ProtoRole.ADMIN);

        const got = await getProjectMember(
          mkGetMemberReq(id, target.userId),
          hctx,
        );
        expect(got.member?.props?.role).toBe(ProtoRole.ADMIN);
      });

      it("leaves a member's role unchanged when the mask omits role", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );

        const resp = await updateProjectMember(
          mkNonRoleUpdateMemberReq(id, target.userId),
          hctx,
        );
        expect(resp.member?.props?.role).toBe(ProtoRole.MEMBER);

        const got = await getProjectMember(
          mkGetMemberReq(id, target.userId),
          hctx,
        );
        expect(got.member?.props?.role).toBe(ProtoRole.MEMBER);
      });

      it("reports an update for an unknown project as not-found", async () => {
        const { hctx } = await initOwner();
        const someUser = (await signUpUser(auth)).userId;
        await expect(
          updateProjectMember(
            mkUpdateMemberReq(mkUnknownId(), someUser, "admin"),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports an update for a user with no role override as not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await expect(
          updateProjectMember(
            mkUpdateMemberReq(id, target.userId, "admin"),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("requires authentication for an update", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );
        const anon = await mkCtx(new Headers());
        await expect(
          updateProjectMember(
            mkUpdateMemberReq(id, target.userId, "admin"),
            anon,
          ),
        ).rejects.toMatchObject({ code: Code.Unauthenticated });
      });

      it("hides a member update from a caller outside the org (not-found)", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );
        const stranger = await mkCtx((await signUpUser(auth)).headers);
        await expect(
          updateProjectMember(
            mkUpdateMemberReq(id, target.userId, "admin"),
            stranger,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("removes a member, then reports the role gone", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );

        await removeProjectMember(mkRemoveMemberReq(id, target.userId), hctx);

        expect(
          await projs.projects.getProjectMember(
            id,
            target.userId,
            new Headers(),
          ),
        ).toBeUndefined();
        await expect(
          getProjectMember(mkGetMemberReq(id, target.userId), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports a remove for an unknown project as not-found", async () => {
        const { hctx } = await initOwner();
        const someUser = (await signUpUser(auth)).userId;
        await expect(
          removeProjectMember(mkRemoveMemberReq(mkUnknownId(), someUser), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports a remove for a user with no role override as not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await expect(
          removeProjectMember(mkRemoveMemberReq(id, target.userId), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("requires authentication for a remove", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );
        const anon = await mkCtx(new Headers());
        await expect(
          removeProjectMember(mkRemoveMemberReq(id, target.userId), anon),
        ).rejects.toMatchObject({ code: Code.Unauthenticated });
      });

      it("hides a member remove from a caller outside the org (not-found)", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );
        const stranger = await mkCtx((await signUpUser(auth)).headers);
        await expect(
          removeProjectMember(mkRemoveMemberReq(id, target.userId), stranger),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("lists every member with a role override", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const first = await appointMember(auth, hctx, org, "member");
        const second = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, first.userId, "member"),
          hctx,
        );
        await assignProjectMember(
          mkAssignReq(id, second.userId, "admin"),
          hctx,
        );

        const listed = await listProjectMembers(mkListMembersReq(id), hctx);
        const users = listed.members.map((m) => m.key?.userId?.id);
        expect(users).toContain(first.userId);
        expect(users).toContain(second.userId);
        expect(listed.members).toHaveLength(2);
      });

      it("lists no members for a project with no role overrides", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listProjectMembers(mkListMembersReq(id), hctx);
        expect(listed.members).toEqual([]);
        expect(listed.page?.nextPageToken).toBe("");
      });

      it("pages through a project's members", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const assigned: string[] = [];
        for (const role of ["member", "admin", "viewer"] as const) {
          const user = await appointMember(auth, hctx, org, "member");
          await assignProjectMember(mkAssignReq(id, user.userId, role), hctx);
          assigned.push(user.userId);
        }

        const seen: string[] = [];
        let pageToken = "";
        do {
          const resp = await listProjectMembers(
            mkListMembersReq(id, { pageSize: 2, pageToken }),
            hctx,
          );
          expect(resp.members.length).toBeLessThanOrEqual(2);
          seen.push(...resp.members.map((m) => m.key!.userId!.id));
          pageToken = resp.page?.nextPageToken ?? "";
        } while (pageToken);

        expect(seen.sort()).toEqual([...assigned].sort());
      });

      it("rejects a malformed member page token", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          listProjectMembers(
            mkListMembersReq(id, { pageToken: "not-a-cursor" }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("rejects a decodable member page token with no keyset", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        for (const pageToken of kShapelessPageTokens) {
          await expect(
            listProjectMembers(mkListMembersReq(id, { pageToken }), hctx),
          ).rejects.toMatchObject({ code: Code.InvalidArgument });
        }
      });

      it("reports a list for an unknown project as not-found", async () => {
        const { hctx } = await initOwner();
        await expect(
          listProjectMembers(mkListMembersReq(mkUnknownId()), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("requires authentication for a list", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const anon = await mkCtx(new Headers());
        await expect(
          listProjectMembers(mkListMembersReq(id), anon),
        ).rejects.toMatchObject({ code: Code.Unauthenticated });
      });

      it("hides a member list from a caller outside the org (not-found)", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const stranger = await mkCtx((await signUpUser(auth)).headers);
        await expect(
          listProjectMembers(mkListMembersReq(id), stranger),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("denies a list to a viewer", async () => {
        const { org, hctx: ownerHctx } = await initOwner();
        const proj = await createProj(ownerHctx, org);
        const id = toProjectId(proj.id!.id);
        const viewer = await appointMember(auth, ownerHctx, org, "viewer");
        const viewerHctx = await mkCtx(viewer.headers);
        await expect(
          listProjectMembers(mkListMembersReq(id), viewerHctx),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
      });

      it("drops a member's project roles when they leave the org", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "admin"),
          hctx,
        );

        await deleteMembership(mkDeleteMembershipReq(org, target.userId), hctx);

        expect(
          await projs.projects.getProjectRoles(target.userId, new Headers()),
        ).toEqual({});
        const listed = await listProjectMembers(mkListMembersReq(id), hctx);
        expect(listed.members).toEqual([]);
      });

      it("drops project roles across every project in the org", async () => {
        const { org, hctx } = await initOwner();
        const first = toProjectId((await createProj(hctx, org)).id!.id);
        const second = toProjectId((await createProj(hctx, org)).id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(first, target.userId, "member"),
          hctx,
        );
        await assignProjectMember(
          mkAssignReq(second, target.userId, "viewer"),
          hctx,
        );

        await deleteMembership(mkDeleteMembershipReq(org, target.userId), hctx);

        expect(
          await projs.projects.getProjectRoles(target.userId, new Headers()),
        ).toEqual({});
      });

      it("leaves the other members' project roles alone", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const removed = await appointMember(auth, hctx, org, "member");
        const kept = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, removed.userId, "member"),
          hctx,
        );
        await assignProjectMember(mkAssignReq(id, kept.userId, "admin"), hctx);

        await deleteMembership(
          mkDeleteMembershipReq(org, removed.userId),
          hctx,
        );

        expect(
          await projs.projects.getProjectRoles(kept.userId, new Headers()),
        ).toEqual({ [id]: "admin" });
      });

      it("drops the project roles of a member who removes themselves", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const target = await appointMember(auth, hctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "member"),
          hctx,
        );

        // Removing yourself is the leave-the-org path, a separate branch of the
        // membership store.
        await deleteMembership(
          mkDeleteMembershipReq(org, target.userId),
          await mkCtx(target.headers),
        );

        expect(
          await projs.projects.getProjectRoles(target.userId, new Headers()),
        ).toEqual({});
      });
    });

    describe("project members (store)", () => {
      const memberHeaders = new Headers();

      function mint<A extends Action, R extends Resource>(
        owner: UserPrincipal,
        action: A,
        resource: R,
      ): Grant<A, R> {
        const grant = authorize(owner, action, resource);
        if (!grant) {
          throw new Error(`unexpectedly denied: ${action}`);
        }
        return grant;
      }

      // A project owned by an org superuser, a signed-up target user, and grant
      // factories for them.
      async function fixture() {
        const { sess, org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const projId = toProjectId(proj.id!.id);
        const owner = userPrincipal(sess.userId, { [org]: "owner" });
        const target = (await signUpUser(auth)).userId;
        const store = projs.projects;
        return {
          org,
          projId,
          target,
          owner,
          store,
          assign: (role: Role) =>
            mint(
              owner,
              "project.membership.create",
              projectMembershipResource(org, projId, target, role),
            ),
          remove: (role: Role) =>
            mint(
              owner,
              "project.membership.delete",
              projectMembershipResource(org, projId, target, role),
            ),
          list: () =>
            mint(owner, "project.list_members", projectResource(org, projId)),
        };
      }

      it("assigns a role, reads it back, and lists it", async () => {
        const { projId, target, store, assign, list } = await fixture();
        const assigned = await store.assignProjectMember(
          assign("member"),
          memberHeaders,
        );
        expect(assigned).toMatchObject({
          projectId: projId,
          userId: target,
          role: "member",
        });

        const got = await store.getProjectMember(projId, target, memberHeaders);
        expect(got?.role).toBe("member");

        const listed = await store.listProjectMembers(
          list(),
          {},
          memberHeaders,
        );
        expect(listed.items.map((m) => m.userId)).toEqual([target]);
      });

      it("reads an absent member as undefined", async () => {
        const { projId, target, store } = await fixture();
        expect(
          await store.getProjectMember(projId, target, memberHeaders),
        ).toBeUndefined();
      });

      it("changes a member's role via update", async () => {
        const { projId, target, store, assign, remove } = await fixture();
        await store.assignProjectMember(assign("member"), memberHeaders);

        const updated = await store.updateProjectMember(
          remove("member"),
          assign("admin"),
          memberHeaders,
        );
        expect(updated?.role).toBe("admin");
        expect(
          (await store.getProjectMember(projId, target, memberHeaders))?.role,
        ).toBe("admin");
      });

      it("reports update of an absent member as undefined", async () => {
        const { store, assign, remove } = await fixture();
        expect(
          await store.updateProjectMember(
            remove("member"),
            assign("admin"),
            memberHeaders,
          ),
        ).toBeUndefined();
      });

      it("removes a member, then reports removal of an absent member as false", async () => {
        const { projId, target, store, assign, remove } = await fixture();
        await store.assignProjectMember(assign("member"), memberHeaders);

        expect(
          await store.removeProjectMember(remove("member"), memberHeaders),
        ).toBe(true);
        expect(
          await store.getProjectMember(projId, target, memberHeaders),
        ).toBeUndefined();
        expect(
          await store.removeProjectMember(remove("member"), memberHeaders),
        ).toBe(false);
      });

      it("reports a second assignment to the same member as undefined", async () => {
        const { projId, target, store, assign } = await fixture();
        await store.assignProjectMember(assign("member"), memberHeaders);

        expect(
          await store.assignProjectMember(assign("admin"), memberHeaders),
        ).toBeUndefined();
        // The losing assignment leaves the standing role alone.
        expect(
          (await store.getProjectMember(projId, target, memberHeaders))?.role,
        ).toBe("member");
      });

      it("leaves a member alone when the revoked role no longer matches", async () => {
        const { projId, target, store, assign, remove } = await fixture();
        await store.assignProjectMember(assign("member"), memberHeaders);

        // Stands in for a role that changed after the caller was authorized
        // against it: the update names a role the member does not hold.
        expect(
          await store.updateProjectMember(
            remove("viewer"),
            assign("admin"),
            memberHeaders,
          ),
        ).toBeUndefined();
        expect(
          (await store.getProjectMember(projId, target, memberHeaders))?.role,
        ).toBe("member");

        // A removal authorized against the same stale role is refused too.
        expect(
          await store.removeProjectMember(remove("viewer"), memberHeaders),
        ).toBe(false);
        expect(
          (await store.getProjectMember(projId, target, memberHeaders))?.role,
        ).toBe("member");
      });

      it("removes a project's members when the project is deleted", async () => {
        const { org, projId, target, owner, store, assign } = await fixture();
        await store.assignProjectMember(assign("member"), memberHeaders);

        // Deleting the project cascades its projectMember rows.
        await store.deleteProject(
          mint(owner, "project.delete", projectResource(org, projId)),
          memberHeaders,
        );
        expect(
          await store.getProjectMember(projId, target, memberHeaders),
        ).toBeUndefined();
      });

      it("clears one org's project roles and leaves another org's alone", async () => {
        const here = await fixture();
        const elsewhere = await fixture();
        const store = here.store;
        // The same user holds a role in a project of each org.
        const user = here.target;
        await store.assignProjectMember(here.assign("member"), memberHeaders);
        await store.assignProjectMember(
          mint(
            elsewhere.owner,
            "project.membership.create",
            projectMembershipResource(
              elsewhere.org,
              elsewhere.projId,
              user,
              "admin",
            ),
          ),
          memberHeaders,
        );

        await store.clearOrgProjectRoles(here.org, user, memberHeaders);

        expect(await store.getProjectRoles(user, memberHeaders)).toEqual({
          [elsewhere.projId]: "admin",
        });
      });

      it("clears the roles of one user only", async () => {
        const { org, projId, target, owner, store, assign } = await fixture();
        const other = (await signUpUser(auth)).userId;
        await store.assignProjectMember(assign("member"), memberHeaders);
        await store.assignProjectMember(
          mint(
            owner,
            "project.membership.create",
            projectMembershipResource(org, projId, other, "viewer"),
          ),
          memberHeaders,
        );

        await store.clearOrgProjectRoles(org, other, memberHeaders);

        expect(
          await store.getProjectMember(projId, other, memberHeaders),
        ).toBeUndefined();
        expect(
          (await store.getProjectMember(projId, target, memberHeaders))?.role,
        ).toBe("member");
      });

      it("clears a user who holds no project roles as a no-op", async () => {
        const { org, target, store } = await fixture();
        await expect(
          store.clearOrgProjectRoles(org, target, memberHeaders),
        ).resolves.toBeUndefined();
      });
    });

    describe("sessions", () => {
      // A well-formed session id no project has recorded.
      const mkUnknownSessionId = () => newId(kIdPrefixes.session);

      it("lists no sessions for a fresh project", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listSessions(mkListSessionsReq(id), hctx);
        expect(listed.sessions).toEqual([]);
        expect(listed.page?.nextPageToken).toBe("");
      });

      it("lists no live sessions for a fresh project", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listLiveSessions(mkListLiveSessionsReq(id), hctx);
        expect(listed.sessions).toEqual([]);
      });

      it("reports a watch on an unknown session as not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          watchLiveSession(
            mkWatchLiveSessionReq(id, mkUnknownSessionId()),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports an unknown session as not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          getSession(mkGetSessionReq(id, mkUnknownSessionId()), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports an update to an unknown session as not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          updateSession(
            mkUpdateSessionReq(id, mkUnknownSessionId(), {
              add: [mkUnknownTagId()],
            }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("treats an empty delta as a read", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        // Still not-found, but it got there via the read path: nothing was
        // written on the way.
        await expect(
          updateSession(mkUpdateSessionReq(id, mkUnknownSessionId()), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("rejects a tag named in both add and remove", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);
        const tagId = mkUnknownTagId();

        await expect(
          updateSession(
            mkUpdateSessionReq(id, mkUnknownSessionId(), {
              add: [tagId],
              remove: [tagId],
            }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("rejects an add set past the documented per-session bound", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          updateSession(
            mkUpdateSessionReq(id, mkUnknownSessionId(), {
              add: Array.from({ length: kMaxTagsPerSession + 1 }, () =>
                mkUnknownTagId(),
              ),
            }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });


      it("lists no deleted sessions for a fresh project", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listDeletedSessions(
          mkListDeletedSessionsReq(id),
          hctx,
        );
        expect(listed.sessions).toEqual([]);
        expect(listed.page?.nextPageToken).toBe("");
      });

      it("rejects a malformed deleted-session page token", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          listDeletedSessions(
            mkListDeletedSessionsReq(id, { pageToken: "not-a-cursor" }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("rejects a decodable deleted-session token with no keyset", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        for (const pageToken of kShapelessPageTokens) {
          await expect(
            listDeletedSessions(
              mkListDeletedSessionsReq(id, { pageToken }),
              hctx,
            ),
          ).rejects.toMatchObject({ code: Code.InvalidArgument });
        }
      });

      it("reports restoring a session that is not deleted as not-found", async () => {
        // Nothing to undo reads the same whether the session never existed, was
        // never deleted, or is already too far into deletion to come back: the
        // caller cannot act on the difference.
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          restoreSession(mkRestoreSessionReq(id, mkUnknownSessionId()), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("clears a project with no sessions as a no-op", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await clearSessions(mkClearSessionsReq(id), hctx);
        const listed = await listSessions(mkListSessionsReq(id), hctx);
        expect(listed.sessions).toEqual([]);
      });

      it("refuses to clear a project whose media is not the platform's to delete", async () => {
        // Clearing a customer-owned bucket is not currently supported.
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org, StorageBackend.BYOB);
        const id = toProjectId(proj.id!.id);

        await expect(
          clearSessions(mkClearSessionsReq(id), hctx),
        ).rejects.toMatchObject({ code: Code.FailedPrecondition });
      });

      it("reports clearing an unknown project's sessions as not-found", async () => {
        const { hctx } = await initOwner();
        await expect(
          clearSessions(mkClearSessionsReq(mkUnknownId()), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports deleting an unknown session as not-found", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          deleteSession(mkDeleteSessionReq(id, mkUnknownSessionId()), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("reports a playback URL for an unknown session as not-found", async () => {
        // Existence is never disclosed ahead of authorization, and an
        // unrecorded session has nothing to play back either way.
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          getSessionPlaybackUrl(
            mkPlaybackUrlReq(id, mkUnknownSessionId()),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("rejects a malformed session page token", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          listSessions(
            mkListSessionsReq(id, { pageToken: "not-a-cursor" }),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("rejects a decodable session page token with no keyset", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        for (const pageToken of kShapelessPageTokens) {
          await expect(
            listSessions(mkListSessionsReq(id, { pageToken }), hctx),
          ).rejects.toMatchObject({ code: Code.InvalidArgument });
        }
      });

      it("rejects a malformed session id as invalid-argument", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          getSession(mkGetSessionReq(id, "not-a-session-id"), hctx),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("lets a project viewer list and read sessions but not delete", async () => {
        const { org, hctx: ownerHctx } = await initOwner();
        const proj = await createProj(ownerHctx, org);
        const id = toProjectId(proj.id!.id);

        // Session actions are project-gated, so an org member alone can't reach
        // them: give the target an explicit per-project "viewer" role.
        const target = await appointMember(auth, ownerHctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "viewer"),
          ownerHctx,
        );
        const viewerHctx = await mkCtx(target.headers);

        // A project viewer holds session.read and session.list.
        const listed = await listSessions(mkListSessionsReq(id), viewerHctx);
        expect(listed.sessions).toEqual([]);
        // The read grant passes; the session simply doesn't exist.
        await expect(
          getSession(mkGetSessionReq(id, mkUnknownSessionId()), viewerHctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
        // Playback is gated on the same session.read grant, so it is reachable
        // for a viewer too — the recording is what is missing, not the right.
        await expect(
          getSessionPlaybackUrl(
            mkPlaybackUrlReq(id, mkUnknownSessionId()),
            viewerHctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
        // But not session.delete, which requires a project "member" or higher.
        await expect(
          deleteSession(
            mkDeleteSessionReq(id, mkUnknownSessionId()),
            viewerHctx,
          ),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
        // Tagging is a write, so it sits in that tier too: denied before the
        // missing session can turn it into a not-found.
        await expect(
          updateSession(
            mkUpdateSessionReq(id, mkUnknownSessionId(), {
              add: [mkUnknownTagId()],
            }),
            viewerHctx,
          ),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
        // session.clear sits in the same tier as session.delete.
        await expect(
          clearSessions(mkClearSessionsReq(id), viewerHctx),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
        // Listing what is pending deletion is still a listing, so session.list
        // carries it.
        const deleted = await listDeletedSessions(
          mkListDeletedSessionsReq(id),
          viewerHctx,
        );
        expect(deleted.sessions).toEqual([]);
        // Undoing one is not: session.restore sits with session.delete, since
        // it is the same act reversed.
        await expect(
          restoreSession(
            mkRestoreSessionReq(id, mkUnknownSessionId()),
            viewerHctx,
          ),
        ).rejects.toMatchObject({ code: Code.PermissionDenied });
      });

      it("hides another org's project sessions as not-found", async () => {
        // Two owners in separate personal orgs; A owns the project.
        const a = await initOwner();
        const projA = toProjectId((await createProj(a.hctx, a.org)).id!.id);
        const b = await initOwner();

        // B has no membership in A's org, so every session op reads as absent.
        await expect(
          listSessions(mkListSessionsReq(projA), b.hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          getSession(mkGetSessionReq(projA, mkUnknownSessionId()), b.hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          deleteSession(
            mkDeleteSessionReq(projA, mkUnknownSessionId()),
            b.hctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          clearSessions(mkClearSessionsReq(projA), b.hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          getSessionPlaybackUrl(
            mkPlaybackUrlReq(projA, mkUnknownSessionId()),
            b.hctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });
    });

    describe("session seen state", () => {
      // A well-formed session id no project has recorded.
      const mkUnknownSessionId = () => newId(kIdPrefixes.session);

      it("reports a fresh project as having nothing unseen", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const resp = await getUnseenSessionCount(mkUnseenCountReq(id), hctx);
        expect(resp.unseen?.count).toBe(0);
        expect(resp.unseen?.capped).toBe(false);
      });

      it("lists nothing when a fresh project is filtered to unseen only", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const listed = await listSessions(
          mkListSessionsReq(id, undefined, true),
          hctx,
        );
        expect(listed.sessions).toEqual([]);
        expect(listed.page?.nextPageToken).toBe("");
      });

      it("ignores ids naming a session the project does not have", async () => {
        // A client racing a purge should not have to special-case the id it
        // just listed, so an absent one is dropped rather than reported.
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const resp = await markSessionsSeen(
          mkMarkSeenReq(id, [mkUnknownSessionId(), mkUnknownSessionId()]),
          hctx,
        );
        expect(resp.unseen?.count).toBe(0);
        expect(resp.unseen?.capped).toBe(false);
      });

      it("marks unseen through the same RPC", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        // `seen: false` is the inverse mark, not a distinct endpoint. With no
        // sessions to unmark it is still a well-formed no-op.
        const resp = await markSessionsSeen(
          mkMarkSeenReq(id, [mkUnknownSessionId()], false),
          hctx,
        );
        expect(resp.unseen?.count).toBe(0);
      });

      it("accepts an empty mark batch as a no-op", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const resp = await markSessionsSeen(mkMarkSeenReq(id, []), hctx);
        expect(resp.unseen?.count).toBe(0);
      });

      it("rejects a mark batch over the id cap", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const tooMany = Array.from({ length: kMaxMarkSeenIds + 1 }, () =>
          mkUnknownSessionId(),
        );
        await expect(
          markSessionsSeen(mkMarkSeenReq(id, tooMany), hctx),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("rejects a malformed session id in a mark batch", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        await expect(
          markSessionsSeen(
            mkMarkSeenReq(id, [mkUnknownSessionId(), "not-a-session-id"]),
            hctx,
          ),
        ).rejects.toMatchObject({ code: Code.InvalidArgument });
      });

      it("marks all seen idempotently", async () => {
        const { org, hctx } = await initOwner();
        const proj = await createProj(hctx, org);
        const id = toProjectId(proj.id!.id);

        const first = await markAllSessionsSeen(mkMarkAllSeenReq(id), hctx);
        expect(first.unseen?.count).toBe(0);
        const second = await markAllSessionsSeen(mkMarkAllSeenReq(id), hctx);
        expect(second.unseen?.count).toBe(0);
        const count = await getUnseenSessionCount(mkUnseenCountReq(id), hctx);
        expect(count.unseen?.count).toBe(0);
      });

      it("lets a project viewer count and mark", async () => {
        // All three authorize as session.read, which is granted at viewer:
        // anyone who can list must be able to mark what they have read.
        const { org, hctx: ownerHctx } = await initOwner();
        const proj = await createProj(ownerHctx, org);
        const id = toProjectId(proj.id!.id);

        const target = await appointMember(auth, ownerHctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "viewer"),
          ownerHctx,
        );
        const viewerHctx = await mkCtx(target.headers);

        const count = await getUnseenSessionCount(
          mkUnseenCountReq(id),
          viewerHctx,
        );
        expect(count.unseen?.count).toBe(0);
        await expect(
          markSessionsSeen(
            mkMarkSeenReq(id, [mkUnknownSessionId()]),
            viewerHctx,
          ),
        ).resolves.toBeDefined();
        await expect(
          markAllSessionsSeen(mkMarkAllSeenReq(id), viewerHctx),
        ).resolves.toBeDefined();
      });

      it("keeps one user's seen state out of another's", async () => {
        // Two project members marking independently. Nothing is recorded yet,
        // so this pins the shape: each caller's state is their own, and one
        // marking all seen does not move the other's count.
        const { org, hctx: ownerHctx } = await initOwner();
        const proj = await createProj(ownerHctx, org);
        const id = toProjectId(proj.id!.id);

        const target = await appointMember(auth, ownerHctx, org, "member");
        await assignProjectMember(
          mkAssignReq(id, target.userId, "viewer"),
          ownerHctx,
        );
        const viewerHctx = await mkCtx(target.headers);

        await markAllSessionsSeen(mkMarkAllSeenReq(id), ownerHctx);
        const viewerCount = await getUnseenSessionCount(
          mkUnseenCountReq(id),
          viewerHctx,
        );
        expect(viewerCount.unseen?.count).toBe(0);
        expect(viewerCount.unseen?.capped).toBe(false);
      });

      it("reports seen state on an unknown project as not-found", async () => {
        const { hctx } = await initOwner();
        const unknown = mkUnknownId();

        await expect(
          getUnseenSessionCount(mkUnseenCountReq(unknown), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          markSessionsSeen(mkMarkSeenReq(unknown, []), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          markAllSessionsSeen(mkMarkAllSeenReq(unknown), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("hides another org's project seen state as not-found", async () => {
        const a = await initOwner();
        const projA = toProjectId((await createProj(a.hctx, a.org)).id!.id);
        const b = await initOwner();

        await expect(
          getUnseenSessionCount(mkUnseenCountReq(projA), b.hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          markSessionsSeen(
            mkMarkSeenReq(projA, [mkUnknownSessionId()]),
            b.hctx,
          ),
        ).rejects.toMatchObject({ code: Code.NotFound });
        await expect(
          markAllSessionsSeen(mkMarkAllSeenReq(projA), b.hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });
    });

    describe("delete projects via organization deletion", () => {
      // Deleting projects uses a non-personal org, since a personal org cannot
      // be deleted.
      async function initOwnerWithOrg(): Promise<{
        org: OrgId;
        hctx: HandlerContext;
      }> {
        const sess = await signUpUser(auth);
        const created = await createOrganization(
          create(CreateOrganizationRequestSchema, {
            props: { name: "Cascade Co" },
          }),
          await mkCtx(sess.headers),
        );
        const org = toOrgId(created.id!.id);
        await switchOrg(auth, sess.headers, org);
        return { org, hctx: await mkCtx(sess.headers) };
      }

      const mkOrgDeleteReq = (org: OrgId, cascade = false) =>
        create(DeleteOrganizationRequestSchema, {
          id: create(OrganizationIdSchema, { id: org }),
          dangerouslyAllowProjectDeletion: cascade,
        });
      const mkOrgGetReq = (org: OrgId) =>
        create(GetOrganizationRequestSchema, {
          id: create(OrganizationIdSchema, { id: org }),
        });

      it("deletes an empty non-personal org", async () => {
        const { org, hctx } = await initOwnerWithOrg();
        await deleteOrganization(mkOrgDeleteReq(org), hctx);
        await expect(
          getOrganization(mkOrgGetReq(org), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });

      it("refuses to delete an org while projects remain", async () => {
        const { org, hctx } = await initOwnerWithOrg();
        await createProj(hctx, org);

        await expect(
          deleteOrganization(mkOrgDeleteReq(org), hctx),
        ).rejects.toMatchObject({ code: Code.FailedPrecondition });

        // Nothing was deleted.
        const remaining = await listProjects(mkListProjectsReq(org), hctx);
        expect(remaining.projects).toHaveLength(1);
      });

      it("cascade-deletes projects, their site keys, then the org", async () => {
        const { org, hctx } = await initOwnerWithOrg();
        const p1 = await createProj(hctx, org);
        const p2 = await createProj(hctx, org);
        await createSiteKey(mkCreateSiteKeyReq(toProjectId(p1.id!.id)), hctx);

        await deleteOrganization(mkOrgDeleteReq(org, true), hctx);

        for (const p of [p1, p2]) {
          await expect(
            getProject(mkGetReq(toProjectId(p.id!.id)), hctx),
          ).rejects.toMatchObject({ code: Code.NotFound });
        }
        await expect(
          getOrganization(mkOrgGetReq(org), hctx),
        ).rejects.toMatchObject({ code: Code.NotFound });
      });
    });
  });
}
