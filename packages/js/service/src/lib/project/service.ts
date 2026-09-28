import { create } from "@bufbuild/protobuf";
import { timestampFromDate } from "@bufbuild/protobuf/wkt";
import { Code, ConnectError, type HandlerContext } from "@connectrpc/connect";
import {
  isProjectTagId,
  orgResource,
  orgRoleOf,
  projectMembershipResource,
  projectResource,
  sessionResource,
  type Principal,
  type ProjectId,
  type ProjectTagId,
  type UserId,
} from "@pixeltrace/authz";
import {
  AssignProjectMemberResponseSchema,
  ClearSessionsResponseSchema,
  CreateProjectResponseSchema,
  CreateProjectTagResponseSchema,
  CreateSiteKeyResponseSchema,
  DeleteProjectResponseSchema,
  DeleteProjectTagResponseSchema,
  DeleteSessionResponseSchema,
  GetProjectMemberResponseSchema,
  GetProjectResponseSchema,
  GetSessionPlaybackUrlResponseSchema,
  GetSessionResponseSchema,
  GetSiteKeyResponseSchema,
  GetUnseenSessionCountResponseSchema,
  ListDeletedSessionsResponseSchema,
  ListProjectMembersResponseSchema,
  ListProjectTagsResponseSchema,
  ListSessionsResponseSchema,
  ListSiteKeysResponseSchema,
  MarkAllSessionsSeenResponseSchema,
  MarkSessionsSeenResponseSchema,
  ProjectIdSchema,
  ProjectMemberPropsSchema,
  ProjectPropsSchema,
  ProjectSiteKeyPropsSchema,
  ProjectTagPropsSchema,
  RemoveProjectMemberResponseSchema,
  RestoreSessionResponseSchema,
  RevokeSiteKeyResponseSchema,
  SessionIdSchema,
  SessionSchema,
  UpdateProjectMemberResponseSchema,
  WatchLiveSessionResponseSchema,
  UpdateProjectResponseSchema,
  UpdateProjectTagResponseSchema,
  UpdateSessionResponseSchema,
  UpdateSiteKeyResponseSchema,
  type AssignProjectMemberRequest,
  type AssignProjectMemberResponse,
  type ClearSessionsRequest,
  type ClearSessionsResponse,
  type CreateProjectRequest,
  type CreateProjectResponse,
  type CreateProjectTagRequest,
  type CreateProjectTagResponse,
  type CreateSiteKeyRequest,
  type CreateSiteKeyResponse,
  type DeleteProjectRequest,
  type DeleteProjectResponse,
  type DeleteProjectTagRequest,
  type DeleteProjectTagResponse,
  type DeleteSessionRequest,
  type DeleteSessionResponse,
  type GetProjectMemberRequest,
  type GetProjectMemberResponse,
  type GetProjectRequest,
  type GetProjectResponse,
  type GetSessionPlaybackUrlRequest,
  type GetSessionPlaybackUrlResponse,
  type GetSessionRequest,
  type GetSessionResponse,
  type GetSiteKeyRequest,
  type GetSiteKeyResponse,
  type GetUnseenSessionCountRequest,
  type GetUnseenSessionCountResponse,
  type ListDeletedSessionsRequest,
  type ListDeletedSessionsResponse,
  type ListProjectMembersRequest,
  type ListProjectMembersResponse,
  type ListProjectTagsRequest,
  type ListProjectTagsResponse,
  type ProjectTagId as ProtoProjectTagId,
  ListLiveSessionsResponseSchema,
  type ListLiveSessionsRequest,
  type ListLiveSessionsResponse,
  type ListSessionsRequest,
  type ListSessionsResponse,
  type ListSiteKeysRequest,
  type ListSiteKeysResponse,
  type MarkAllSessionsSeenRequest,
  type MarkAllSessionsSeenResponse,
  type MarkSessionsSeenRequest,
  type MarkSessionsSeenResponse,
  type RemoveProjectMemberRequest,
  type RemoveProjectMemberResponse,
  type RestoreSessionRequest,
  type RestoreSessionResponse,
  type RevokeSiteKeyRequest,
  type RevokeSiteKeyResponse,
  type UpdateProjectMemberRequest,
  type UpdateProjectMemberResponse,
  type UpdateProjectRequest,
  type UpdateProjectResponse,
  type UpdateProjectTagRequest,
  type UpdateProjectTagResponse,
  type SessionTagUpdate,
  type UpdateSessionRequest,
  type UpdateSessionResponse,
  type UpdateSiteKeyRequest,
  type UpdateSiteKeyResponse,
  type WatchLiveSessionRequest,
  type WatchLiveSessionResponse,
  LiveViewSchema,
} from "@pixeltrace/schema";
import { requireAuth } from "../auth/context";
import { requireGrant } from "../auth/grant";
import { membershipPortsOf } from "../membership/context";
import { maskSelector, requireParam, stringOr } from "../util/util";
import {
  requireOrgId,
  requireProjectId,
  requireProjectTagId,
  requireSessionId,
  requireSiteKeyId,
  requireUserId,
} from "../util/ids";
import { listPage, pageParams } from "../util/pagination";
import { roleFromProto } from "../util/roles";
import { projectPortsOf } from "./context";
import {
  ClearSessionsUnsupportedError,
  kMaxMarkSeenIds,
  kMaxTagLength,
  kMaxTagsPerProject,
  kMaxTagsPerSession,
  LiveWatchOfferRequiredError,
  SessionNotLiveError,
  SessionNotPlayableError,
  SiteKeyRevokedError,
  SystemTagUndeletableError,
  TagLabelConflictError,
  TooManyProjectTagsError,
  TooManySessionTagsError,
  UnknownTagError,
  type ProjectStore,
  type SessionTagUpdateSet,
  type UpdateProjectTagParams,
} from "./ports";
import {
  dataResidencyFromProto,
  projectMemberToProto,
  projectTagToProto,
  projectToProto,
  sessionToProto,
  siteKeyToProto,
  storageBackendFromProto,
  tagColorFromProto,
  unseenCountToProto,
} from "./protoconv";
import type { Project, ProjectMember, Session } from "../types/types";

