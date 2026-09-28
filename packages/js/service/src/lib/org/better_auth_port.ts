import type { OrgId } from "@pixeltrace/authz";
import { APIError } from "better-auth/api";
import type { Auth } from "../auth/create-auth";
import {
  SlugTakenError,
  defaultSlugSuffix,
  type OrgPorts,
  type OrgStore,
} from "./ports";

/** Whether `err` is a Better Auth error carrying the given `body.code`. */
function hasErrorCode(err: unknown, ...codes: string[]): boolean {
  return (
    err instanceof APIError &&
    typeof err.body?.code === "string" &&
    codes.includes(err.body.code)
  );
}

/** Whether `err` means the org doesn't exist, or the caller isn't a member. */
function isOrgNotFound(err: unknown): boolean {
  return hasErrorCode(
    err,
    "ORGANIZATION_NOT_FOUND",
    "USER_IS_NOT_A_MEMBER_OF_THE_ORGANIZATION",
  );
}

/** Whether `err` means the requested org slug is already taken. */
function isSlugTaken(err: unknown): boolean {
  return hasErrorCode(err, "ORGANIZATION_ALREADY_EXISTS");
}

function makeBetterAuthOrgStore(auth: Auth): OrgStore {
  return {
    createOrg: async (params, ownerId) => {
      let created;
      try {
        created = await auth.api.createOrganization({
          body: { name: params.name, slug: params.slug, userId: ownerId },
        });
      } catch (err) {
        if (isSlugTaken(err)) {
          throw new SlugTakenError(params.slug);
        }
        throw err;
      }
      if (!created) {
        throw new Error("createOrganization: no organization created");
      }
      return {
        id: created.id as OrgId,
        name: created.name,
        slug: created.slug,
        createdAt: created.createdAt,
      };
    },

    getOrg: async (id, headers) => {
      let org;
      try {
        org = await auth.api.getFullOrganization({
          query: { organizationId: id },
          headers,
        });
      } catch (err) {
        if (isOrgNotFound(err)) {
          return undefined;
        }
        throw err;
      }
      return org
        ? {
            id: org.id as OrgId,
            name: org.name,
            slug: org.slug,
            createdAt: org.createdAt,
          }
        : undefined;
    },

    updateOrg: async (grant, params, headers) => {
      let updated;
      try {
        updated = await auth.api.updateOrganization({
          body: {
            organizationId: grant.resource.id,
            data: { name: params.name },
          },
          headers,
        });
      } catch (err) {
        if (isOrgNotFound(err)) {
          return undefined;
        }
        throw err;
      }
      return updated
        ? {
            id: updated.id as OrgId,
            name: updated.name,
            slug: updated.slug,
            createdAt: updated.createdAt,
          }
        : undefined;
    },

    deleteOrg: async (grant, headers) => {
      try {
        await auth.api.deleteOrganization({
          body: { organizationId: grant.resource.id },
          headers,
        });
      } catch (err) {
        if (isOrgNotFound(err)) {
          return false;
        }
        throw err;
      }
      return true;
    },
  };
}

export function makeBetterAuthOrgPorts(
  auth: Auth,
  slugSuffix: () => string = defaultSlugSuffix,
): OrgPorts {
  return { orgs: makeBetterAuthOrgStore(auth), slugSuffix };
}
