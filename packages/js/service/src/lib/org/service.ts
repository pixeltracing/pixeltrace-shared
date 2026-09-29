import { Code, ConnectError, type HandlerContext } from "@connectrpc/connect";
import {
  CreateOrganizationResponseSchema,
  DeleteOrganizationResponseSchema,
  GetOrganizationResponseSchema,
  ListProjectsResponseSchema,
  OrganizationPropsSchema,
  UpdateOrganizationResponseSchema,
  type CreateOrganizationRequest,
  type CreateOrganizationResponse,
  type DeleteOrganizationRequest,
  type DeleteOrganizationResponse,
  type GetOrganizationRequest,
  type GetOrganizationResponse,
  type ListProjectsRequest,
  type ListProjectsResponse,
  type UpdateOrganizationRequest,
  type UpdateOrganizationResponse,
} from "@pixeltrace/schema";
import {
  orgResource,
  projectResource,
  type OrgId,
  type UserId,
  type UserPrincipal,
} from "@pixeltrace/authz";
import { create } from "@bufbuild/protobuf";
import { requireAuth, requireAuthContext } from "../auth/context.js";
import { requireGrant } from "../auth/grant.js";
import { projectPortsOf } from "../project/context.js";
import { projectToProto } from "../project/protoconv.js";
import { orgPortsOf } from "./context.js";
import { orgToProto } from "./protoconv.js";
import { SlugTakenError, type OrgPorts } from "./ports.js";
import type { Organization } from "../types/types.js";
import { maskSelector, requireParam, slugify, stringOr } from "../util/util.js";
import { requireOrgId } from "../util/ids.js";
import { listPage, pageParams } from "../util/pagination.js";

/** How many slug suffixes to try before giving up on a unique org slug. */
const kMaxSlugAttempts = 3;

/**
 * This file contains the implementation of `pixeltrace.mgmt.v1.OrganizationService`.
 */

export async function createOrganization(
  req: CreateOrganizationRequest,
  ctx: HandlerContext,
): Promise<CreateOrganizationResponse> {
  const { id: userId } = requireAuth(ctx);
  const props = requireParam(req.props);
  const ports = orgPortsOf(ctx);
  const name = stringOr(props.name, "New organization");

  // Org creation has no authz component (since permissions are org-scoped).
  const org = await createWithUniqueSlug(
    ports,
    name,
    userId,
    ctx.requestHeader,
  );

  return create(CreateOrganizationResponseSchema, {
    id: { id: org.id },
    props: { name: org.name },
  });
}

async function createWithUniqueSlug(
  ports: OrgPorts,
  name: string,
  userId: UserId,
  headers: Headers,
): Promise<Organization> {
  for (let attempt = 0; attempt < kMaxSlugAttempts; attempt++) {
    const slug = orgSlug(name, ports.slugSuffix);
    try {
      return await ports.orgs.createOrg({ name, slug }, userId, headers);
    } catch (err) {
      if (err instanceof SlugTakenError) {
        continue;
      }
      throw err;
    }
  }

  // Every suffix tried was taken; the request is safe to retry.
  throw new ConnectError(
    `could not allocate a unique slug for organization "${name}"`,
    Code.Aborted,
  );
}

export async function getOrganization(
  req: GetOrganizationRequest,
  ctx: HandlerContext,
): Promise<GetOrganizationResponse> {
  const principal = requireAuth(ctx);
  const orgId = requireOrgId(req.id?.id);
  const ports = orgPortsOf(ctx);
  const org = await ports.orgs.getOrg(orgId, ctx.requestHeader);
  if (!org) {
    throw new ConnectError("getOrganization: not found", Code.NotFound);
  }

  requireGrant(principal, "org.read", orgResource(orgId));

  return create(GetOrganizationResponseSchema, {
    organization: orgToProto(org),
  });
}

export async function updateOrganization(
  req: UpdateOrganizationRequest,
  ctx: HandlerContext,
): Promise<UpdateOrganizationResponse> {
  const principal = requireAuth(ctx);
  const orgId = requireOrgId(req.id?.id);
  const ports = orgPortsOf(ctx);

  // Read the org first (to learn it exists) before checking the caller's grant.
  const current = await ports.orgs.getOrg(orgId, ctx.requestHeader);
  if (!current) {
    throw new ConnectError("updateOrganization: not found", Code.NotFound);
  }

  const selected = maskSelector(req.updateMask);
  if (!selected(OrganizationPropsSchema.field.name)) {
    // Nothing writable was selected; this is effectively a read.
    requireGrant(principal, "org.read", orgResource(orgId));
    return create(UpdateOrganizationResponseSchema, {
      organization: orgToProto(current),
    });
  }

  const props = requireParam(req.props);
  const grant = requireGrant(principal, "org.update", orgResource(orgId));
  const org = await ports.orgs.updateOrg(
    grant,
    { name: props.name },
    ctx.requestHeader,
  );
  if (!org) {
    throw new ConnectError(
      "updateOrganization: not found on update",
      Code.NotFound,
    );
  }

  return create(UpdateOrganizationResponseSchema, {
    organization: orgToProto(org),
  });
}