/** This file contains the implementation of `pixeltrace.mgmt.v1.ProjectService`. */

/** Name given to a project created without one. */
const kDefaultProjectName = "Untitled project";

/**
 * Loads the project named by `id`, throwing a NotFound error tagged with the
 * calling `method` if it doesn't exist. Every endpoint reads the project first
 * to learn its owning org before checking the caller's grant.
 */
async function loadProject(
  port: ProjectStore,
  principal: Principal,
  id: ProjectId,
  ctx: HandlerContext,
  method: string,
): Promise<Project> {
  const project = await port.getProject(id, ctx.requestHeader);
  if (!project || !orgRoleOf(principal, project.organizationId)) {
    throw new ConnectError(`${method}: project not found`, Code.NotFound);
  }
  return project;
}

/**
 * Loads the target user's membership on a project, throwing a NotFound error
 * tagged with the calling `method` if they have no role there. Membership
 * endpoints authorize against the target's current role, so it must be read
 * before the grant check.
 */
async function loadProjectMember(
  port: ProjectStore,
  projectId: ProjectId,
  userId: UserId,
  ctx: HandlerContext,
  method: string,
): Promise<ProjectMember> {
  const member = await port.getProjectMember(
    projectId,
    userId,
    ctx.requestHeader,
  );
  if (!member) {
    throw new ConnectError(`${method}: not found`, Code.NotFound);
  }
  return member;
}

/**
 * Reports a membership write that matched no row. Those writes are
 * compare-and-swaps against the role the caller was authorized against, so a
 * miss is one of two things: the member was removed (NotFound), or their role
 * moved after the grant was minted and this caller's authorization no longer
 * describes what they would be changing. Returns the error to throw.
 */
async function membershipWriteMissed(
  port: ProjectStore,
  projectId: ProjectId,
  userId: UserId,
  ctx: HandlerContext,
  method: string,
): Promise<ConnectError> {
  const current = await port.getProjectMember(
    projectId,
    userId,
    ctx.requestHeader,
  );
  return current
    ? new ConnectError(
        `${method}: the member's role changed concurrently`,
        Code.Aborted,
      )
    : new ConnectError(`${method}: not found`, Code.NotFound);
}

/** Creates a new project within an organization. */
export async function createProject(
  req: CreateProjectRequest,
  ctx: HandlerContext,
): Promise<CreateProjectResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const org = requireOrgId(req.orgId?.id);
  const grant = requireGrant(principal, "project.create", orgResource(org));

  const project = await port.createProject(
    grant,
    {
      name: stringOr(req.props?.name ?? "", kDefaultProjectName),
      dataResidency: dataResidencyFromProto(req.dataResidency),
      storageBackend: storageBackendFromProto(req.storageBackend),
    },
    ctx.requestHeader,
  );

  return create(CreateProjectResponseSchema, {
    project: projectToProto(project),
  });
}

/** Fetches a project. */
export async function getProject(
  req: GetProjectRequest,
  ctx: HandlerContext,
): Promise<GetProjectResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const id = requireProjectId(req.id?.id);

  const project = await loadProject(port, principal, id, ctx, "getProject");

  requireGrant(
    principal,
    "project.read",
    projectResource(project.organizationId, project.id),
  );

  return create(GetProjectResponseSchema, {
    project: projectToProto(project),
  });
}

