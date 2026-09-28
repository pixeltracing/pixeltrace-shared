import type {
  Grant,
  OrgId,
  OrgResource,
  ProjectId,
  ProjectMembershipResource,
  ProjectResource,
  ProjectTagId,
  Role,
  SessionId,
  SessionResource,
  SiteKeyId,
  UserId,
} from "@pixeltrace/authz";
import type { ProjectSiteKeyProps } from "@pixeltrace/schema";
import type {
  Project,
  ProjectMember,
  ProjectTag,
  Session,
  SiteKey,
} from "../types/types";
import type { Page, PageParams } from "../util/pagination";

export type CreateProjectParams = Pick<
  Project,
  "name" | "dataResidency" | "storageBackend"
>;

/** Absent fields are left unchanged (the update mask did not select them). */
export type UpdateProjectParams = Partial<
  Pick<
    Project,
    | "name"
    | "recordingDisabled"
    | "discardUnderSeconds"
    | "idleTimeoutSeconds"
    | "retentionDays"
  >
>;

export type CreateSiteKeyParams = Pick<ProjectSiteKeyProps, "label">;

export type UpdateSiteKeyParams = Pick<ProjectSiteKeyProps, "label">;

/** Narrows a session listing. A field left at its zero value matches everything. */
export interface SessionFilter {
  /** Return only the sessions the user has not seen. */
  unseenOnly: boolean;
  /** Return only sessions carrying at least one of these. Empty matches all. */
  tagIds: readonly ProjectTagId[];
}

export type CreateProjectTagParams = Pick<
  ProjectTag,
  "label" | "color" | "customHex"
>;

/** Absent fields are left unchanged (the update mask did not select them). */
export type UpdateProjectTagParams = Partial<CreateProjectTagParams>;

export interface ProjectTagListing {
  tags: ProjectTag[];
  sessionCounts: Record<ProjectTagId, number>;
}

export interface SessionTagUpdateSet {
  add: readonly ProjectTagId[];
  remove: readonly ProjectTagId[];
}

export const kMaxTagsPerProject = 100;
export const kMaxTagsPerSession = 50;
export const kMaxTagLength = 64;

export const kSystemTagSeeds: readonly Pick<
  ProjectTag,
  "kind" | "label" | "color"
>[] = [
  { kind: "pinned", label: "Pinned", color: "gray" },
  { kind: "flagged", label: "Flagged", color: "red" },
];

/**
 * A starting vocabulary seeded into a new project alongside
 * {@link kSystemTagSeeds}. These are ordinary custom tags: the project can
 * rename or delete them, and they count against {@link kMaxTagsPerProject}.
 * Seeded only at creation, so a project that deletes them keeps them gone.
 */
export const kStarterTagSeeds: readonly Pick<ProjectTag, "label" | "color">[] =
  [
    { label: "Conversion", color: "green" },
    { label: "Dropped off", color: "orange" },
    { label: "Confused", color: "yellow" },
    { label: "Bug", color: "magenta" },
    { label: "Signup", color: "blue" },
    { label: "Needs followup", color: "purple" },
  ];

export class TagLabelConflictError extends Error {}

export class TooManyProjectTagsError extends Error {}

export class SystemTagUndeletableError extends Error {}

export class UnknownTagError extends Error {
  constructor(readonly ids: readonly ProjectTagId[]) {
    super(`unknown tags: ${ids.join(", ")}`);
  }
}

export class TooManySessionTagsError extends Error {}

/** How many of a project's sessions a user has not seen. */
export interface UnseenCount {
  /** The unseen sessions, or the store's display cap when `capped`. */
  count: number;
  /** True when count stops at the display cap: caller should render "count+". */
  capped: boolean;
}

/** The most sessions one {@link ProjectStore.markSessionsSeen} call may name. */
export const kMaxMarkSeenIds = 1000;

export interface ProjectStore {
  /** @unauthorized: access allowed because the other endpoints need to be able
   * to fetch a given project's organization id in order to authorize their
   * operations. */
  getProject(id: ProjectId, headers: Headers): Promise<Project | undefined>;

