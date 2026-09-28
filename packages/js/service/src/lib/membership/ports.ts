import type {
  Grant,
  MembershipResource,
  OrgId,
  OrgResource,
  UserId,
} from "@pixeltrace/authz";
import type { Membership } from "../types/types";
import type { Page, PageParams } from "../util/pagination";

/** Proof that the caller is authorized to create the described membership. */
export type CreateMembershipGrant = Grant<
  "membership.create",
  MembershipResource
>;

/** Proof that the caller is authorized to delete the described membership. */
export type DeleteMembershipGrant = Grant<
  "membership.delete",
  MembershipResource
>;

export interface MembershipStore {
  /** @unauthorized: other endpoints need to authorize against information that
   * this function provides. */
  getMembership(
    orgId: OrgId,
    userId: UserId,
    headers: Headers,
  ): Promise<Membership | undefined>;

  /**
   * @unauthorized: the service uses this to enforce the last-owner invariant.
   */
  countOwners(orgId: OrgId, headers: Headers): Promise<number>;

  /** @unauthorized: lets createMembership reject an unknown target user before
   * the store fails a foreign-key constraint on them. */
  userExists(userId: UserId, headers: Headers): Promise<boolean>;

  listMemberships(
    grant: Grant<"org.list_members", OrgResource>,
    page: PageParams,
    headers: Headers,
  ): Promise<Page<Membership>>;

  createMembership(
    grant: CreateMembershipGrant,
    headers: Headers,
  ): Promise<Membership>;

  updateMembership(
    revoke: DeleteMembershipGrant,
    grant: CreateMembershipGrant,
    headers: Headers,
  ): Promise<Membership | undefined>;

  deleteMembership(
    grant: DeleteMembershipGrant,
    headers: Headers,
  ): Promise<boolean>;
}

/**
 * The backing-store ports the MembershipService requires.
 */
export interface MembershipPorts {
  memberships: MembershipStore;
}