/** Updates a project's mutable properties. */
export async function updateProject(
  req: UpdateProjectRequest,
  ctx: HandlerContext,
): Promise<UpdateProjectResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const id = requireProjectId(req.id?.id);
  const project = await loadProject(port, principal, id, ctx, "updateProject");
  const projRes = projectResource(project.organizationId, id);

  const selector = maskSelector(req.updateMask);
  const wantsName = selector(ProjectPropsSchema.field.name);
  const wantsRecording = selector(ProjectPropsSchema.field.recordingDisabled);
  const wantsDiscard = selector(ProjectPropsSchema.field.discardUnderSeconds);
  const wantsIdle = selector(ProjectPropsSchema.field.idleTimeoutSeconds);
  const wantsRetention = selector(ProjectPropsSchema.field.retentionDays);
  if (
    !wantsName &&
    !wantsRecording &&
    !wantsDiscard &&
    !wantsIdle &&
    !wantsRetention
  ) {
    // Nothing writable was selected; this is effectively a read, so props are
    // not required — there is nothing to read them for.
    requireGrant(principal, "project.read", projRes);
    return create(UpdateProjectResponseSchema, {
      project: projectToProto(project),
    });
  }

  const props = requireParam(req.props);
  const grant = requireGrant(principal, "project.update", projRes);
  const updated = await port.updateProject(
    grant,
    {
      ...(wantsName ? { name: stringOr(props.name, kDefaultProjectName) } : {}),
      ...(wantsRecording ? { recordingDisabled: props.recordingDisabled } : {}),
      ...(wantsDiscard
        ? {
            discardUnderSeconds: nonnegativeOrNull(
              props.discardUnderSeconds,
              "discard_under_seconds",
            ),
          }
        : {}),
      ...(wantsIdle
        ? {
            idleTimeoutSeconds: positiveOrNull(
              props.idleTimeoutSeconds,
              "idle_timeout_seconds",
            ),
          }
        : {}),
      ...(wantsRetention
        ? {
            retentionDays: positiveOrNull(
              props.retentionDays,
              "retention_days",
            ),
          }
        : {}),
    },
    ctx.requestHeader,
  );
  if (!updated) {
    throw new ConnectError("updateProject: not found on update", Code.NotFound);
  }

  return create(UpdateProjectResponseSchema, {
    project: projectToProto(updated),
  });
}

/** Deletes a project. */
export async function deleteProject(
  req: DeleteProjectRequest,
  ctx: HandlerContext,
): Promise<DeleteProjectResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const id = requireProjectId(req.id?.id);

  const project = await loadProject(port, principal, id, ctx, "deleteProject");

  const grant = requireGrant(
    principal,
    "project.delete",
    projectResource(project.organizationId, id),
  );
  const deleted = await port.deleteProject(grant, ctx.requestHeader);
  if (!deleted) {
    throw new ConnectError("deleteProject: not found on delete", Code.NotFound);
  }

  return create(DeleteProjectResponseSchema, {});
}

/** Issues a new site key for a project. */
export async function createSiteKey(
  req: CreateSiteKeyRequest,
  ctx: HandlerContext,
): Promise<CreateSiteKeyResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const props = requireParam(req.props);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "createSiteKey",
  );

  const grant = requireGrant(
    principal,
    "project.ingest.manage_credentials",
    projectResource(project.organizationId, project.id),
  );

  const sk = await port.createSiteKey(
    grant,
    { label: props.label },
    ctx.requestHeader,
  );
  return create(CreateSiteKeyResponseSchema, {
    siteKey: siteKeyToProto(sk),
  });
}

/** Fetches a single site key belonging to a project. */
export async function getSiteKey(
  req: GetSiteKeyRequest,
  ctx: HandlerContext,
): Promise<GetSiteKeyResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const skId = requireSiteKeyId(req.key?.key);

  const project = await loadProject(port, principal, projId, ctx, "getSiteKey");

  const grant = requireGrant(
    principal,
    "project.ingest.read_credentials",
    projectResource(project.organizationId, project.id),
  );
  const sk = await port.getSiteKey(grant, skId, ctx.requestHeader);
  if (!sk) {
    throw new ConnectError(`site key not found`, Code.NotFound);
  }
  return create(GetSiteKeyResponseSchema, {
    siteKey: siteKeyToProto(sk),
  });
}

/** Lists the site keys issued for a project. */
export async function listSiteKeys(
  req: ListSiteKeysRequest,
  ctx: HandlerContext,
): Promise<ListSiteKeysResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "listSiteKeys",
  );

  const grant = requireGrant(
    principal,
    "project.ingest.read_credentials",
    projectResource(project.organizationId, project.id),
  );
  const { items, nextPageToken } = await listPage(
    pageParams(req.page),
    (page) => port.listSiteKeys(grant, page, ctx.requestHeader),
  );
  return create(ListSiteKeysResponseSchema, {
    siteKeys: items.map(siteKeyToProto),
    page: { nextPageToken: nextPageToken ?? "" },
  });
}

