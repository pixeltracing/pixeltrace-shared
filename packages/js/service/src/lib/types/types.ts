import type {
  OrgId,
  ProjectId,
  ProjectTagId,
  Role,
  SessionId,
  SiteKeyId,
  UserId,
} from "@pixeltrace/authz";

/** The current time. */
export function now(): Date {
  return new Date();
}

/** The status of a site key. */
export type SiteKeyStatus = "ACTIVE" | "REVOKED";

/** A Pixeltrace organization. The top-level owner of projects. */
export interface Organization {
  id: OrgId;
  name: string;
  slug: string;
  createdAt: Date;
}

/** A membership: the edge granting a user a role within an organization. */
export interface Membership {
  orgId: OrgId;
  userId: UserId;
  role: Role;
  createdAt: Date;
}

/**
 * A project membership: the edge granting a user a role scoped to a single
 * project (a per-project role override).
 */
export interface ProjectMember {
  projectId: ProjectId;
  userId: UserId;
  role: Role;
  createdAt: Date;
}

/** A Pixeltrace project. */
export interface Project {
  id: ProjectId;
  organizationId: OrgId;
  name: string;
  dataResidency: DataResidency;
  storageBackend: StorageBackend;
  storageConfig: StorageConfig;
  /** When true, the ingest plane refuses to start new recording sessions. */
  recordingDisabled: boolean;
  /** Recordings shorter than this are discarded at finalize. Null: keep all. */
  discardUnderSeconds: number | null;
  /** Idle time before a session is finalized. Null: the system default. */
  idleTimeoutSeconds: number | null;
  /** Days a recording is kept after it ends. Null: kept indefinitely. */
  retentionDays: number | null;
  createdAt: Date;
  siteKeys: SiteKey[];
}

/**
 * A site key uniquely identifies a Pixeltrace project. Site keys are not
 * secret.
 */
export interface SiteKey {
  /** The public key value (`pubk_*`). */
  key: SiteKeyId;
  projectId: ProjectId;
  status: SiteKeyStatus;
  label: string | null;
  createdAt: Date;
  revokedAt: Date | null;
}

export const kTagColors = [
  "none",
  "black",
  "white",
  "gray",
  "red",
  "orange",
  "yellow",
  "green",
  "cyan",
  "blue",
  "indigo",
  "purple",
  "magenta",
] as const;
export type TagColor = (typeof kTagColors)[number];

export const kTagKinds = ["custom", "pinned", "flagged"] as const;
export type TagKind = (typeof kTagKinds)[number];

export interface ProjectTag {
  id: ProjectTagId;
  projectId: ProjectId;
  label: string;
  color: TagColor;
  customHex: string | null;
  kind: TagKind;
  createdAt: Date;
}

/** The lifecycle state of a session's recording. */
export type SessionStatus = "RECORDING" | "READY";

/** Which path a session's live media travels. */
export type LiveTransport = "sfu" | "upload";

/**
 * A recorded session captured for a project.
 */
export interface Session {
  id: SessionId;
  projectId: ProjectId;
  status: SessionStatus;
  liveTransport: LiveTransport;
  startedAt: Date;
  /** When capture stopped. Null while still recording. */
  endedAt: Date | null;
  /** Duration of the captured media in milliseconds. */
  durationMs: number;
  /** Total size of the captured media in bytes. */
  sizeBytes: number;
  /** Client-reported document.referrer at session start. Empty when unknown. */
  referrer: string;
  /** ISO 3166-1 alpha-2 country code of the publisher. Empty when unknown. */
  country: string;
  /** Browser family parsed from the User-Agent. Empty when unknown. */
  browser: string;
  /** OS family parsed from the User-Agent. Empty when unknown. */
  os: string;
  /** Coarse form factor: "desktop", "mobile", or "tablet". Empty when unknown. */
  deviceType: string;
  /** The raw User-Agent header. Empty when unknown. */
  userAgent: string;
  /** Client-to-edge TCP round-trip time in milliseconds. Null when unknown. */
  clientTcpRtt: number | null;
  /** When the session was soft-deleted, or null if it is not deleted. */
  deletedAt: Date | null;
  /** Whether the user this session was read on behalf of has seen it. */
  seen: boolean;
  tagIds: ProjectTagId[];
  /**
   * How active the recording was over its length. Null when it was never
   * measured, which differs from a recording measured and found still.
   */
  activity: Sparkline | null;
}

/**
 * A coarse activity curve over a recording, for display as a sparkline.
 *
 * Relative by construction: it says where a recording was busy compared with its
 * own quietest and busiest moments, and carries no meaning between recordings.
 */
export interface Sparkline {
  /**
   * One sample per point, scaled 0..255 against the recording's own peak,
   * evenly spaced over its presentation timeline.
   */
  points: Uint8Array;
}

/** The provider-neutral storage target the capture process expects. */
export interface StorageConfig {
  /** S3-compatible endpoint URL. */
  endpoint: string;
  /** Bucket name. */
  bucket: string;
  /** Opaque reference to the credentials that grant access, never the secret. */
  credentialsRef: string;
}

/** Where a project's data lives. Currently US-only. */
export const kDataResidencies = {
  us: "us",
} as const;
export type DataResidency =
  (typeof kDataResidencies)[keyof typeof kDataResidencies];

/** Which backend a project's {@link StorageConfig} resolves to. */
export const kStorageBackends = {
  /** Pixeltrace-owned bucket. */
  managed: "managed",
  /** Customer-owned bucket. */
  byob: "byob",
} as const;
export type StorageBackend =
  (typeof kStorageBackends)[keyof typeof kStorageBackends];