  /** @unauthorized: this backs principal resolution in the auth interceptor,
   * which runs before any grant exists. */
  getProjectRoles(
    userId: UserId,
    headers: Headers,
  ): Promise<Record<ProjectId, Role>>;

  /** @unauthorized: other endpoints need to authorize against another member's
   * role (checking for outranking). */
  getProjectMember(
    projectId: ProjectId,
    userId: UserId,
    headers: Headers,
  ): Promise<ProjectMember | undefined>;

  /**
   * Grants the role in `grant`'s resource, or returns undefined if the user
   * already holds one on that project.
   */
  assignProjectMember(
    grant: Grant<"project.membership.create", ProjectMembershipResource>,
    headers: Headers,
  ): Promise<ProjectMember | undefined>;

  /**
   * Moves a member from the role `revoke` names to the one `grant` names, or
   * returns undefined if they no longer hold the revoked role.
   */
  updateProjectMember(
    revoke: Grant<"project.membership.delete", ProjectMembershipResource>,
    grant: Grant<"project.membership.create", ProjectMembershipResource>,
    headers: Headers,
  ): Promise<ProjectMember | undefined>;

  /**
   * Removes the role in `grant`'s resource, or returns false if the member no
   * longer holds exactly that role — a compare-and-swap for the same reason
   * {@link updateProjectMember} is one.
   */
  removeProjectMember(
    grant: Grant<"project.membership.delete", ProjectMembershipResource>,
    headers: Headers,
  ): Promise<boolean>;
  clearOrgProjectRoles(
    orgId: OrgId,
    userId: UserId,
    headers: Headers,
  ): Promise<void>;
  listProjectMembers(
    grant: Grant<"project.list_members", ProjectResource>,
    page: PageParams,
    headers: Headers,
  ): Promise<Page<ProjectMember>>;

  createProject(
    grant: Grant<"project.create", OrgResource>,
    params: CreateProjectParams,
    headers: Headers,
  ): Promise<Project>;
  listProjects(
    grant: Grant<"org.list_projects", OrgResource>,
    page: PageParams,
    headers: Headers,
  ): Promise<Page<Project>>;
  deleteProject(
    grant: Grant<"project.delete", ProjectResource>,
    headers: Headers,
  ): Promise<boolean>;
  updateProject(
    grant: Grant<"project.update", ProjectResource>,
    params: UpdateProjectParams,
    headers: Headers,
  ): Promise<Project | undefined>;

  createSiteKey(
    grant: Grant<"project.ingest.manage_credentials", ProjectResource>,
    params: CreateSiteKeyParams,
    headers: Headers,
  ): Promise<SiteKey>;
  getSiteKey(
    grant: Grant<"project.ingest.read_credentials", ProjectResource>,
    id: SiteKeyId,
    headers: Headers,
  ): Promise<SiteKey | undefined>;
  listSiteKeys(
    grant: Grant<"project.ingest.read_credentials", ProjectResource>,
    page: PageParams,
    headers: Headers,
  ): Promise<Page<SiteKey>>;
  updateSiteKey(
    grant: Grant<"project.ingest.manage_credentials", ProjectResource>,
    id: SiteKeyId,
    params: UpdateSiteKeyParams,
    headers: Headers,
  ): Promise<SiteKey | undefined>;
  deleteSiteKey(
    grant: Grant<"project.ingest.manage_credentials", ProjectResource>,
    id: SiteKeyId,
    headers: Headers,
  ): Promise<boolean>;

  createProjectTag(
    grant: Grant<"project.update", ProjectResource>,
    params: CreateProjectTagParams,
    headers: Headers,
  ): Promise<ProjectTag>;
  listProjectTags(
    grant: Grant<"project.read", ProjectResource>,
    includeSessionCounts: boolean,
    headers: Headers,
  ): Promise<ProjectTagListing>;
  updateProjectTag(
    grant: Grant<"project.update", ProjectResource>,
    id: ProjectTagId,
    params: UpdateProjectTagParams,
    headers: Headers,
  ): Promise<ProjectTag | undefined>;
  deleteProjectTag(
    grant: Grant<"project.update", ProjectResource>,
    id: ProjectTagId,
    headers: Headers,
  ): Promise<number | undefined>;