/** Updates a site key's mutable properties. */
export async function updateSiteKey(
  req: UpdateSiteKeyRequest,
  ctx: HandlerContext,
): Promise<UpdateSiteKeyResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const skId = requireSiteKeyId(req.key?.key);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "updateSiteKey",
  );
  const projRes = projectResource(project.organizationId, project.id);

  const selector = maskSelector(req.updateMask);
  if (!selector(ProjectSiteKeyPropsSchema.field.label)) {
    // Nothing writable was selected; this is effectively a read. (`label` is
    // currently the only prop writable through this endpoint.) Props are not
    // required on this path — there is nothing to read them for.
    const grant = requireGrant(
      principal,
      "project.ingest.read_credentials",
      projRes,
    );
    const sk = await port.getSiteKey(grant, skId, ctx.requestHeader);
    if (!sk) {
      throw new ConnectError("site key not found", Code.NotFound);
    }
    return create(UpdateSiteKeyResponseSchema, {
      siteKey: siteKeyToProto(sk),
    });
  }

  const props = requireParam(req.props);
  const grant = requireGrant(
    principal,
    "project.ingest.manage_credentials",
    projRes,
  );
  let updated;
  try {
    updated = await port.updateSiteKey(
      grant,
      skId,
      { label: props.label },
      ctx.requestHeader,
    );
  } catch (err) {
    if (err instanceof SiteKeyRevokedError) {
      throw new ConnectError("site key is revoked", Code.FailedPrecondition);
    }
    throw err;
  }
  if (!updated) {
    throw new ConnectError("site key not found", Code.NotFound);
  }
  return create(UpdateSiteKeyResponseSchema, {
    siteKey: siteKeyToProto(updated),
  });
}

/** Revokes an existing site key. */
export async function revokeSiteKey(
  req: RevokeSiteKeyRequest,
  ctx: HandlerContext,
): Promise<RevokeSiteKeyResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const skId = requireSiteKeyId(req.key?.key);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "revokeSiteKey",
  );

  const grant = requireGrant(
    principal,
    "project.ingest.manage_credentials",
    projectResource(project.organizationId, project.id),
  );
  const revoked = await port.deleteSiteKey(grant, skId, ctx.requestHeader);
  if (!revoked) {
    throw new ConnectError("site key not found", Code.NotFound);
  }
  return create(RevokeSiteKeyResponseSchema, {});
}

export async function createProjectTag(
  req: CreateProjectTagRequest,
  ctx: HandlerContext,
): Promise<CreateProjectTagResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const props = requireParam(req.props);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "createProjectTag",
  );
  const grant = requireGrant(
    principal,
    "project.update",
    projectResource(project.organizationId, project.id),
  );

  const tag = await tagWrite(() =>
    port.createProjectTag(
      grant,
      {
        label: validTagLabel(props.label),
        color: tagColorFromProto(props.color),
        customHex: validCustomHex(props.customHex),
      },
      ctx.requestHeader,
    ),
  );
  return create(CreateProjectTagResponseSchema, {
    tag: projectTagToProto(tag),
  });
}

export async function listProjectTags(
  req: ListProjectTagsRequest,
  ctx: HandlerContext,
): Promise<ListProjectTagsResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "listProjectTags",
  );
  const grant = requireGrant(
    principal,
    "project.read",
    projectResource(project.organizationId, project.id),
  );

  const listing = await port.listProjectTags(
    grant,
    req.includeSessionCounts,
    ctx.requestHeader,
  );
  return create(ListProjectTagsResponseSchema, {
    tags: listing.tags.map(projectTagToProto),
    sessionCounts: listing.sessionCounts,
  });
}

export async function updateProjectTag(
  req: UpdateProjectTagRequest,
  ctx: HandlerContext,
): Promise<UpdateProjectTagResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const tagId = requireProjectTagId(req.id?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "updateProjectTag",
  );
  const grant = requireGrant(
    principal,
    "project.update",
    projectResource(project.organizationId, project.id),
  );

  const selector = maskSelector(req.updateMask);
  const params: UpdateProjectTagParams = {};
  if (selector(ProjectTagPropsSchema.field.label)) {
    params.label = validTagLabel(requireParam(req.props).label);
  }
  if (selector(ProjectTagPropsSchema.field.color)) {
    params.color = tagColorFromProto(requireParam(req.props).color);
  }
  if (selector(ProjectTagPropsSchema.field.customHex)) {
    params.customHex = validCustomHex(requireParam(req.props).customHex);
  }

  const updated = await tagWrite(() =>
    port.updateProjectTag(grant, tagId, params, ctx.requestHeader),
  );
  if (!updated) {
    throw new ConnectError("tag not found", Code.NotFound);
  }
  return create(UpdateProjectTagResponseSchema, {
    tag: projectTagToProto(updated),
  });
}

export async function deleteProjectTag(
  req: DeleteProjectTagRequest,
  ctx: HandlerContext,
): Promise<DeleteProjectTagResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const tagId = requireProjectTagId(req.id?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "deleteProjectTag",
  );
  const grant = requireGrant(
    principal,
    "project.update",
    projectResource(project.organizationId, project.id),
  );

  let untagged;
  try {
    untagged = await port.deleteProjectTag(grant, tagId, ctx.requestHeader);
  } catch (err) {
    if (err instanceof SystemTagUndeletableError) {
      throw new ConnectError(
        "system tags cannot be deleted",
        Code.FailedPrecondition,
      );
    }
    throw err;
  }
  if (untagged === undefined) {
    throw new ConnectError("tag not found", Code.NotFound);
  }
  return create(DeleteProjectTagResponseSchema, {
    sessionsUntagged: untagged,
  });
}