export async function deleteOrganization(
  req: DeleteOrganizationRequest,
  ctx: HandlerContext,
): Promise<DeleteOrganizationResponse> {
  const { principal, personalOrgId } = requireAuthContext(ctx);
  const orgId = requireOrgId(req.id?.id);
  const ports = orgPortsOf(ctx);

  // Read the org first (to learn it exists) before checking the caller's grant.
  const current = await ports.orgs.getOrg(orgId, ctx.requestHeader);
  if (!current) {
    throw new ConnectError("deleteOrganization: not found", Code.NotFound);
  }

  const grant = requireGrant(principal, "org.delete", orgResource(orgId));

  // A personal org is not deletable, since it forms the base auth context of
  // all user actions.
  if (personalOrgId && orgId === personalOrgId) {
    throw new ConnectError(
      "personal organizations cannot be deleted",
      Code.FailedPrecondition,
    );
  }

  // Deleting the org would orphan all its projects, keeping their site keys
  // live and ingest enabled. So either refuse while projects remain, or fully
  // delete them first.
  if (req.dangerouslyAllowProjectDeletion) {
    await deleteAllProjects(principal, orgId, ctx);
  } else {
    await assertNoProjects(principal, orgId, ctx);
  }

  const deleted = await ports.orgs.deleteOrg(grant, ctx.requestHeader);
  if (!deleted) {
    throw new ConnectError(
      "deleteOrganization: not found on delete",
      Code.NotFound,
    );
  }

  return create(DeleteOrganizationResponseSchema, {});
}

/**
 * Rejects with FailedPrecondition if the org still has any projects.
 */
async function assertNoProjects(
  principal: UserPrincipal,
  orgId: OrgId,
  ctx: HandlerContext,
): Promise<void> {
  const grant = requireGrant(
    principal,
    "org.list_projects",
    orgResource(orgId),
  );
  // One row is enough to answer the question.
  const { items } = await projectPortsOf(ctx).projects.listProjects(
    grant,
    { pageSize: 1 },
    ctx.requestHeader,
  );
  if (items.length > 0) {
    throw new ConnectError(
      "organization still has projects",
      Code.FailedPrecondition,
    );
  }
}

/**
 * Deletes every project in the org, including site keys, storage, etc.
 */
async function deleteAllProjects(
  principal: UserPrincipal,
  orgId: OrgId,
  ctx: HandlerContext,
): Promise<void> {
  const projects = projectPortsOf(ctx).projects;
  const listGrant = requireGrant(
    principal,
    "org.list_projects",
    orgResource(orgId),
  );

  // Delete a page at a time, re-reading the first page each round since the
  // previous round's projects are now gone.
  for (;;) {
    const { items } = await projects.listProjects(
      listGrant,
      {},
      ctx.requestHeader,
    );
    if (items.length === 0) {
      break;
    }
    for (const project of items) {
      const deleteGrant = requireGrant(
        principal,
        "project.delete",
        projectResource(orgId, project.id),
      );
      await projects.deleteProject(deleteGrant, ctx.requestHeader);
    }
  }
}

export async function listProjects(
  req: ListProjectsRequest,
  ctx: HandlerContext,
): Promise<ListProjectsResponse> {
  const principal = requireAuth(ctx);
  const orgId = requireOrgId(req.orgId?.id);

  // Org-scoped like project creation: the grant check enforces org membership,
  // so there's no separate existence read. Backed by the project store, since
  // projects are owned there rather than by the (Better Auth) org store.
  const grant = requireGrant(
    principal,
    "org.list_projects",
    orgResource(orgId),
  );
  const projects = projectPortsOf(ctx).projects;
  const { items, nextPageToken } = await listPage(
    pageParams(req.page),
    (page) => projects.listProjects(grant, page, ctx.requestHeader),
  );

  return create(ListProjectsResponseSchema, {
    projects: items.map(projectToProto),
    page: { nextPageToken: nextPageToken ?? "" },
  });
}

/**
 * Derives a URL-safe slug from an org name. A short unique suffix keeps the
 * slug globally unique (required by the store).
 */
function orgSlug(name: string, suffix: () => string): string {
  return `${slugify(name)}-${suffix()}`;
}