  listSessions(
    user: UserId,
    grant: Grant<"session.list", ProjectResource>,
    page: PageParams,
    filter: SessionFilter,
    headers: Headers,
  ): Promise<Page<Session>>;
  listLiveSessions(
    grant: Grant<"session.list", ProjectResource>,
    headers: Headers,
  ): Promise<Session[]>;
  getSession(
    user: UserId,
    grant: Grant<"session.read", SessionResource>,
    headers: Headers,
  ): Promise<Session | undefined>;
  updateSessionTags(
    user: UserId,
    grant: Grant<"session.update", SessionResource>,
    delta: SessionTagUpdateSet,
    headers: Headers,
  ): Promise<Session | undefined>;
  listDeletedSessions(
    user: UserId,
    grant: Grant<"session.list", ProjectResource>,
    page: PageParams,
    headers: Headers,
  ): Promise<Page<Session>>;
  restoreSession(
    user: UserId,
    grant: Grant<"session.restore", SessionResource>,
    headers: Headers,
  ): Promise<Session | undefined>;
  markSessionsSeen(
    user: UserId,
    grant: Grant<"session.read", ProjectResource>,
    ids: readonly SessionId[],
    seen: boolean,
    headers: Headers,
  ): Promise<UnseenCount>;
  markAllSessionsSeen(
    user: UserId,
    grant: Grant<"session.read", ProjectResource>,
    headers: Headers,
  ): Promise<UnseenCount>;
  getUnseenSessionCount(
    user: UserId,
    grant: Grant<"session.read", ProjectResource>,
    headers: Headers,
  ): Promise<UnseenCount>;

  deleteSession(
    grant: Grant<"session.delete", SessionResource>,
    headers: Headers,
  ): Promise<boolean>;
  clearSessions(
    grant: Grant<"session.clear", ProjectResource>,
    headers: Headers,
  ): Promise<void>;
  getSessionPlaybackUrl(
    grant: Grant<"session.read", SessionResource>,
    headers: Headers,
  ): Promise<SessionPlayback | undefined>;

  /** Attaches a viewer, or returns undefined if the session is absent. */
  watchLiveSession(
    grant: Grant<"session.read", SessionResource>,
    sdpOffer: string,
    headers: Headers,
  ): Promise<LiveWatch | undefined>;
}

/** A viewer's attachment, shaped by the session's live transport. */
export type LiveWatch =
  | { transport: "sfu"; sdpAnswer: string }
  | { transport: "upload"; relayUrl: string };


/** Information for session playback. */
export interface SessionPlayback {
  /**
   * Fully-qualified playlist URL. Treat this as opaque to the client: don't
   * parse or rebuild it.
   */
  playlistUrl: string;
  /** When the URL stops working. */
  expiresAt: Date;
}

/**
 * Thrown by {@link ProjectStore.getSessionPlaybackUrl} for a session that
 * exists but has nothing to play. Distinct from an absent session, which
 * returns undefined.
 */
export class SessionNotPlayableError extends Error {}

/**
 * Thrown by {@link ProjectStore.watchLiveSession} for a session that exists but
 * has no live media to watch. Distinct from an absent session, which returns
 * undefined.
 */
export class SessionNotLiveError extends Error {}

/**
 * Thrown by {@link ProjectStore.watchLiveSession} when an SFU session is
 * watched without an SDP offer.
 */
export class LiveWatchOfferRequiredError extends Error {}

/**
 * Thrown by {@link ProjectStore.clearSessions} when the project's captured
 * media is not the platform's to delete.
 */
export class ClearSessionsUnsupportedError extends Error {}

/**
 * Thrown by {@link ProjectStore.updateSiteKey} for a key that exists but has
 * been revoked. Distinct from an absent key, which returns undefined.
 */
export class SiteKeyRevokedError extends Error {}

/** The backing-store ports the ProjectService requires. */
export interface ProjectPorts {
  projects: ProjectStore;
}