function validTagLabel(label: string): string {
  const trimmed = label.trim();
  if (trimmed.length === 0) {
    throw new ConnectError("label is required", Code.InvalidArgument);
  }
  if (trimmed.length > kMaxTagLength) {
    throw new ConnectError(
      `label exceeds ${kMaxTagLength} characters`,
      Code.InvalidArgument,
    );
  }
  return trimmed;
}

function validCustomHex(hex: string | undefined): string | null {
  if (hex === undefined || hex.length === 0) {
    return null;
  }
  if (!kCustomHex.test(hex)) {
    throw new ConnectError(
      `custom_hex must be #rrggbb: "${hex}"`,
      Code.InvalidArgument,
    );
  }
  return hex.toLowerCase();
}

const kCustomHex = /^#[0-9a-fA-F]{6}$/;

async function tagWrite<T>(write: () => Promise<T>): Promise<T> {
  try {
    return await write();
  } catch (err) {
    if (err instanceof TagLabelConflictError) {
      throw new ConnectError(
        "a tag with that label already exists in this project",
        Code.AlreadyExists,
      );
    }
    if (err instanceof TooManyProjectTagsError) {
      throw new ConnectError(
        `a project may define at most ${kMaxTagsPerProject} tags`,
        Code.FailedPrecondition,
      );
    }
    throw err;
  }
}

export async function assignProjectMember(
  req: AssignProjectMemberRequest,
  ctx: HandlerContext,
): Promise<AssignProjectMemberResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.key?.projectId?.id);
  const targetUserId = requireUserId(req.key?.userId?.id);
  const role = roleFromProto(requireParam(req.props).role);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "assignProjectMember",
  );

  const orgId = project.organizationId;
  const grant = requireGrant(
    principal,
    "project.membership.create",
    projectMembershipResource(orgId, projId, targetUserId, role),
  );

  const membership = await membershipPortsOf(ctx).memberships.getMembership(
    orgId,
    targetUserId,
    ctx.requestHeader,
  );
  if (!membership) {
    throw new ConnectError(
      "assignProjectMember: user is not a member of the project's organization",
      Code.FailedPrecondition,
    );
  }

  // The store reports an existing role rather than this reading it first: a
  // read-then-insert would let two concurrent assignments both pass the read.
  const member = await port.assignProjectMember(grant, ctx.requestHeader);
  if (!member) {
    throw new ConnectError(
      "assignProjectMember: user already has a role on this project",
      Code.AlreadyExists,
    );
  }
  return create(AssignProjectMemberResponseSchema, {
    member: projectMemberToProto(member),
  });
}

export async function getProjectMember(
  req: GetProjectMemberRequest,
  ctx: HandlerContext,
): Promise<GetProjectMemberResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.key?.projectId?.id);
  const targetUserId = requireUserId(req.key?.userId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "getProjectMember",
  );
  const member = await loadProjectMember(
    port,
    projId,
    targetUserId,
    ctx,
    "getProjectMember",
  );

  // Now that we know the role, throw before returning the answer (if necessary).
  const orgId = project.organizationId;
  requireGrant(
    principal,
    "project.membership.read",
    projectMembershipResource(orgId, projId, targetUserId, member.role),
  );

  return create(GetProjectMemberResponseSchema, {
    member: projectMemberToProto(member),
  });
}

export async function updateProjectMember(
  req: UpdateProjectMemberRequest,
  ctx: HandlerContext,
): Promise<UpdateProjectMemberResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.key?.projectId?.id);
  const targetUserId = requireUserId(req.key?.userId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "updateProjectMember",
  );
  const orgId = project.organizationId;
  const current = await loadProjectMember(
    port,
    projId,
    targetUserId,
    ctx,
    "updateProjectMember",
  );

  const selector = maskSelector(req.updateMask);
  if (!selector(ProjectMemberPropsSchema.field.role)) {
    // Nothing writable was selected; this is effectively a read. (`role` is
    // currently the only prop writable through this endpoint.) Props are not
    // required on this path — there is nothing to read them for.
    requireGrant(
      principal,
      "project.membership.read",
      projectMembershipResource(orgId, projId, targetUserId, current.role),
    );
    return create(UpdateProjectMemberResponseSchema, {
      member: projectMemberToProto(current),
    });
  }

  // Changing a role is a revoke of the old plus a grant of the new: the caller
  // must outrank the current role and be able to appoint the new one.
  const newRole = roleFromProto(requireParam(req.props).role);
  const revoke = requireGrant(
    principal,
    "project.membership.delete",
    projectMembershipResource(orgId, projId, targetUserId, current.role),
  );
  const grant = requireGrant(
    principal,
    "project.membership.create",
    projectMembershipResource(orgId, projId, targetUserId, newRole),
  );

  const updated = await port.updateProjectMember(
    revoke,
    grant,
    ctx.requestHeader,
  );
  if (!updated) {
    throw await membershipWriteMissed(
      port,
      projId,
      targetUserId,
      ctx,
      "updateProjectMember",
    );
  }

  return create(UpdateProjectMemberResponseSchema, {
    member: projectMemberToProto(updated),
  });
}

