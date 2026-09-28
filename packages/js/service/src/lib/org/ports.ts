import {
  newId,
  type Grant,
  type OrgId,
  type OrgResource,
  type UserId,
} from "@pixeltrace/authz";
import type { Organization } from "../types/types";

export type CreateOrgParams = Pick<Organization, "name" | "slug">;

export type UpdateOrgParams = Pick<Organization, "name">;

export class SlugTakenError extends Error {}

export interface OrgStore {
  /** @unauthorized: other endpoints read the org first (to confirm it exists)
   * before checking the caller's grant. */
  getOrg(id: OrgId, headers: Headers): Promise<Organization | undefined>;

  /** @unauthorized: org creation has no authz component, since permissions are
   * org-scoped and no org exists yet to grant against. */
  createOrg(
    params: CreateOrgParams,
    ownerId: UserId,
    headers: Headers,
  ): Promise<Organization>;

  updateOrg(
    grant: Grant<"org.update", OrgResource>,
    params: UpdateOrgParams,
    headers: Headers,
  ): Promise<Organization | undefined>;

  deleteOrg(
    grant: Grant<"org.delete", OrgResource>,
    headers: Headers,
  ): Promise<boolean>;
}

/**
 * The backing-store ports the OrganizationService requires.
 */
export interface OrgPorts {
  orgs: OrgStore;
  slugSuffix: () => string;
}

/** The production slug suffix: a short likely-unique token. */
export function defaultSlugSuffix(): string {
  return newId("").slice(0, 8);
}