export async function removeProjectMember(
  req: RemoveProjectMemberRequest,
  ctx: HandlerContext,
): Promise<RemoveProjectMemberResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.key?.projectId?.id);
  const targetUserId = requireUserId(req.key?.userId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "removeProjectMember",
  );
  const current = await loadProjectMember(
    port,
    projId,
    targetUserId,
    ctx,
    "removeProjectMember",
  );

  const orgId = project.organizationId;
  const grant = requireGrant(
    principal,
    "project.membership.delete",
    projectMembershipResource(orgId, projId, targetUserId, current.role),
  );
  const removed = await port.removeProjectMember(grant, ctx.requestHeader);
  if (!removed) {
    throw await membershipWriteMissed(
      port,
      projId,
      targetUserId,
      ctx,
      "removeProjectMember",
    );
  }

  return create(RemoveProjectMemberResponseSchema, {});
}

export async function listProjectMembers(
  req: ListProjectMembersRequest,
  ctx: HandlerContext,
): Promise<ListProjectMembersResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "listProjectMembers",
  );

  const grant = requireGrant(
    principal,
    "project.list_members",
    projectResource(project.organizationId, projId),
  );
  const { items, nextPageToken } = await listPage(
    pageParams(req.page),
    (page) => port.listProjectMembers(grant, page, ctx.requestHeader),
  );
  return create(ListProjectMembersResponseSchema, {
    members: items.map(projectMemberToProto),
    page: { nextPageToken: nextPageToken ?? "" },
  });
}

/** Lists the recorded sessions belonging to a project. */
export async function listSessions(
  req: ListSessionsRequest,
  ctx: HandlerContext,
): Promise<ListSessionsResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "listSessions",
  );

  const grant = requireGrant(
    principal,
    "session.list",
    projectResource(project.organizationId, projId),
  );
  const { items, nextPageToken } = await listPage(
    pageParams(req.page),
    (page) =>
      port.listSessions(
        principal.id,
        grant,
        page,
        { unseenOnly: req.unseenOnly, tagIds: normalizeTagIds(req.tagIds) },
        ctx.requestHeader,
      ),
  );
  return create(ListSessionsResponseSchema, {
    sessions: items.map(sessionToProto),
    page: { nextPageToken: nextPageToken ?? "" },
  });
}

/** Lists the sessions a project is currently recording. */
export async function listLiveSessions(
  req: ListLiveSessionsRequest,
  ctx: HandlerContext,
): Promise<ListLiveSessionsResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "listLiveSessions",
  );

  const grant = requireGrant(
    principal,
    "session.list",
    projectResource(project.organizationId, projId),
  );
  const sessions = await port.listLiveSessions(grant, ctx.requestHeader);
  return create(ListLiveSessionsResponseSchema, {
    sessions: sessions.map(sessionToProto),
  });
}

/** Fetches a single recorded session belonging to a project. */
export async function getSession(
  req: GetSessionRequest,
  ctx: HandlerContext,
): Promise<GetSessionResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const sessionId = requireSessionId(req.id?.id);

  const project = await loadProject(port, principal, projId, ctx, "getSession");

  const grant = requireGrant(
    principal,
    "session.read",
    sessionResource(project.organizationId, projId, sessionId),
  );
  const session = await port.getSession(principal.id, grant, ctx.requestHeader);
  if (!session) {
    throw new ConnectError("session not found", Code.NotFound);
  }
  return create(GetSessionResponseSchema, {
    session: sessionToProto(session),
  });
}

/** Updates a session's mutable properties. */
export async function updateSession(
  req: UpdateSessionRequest,
  ctx: HandlerContext,
): Promise<UpdateSessionResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const sessionId = requireSessionId(req.id?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "updateSession",
  );
  const sessRes = sessionResource(project.organizationId, projId, sessionId);

  const delta = tagDelta(req.tags);
  if (delta.add.length === 0 && delta.remove.length === 0) {
    const grant = requireGrant(principal, "session.read", sessRes);
    const session = await port.getSession(
      principal.id,
      grant,
      ctx.requestHeader,
    );
    if (!session) {
      throw new ConnectError("session not found", Code.NotFound);
    }
    return create(UpdateSessionResponseSchema, {
      session: sessionToProto(session),
    });
  }

  const grant = requireGrant(principal, "session.update", sessRes);
  const updated = await sessionTagWrite(() =>
    port.updateSessionTags(principal.id, grant, delta, ctx.requestHeader),
  );
  if (!updated) {
    throw new ConnectError("session not found", Code.NotFound);
  }
  return create(UpdateSessionResponseSchema, {
    session: sessionToProto(updated),
  });
}

function tagDelta(update: SessionTagUpdate | undefined): SessionTagUpdateSet {
  const add = new Set(
    (update?.add ?? []).map((tag) => requireProjectTagId(tag.id)),
  );
  const remove = new Set(
    (update?.remove ?? []).map((tag) => requireProjectTagId(tag.id)),
  );
  const both = [...add].filter((id) => remove.has(id));
  if (both.length > 0) {
    throw new ConnectError(
      `tags named in both add and remove: ${both.join(", ")}`,
      Code.InvalidArgument,
    );
  }
  if (add.size > kMaxTagsPerSession) {
    throw new ConnectError(
      `a session may carry at most ${kMaxTagsPerSession} tags`,
      Code.InvalidArgument,
    );
  }
  return { add: [...add], remove: [...remove] };
}

async function sessionTagWrite(
  write: () => Promise<Session | undefined>,
): Promise<Session | undefined> {
  try {
    return await write();
  } catch (err) {
    if (err instanceof UnknownTagError) {
      throw new ConnectError(
        `no such tag in this project: ${err.ids.join(", ")}`,
        Code.InvalidArgument,
      );
    }
    if (err instanceof TooManySessionTagsError) {
      throw new ConnectError(
        `a session may carry at most ${kMaxTagsPerSession} tags`,
        Code.FailedPrecondition,
      );
    }
    throw err;
  }
}

function normalizeTagIds(
  tags: readonly ProtoProjectTagId[],
): readonly ProjectTagId[] {
  const out = new Set<ProjectTagId>();
  for (const tag of tags) {
    if (isProjectTagId(tag.id)) {
      out.add(tag.id);
    }
  }
  return [...out];
}

/** Deletes a recorded session and its captured media. */
export async function deleteSession(
  req: DeleteSessionRequest,
  ctx: HandlerContext,
): Promise<DeleteSessionResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const sessionId = requireSessionId(req.id?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "deleteSession",
  );

  const grant = requireGrant(
    principal,
    "session.delete",
    sessionResource(project.organizationId, projId, sessionId),
  );
  const deleted = await port.deleteSession(grant, ctx.requestHeader);
  if (!deleted) {
    throw new ConnectError("session not found", Code.NotFound);
  }
  return create(DeleteSessionResponseSchema, {});
}

/** Lists the soft-deleted sessions of a project that can still be restored. */
export async function listDeletedSessions(
  req: ListDeletedSessionsRequest,
  ctx: HandlerContext,
): Promise<ListDeletedSessionsResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "listDeletedSessions",
  );

  const grant = requireGrant(
    principal,
    "session.list",
    projectResource(project.organizationId, projId),
  );
  const { items, nextPageToken } = await listPage(
    pageParams(req.page),
    (page) =>
      port.listDeletedSessions(principal.id, grant, page, ctx.requestHeader),
  );
  return create(ListDeletedSessionsResponseSchema, {
    sessions: items.map(sessionToProto),
    page: { nextPageToken: nextPageToken ?? "" },
  });
}

/** Undoes a session's deletion, while its captured media is still recoverable. */
export async function restoreSession(
  req: RestoreSessionRequest,
  ctx: HandlerContext,
): Promise<RestoreSessionResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const sessionId = requireSessionId(req.id?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "restoreSession",
  );

  const grant = requireGrant(
    principal,
    "session.restore",
    sessionResource(project.organizationId, projId, sessionId),
  );
  const restored = await port.restoreSession(
    principal.id,
    grant,
    ctx.requestHeader,
  );
  if (!restored) {
    // Could be: no such session, one that was never deleted, or one already
    // too far into deletion to come back.
    throw new ConnectError("session not restorable", Code.NotFound);
  }
  return create(RestoreSessionResponseSchema, {
    session: sessionToProto(restored),
  });
}

/**
 * Marks sessions seen, or unseen, by the calling user.
 *
 * Authorized as `session.read` on the *project*: the seen state is the caller's
 * own, and setting it is part of reading the session. One grant covers the
 * whole batch, since authz never consults session identity — only the project
 * the resource names.
 */
export async function markSessionsSeen(
  req: MarkSessionsSeenRequest,
  ctx: HandlerContext,
): Promise<MarkSessionsSeenResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  if (req.ids.length > kMaxMarkSeenIds) {
    throw new ConnectError(
      `markSessionsSeen: at most ${kMaxMarkSeenIds} ids per request, got ${req.ids.length}`,
      Code.InvalidArgument,
    );
  }
  const ids = req.ids.map((id) => requireSessionId(id.id));

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "markSessionsSeen",
  );

  const grant = requireGrant(
    principal,
    "session.read",
    projectResource(project.organizationId, projId),
  );
  const unseen = await port.markSessionsSeen(
    principal.id,
    grant,
    ids,
    req.seen,
    ctx.requestHeader,
  );
  return create(MarkSessionsSeenResponseSchema, {
    unseen: unseenCountToProto(unseen),
  });
}

/**
 * Marks every one of a project's sessions seen by the calling user. Idempotent,
 * and there is deliberately no mark-all-unseen counterpart.
 */
export async function markAllSessionsSeen(
  req: MarkAllSessionsSeenRequest,
  ctx: HandlerContext,
): Promise<MarkAllSessionsSeenResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "markAllSessionsSeen",
  );

  const grant = requireGrant(
    principal,
    "session.read",
    projectResource(project.organizationId, projId),
  );
  const unseen = await port.markAllSessionsSeen(
    principal.id,
    grant,
    ctx.requestHeader,
  );
  return create(MarkAllSessionsSeenResponseSchema, {
    unseen: unseenCountToProto(unseen),
  });
}

/** Reports how many of a project's sessions the calling user has not seen. */
export async function getUnseenSessionCount(
  req: GetUnseenSessionCountRequest,
  ctx: HandlerContext,
): Promise<GetUnseenSessionCountResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "getUnseenSessionCount",
  );

  const grant = requireGrant(
    principal,
    "session.read",
    projectResource(project.organizationId, projId),
  );
  const unseen = await port.getUnseenSessionCount(
    principal.id,
    grant,
    ctx.requestHeader,
  );
  return create(GetUnseenSessionCountResponseSchema, {
    unseen: unseenCountToProto(unseen),
  });
}

/**
 * Deletes every recorded session of a project and their captured media.
 * Idempotent: clearing a project with no sessions succeeds.
 */
export async function clearSessions(
  req: ClearSessionsRequest,
  ctx: HandlerContext,
): Promise<ClearSessionsResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "clearSessions",
  );

  const grant = requireGrant(
    principal,
    "session.clear",
    projectResource(project.organizationId, projId),
  );
  try {
    await port.clearSessions(grant, ctx.requestHeader);
  } catch (err) {
    if (err instanceof ClearSessionsUnsupportedError) {
      throw new ConnectError(err.message, Code.FailedPrecondition);
    }
    throw err;
  }
  return create(ClearSessionsResponseSchema, {});
}

/**
 * Mints a playback URL for a session's recording. The `session.read` check is
 * the whole authorization decision for the recording.
 */
export async function getSessionPlaybackUrl(
  req: GetSessionPlaybackUrlRequest,
  ctx: HandlerContext,
): Promise<GetSessionPlaybackUrlResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const sessionId = requireSessionId(req.sessionId?.id);

  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "getSessionPlaybackUrl",
  );

  const grant = requireGrant(
    principal,
    "session.read",
    sessionResource(project.organizationId, projId, sessionId),
  );

  let playback;
  try {
    playback = await port.getSessionPlaybackUrl(grant, ctx.requestHeader);
  } catch (err) {
    // A recording still in flight is a precondition failure, not a missing
    // session and not a denial.
    if (err instanceof SessionNotPlayableError) {
      throw new ConnectError(err.message, Code.FailedPrecondition);
    }
    throw err;
  }
  if (!playback) {
    throw new ConnectError("session not found", Code.NotFound);
  }

  return create(GetSessionPlaybackUrlResponseSchema, {
    playlistUrl: playback.playlistUrl,
    expiresAt: timestampFromDate(playback.expiresAt),
  });
}

/**
 * Attaches a viewer to a session that is still recording. Like playback, the
 * `session.read` check is the whole authorization decision for the media.
 */
export async function watchLiveSession(
  req: WatchLiveSessionRequest,
  ctx: HandlerContext,
): Promise<WatchLiveSessionResponse> {
  const principal = requireAuth(ctx);
  const port = projectPortsOf(ctx).projects;
  const projId = requireProjectId(req.projectId?.id);
  const sessionId = requireSessionId(req.sessionId?.id);
  const project = await loadProject(
    port,
    principal,
    projId,
    ctx,
    "watchLiveSession",
  );
  const grant = requireGrant(
    principal,
    "session.read",
    sessionResource(project.organizationId, projId, sessionId),
  );

  let watch;
  try {
    watch = await port.watchLiveSession(
      grant,
      req.sdpOffer,
      ctx.requestHeader,
    );
  } catch (err) {
    if (err instanceof SessionNotLiveError) {
      throw new ConnectError(err.message, Code.FailedPrecondition);
    }
    if (err instanceof LiveWatchOfferRequiredError) {
      throw new ConnectError("missing sdp_offer", Code.InvalidArgument);
    }
    throw err;
  }

  if (!watch) {
    throw new ConnectError("session not found", Code.NotFound);
  }

  return create(
    WatchLiveSessionResponseSchema,
    watch.transport === "sfu"
      ? { sdpAnswer: watch.sdpAnswer }
      : {
          liveView: create(LiveViewSchema, { relayUrl: watch.relayUrl }),
        },
  );
}

/**
 * Normalizes a selected optional numeric prop: absent clears the setting, and a
 * present value must be positive — an explicit 0 is rejected rather than given
 * a second "clear" meaning.
 */
function positiveOrNull(
  value: number | undefined,
  field: string,
): number | null {
  if (value === undefined) {
    return null;
  }
  if (!Number.isInteger(value) || value <= 0) {
    throw new ConnectError(
      `${field} must be a positive integer; omit it to clear the setting`,
      Code.InvalidArgument,
    );
  }
  return value;
}

/**
 * Like {@link positiveOrNull}, but an explicit 0 is a valid setting, distinct
 * from clearing back to the system default (e.g. a discard floor of 0 keeps
 * every session).
 */
function nonnegativeOrNull(
  value: number | undefined,
  field: string,
): number | null {
  if (value === undefined) {
    return null;
  }
  if (!Number.isInteger(value) || value < 0) {
    throw new ConnectError(
      `${field} must be a nonnegative integer; omit it to clear the setting`,
      Code.InvalidArgument,
    );
  }
  return value;
}
