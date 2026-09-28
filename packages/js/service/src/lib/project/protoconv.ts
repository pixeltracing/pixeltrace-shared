import { create } from "@bufbuild/protobuf";
import { durationFromMs, timestampFromDate } from "@bufbuild/protobuf/wkt";
import { Code, ConnectError } from "@connectrpc/connect";
import {
  DataResidency as ProtoDataResidency,
  OrganizationIdSchema,
  ProjectIdSchema,
  ProjectMemberKeySchema,
  ProjectMemberPropsSchema,
  ProjectMemberSchema,
  ProjectPropsSchema,
  ProjectSchema,
  ProjectSiteKeyPropsSchema,
  ProjectSiteKeySchema,
  ProjectSiteKey_Status,
  ProjectTagColor as ProtoProjectTagColor,
  ProjectTagIdSchema,
  ProjectTagKind as ProtoProjectTagKind,
  ProjectTagPropsSchema,
  ProjectTagSchema,
  SessionAttributesSchema,
  SessionIdSchema,
  SessionPropsSchema,
  SessionPublisherInfoSchema,
  SessionSchema,
  Session_Status,
  LiveTransport as ProtoLiveTransport,
  SiteKeySchema,
  SparklineSchema,
  StorageBackend as ProtoStorageBackend,
  UnseenSessionCountSchema,
  UserIdSchema,
  type ProjectMember as ProtoProjectMember,
  type Project as ProtoProject,
  type ProjectSiteKey as ProtoProjectSiteKey,
  type ProjectTag as ProtoProjectTag,
  type Session as ProtoSession,
  type UnseenSessionCount as ProtoUnseenCount,
} from "@pixeltrace/schema";
import {
  kDataResidencies,
  kStorageBackends,
  type DataResidency,
  type Project,
  type ProjectMember,
  type ProjectTag,
  type Session,
  type LiveTransport,
  type SiteKey,
  type StorageBackend,
  type TagColor,
  type TagKind,
} from "../types/types";
import { roleToProto } from "../util/roles";
import type { UnseenCount } from "./ports";

export function projectMemberToProto(m: ProjectMember): ProtoProjectMember {
  return create(ProjectMemberSchema, {
    key: create(ProjectMemberKeySchema, {
      projectId: create(ProjectIdSchema, { id: m.projectId }),
      userId: create(UserIdSchema, { id: m.userId }),
    }),
    props: create(ProjectMemberPropsSchema, {
      role: roleToProto(m.role),
    }),
  });
}

/** Maps a proto {@link ProtoDataResidency} to its domain value. */
export function dataResidencyFromProto(
  value: ProtoDataResidency,
): DataResidency {
  switch (value) {
    case ProtoDataResidency.US:
      return kDataResidencies.us;
    default:
      throw new ConnectError(
        "data_residency is required",
        Code.InvalidArgument,
      );
  }
}

const kTagColorProto: Record<TagColor, ProtoProjectTagColor> = {
  none: ProtoProjectTagColor.NONE,
  black: ProtoProjectTagColor.BLACK,
  white: ProtoProjectTagColor.WHITE,
  gray: ProtoProjectTagColor.GRAY,
  red: ProtoProjectTagColor.RED,
  orange: ProtoProjectTagColor.ORANGE,
  yellow: ProtoProjectTagColor.YELLOW,
  green: ProtoProjectTagColor.GREEN,
  cyan: ProtoProjectTagColor.CYAN,
  blue: ProtoProjectTagColor.BLUE,
  indigo: ProtoProjectTagColor.INDIGO,
  purple: ProtoProjectTagColor.PURPLE,
  magenta: ProtoProjectTagColor.MAGENTA,
};

const kTagColorDomain = new Map<ProtoProjectTagColor, TagColor>(
  Object.entries(kTagColorProto).map(([domain, proto]) => [
    proto,
    domain as TagColor,
  ]),
);

export function tagColorFromProto(value: ProtoProjectTagColor): TagColor {
  const color = kTagColorDomain.get(value);
  if (!color) {
    throw new ConnectError("color is required", Code.InvalidArgument);
  }
  return color;
}

export function tagColorToProto(value: TagColor): ProtoProjectTagColor {
  return kTagColorProto[value];
}

const kTagKindProto: Record<TagKind, ProtoProjectTagKind> = {
  custom: ProtoProjectTagKind.CUSTOM,
  pinned: ProtoProjectTagKind.PINNED,
  flagged: ProtoProjectTagKind.FLAGGED,
};

export function tagKindToProto(value: TagKind): ProtoProjectTagKind {
  return kTagKindProto[value];
}

export function projectTagToProto(tag: ProjectTag): ProtoProjectTag {
  return create(ProjectTagSchema, {
    id: create(ProjectTagIdSchema, { id: tag.id }),
    projectId: create(ProjectIdSchema, { id: tag.projectId }),
    createdAt: timestampFromDate(tag.createdAt),
    props: create(ProjectTagPropsSchema, {
      label: tag.label,
      color: tagColorToProto(tag.color),
      customHex: tag.customHex ?? undefined,
    }),
    kind: tagKindToProto(tag.kind),
  });
}

/** Maps a proto {@link ProtoStorageBackend} to its domain value. */
export function storageBackendFromProto(
  value: ProtoStorageBackend,
): StorageBackend {
  switch (value) {
    case ProtoStorageBackend.MANAGED:
      return kStorageBackends.managed;
    case ProtoStorageBackend.BYOB:
      return kStorageBackends.byob;
    default:
      throw new ConnectError(
        "storage_backend is required",
        Code.InvalidArgument,
      );
  }
}

/** Maps a domain {@link DataResidency} to its proto value. */
export function dataResidencyToProto(value: DataResidency): ProtoDataResidency {
  switch (value) {
    case kDataResidencies.us:
      return ProtoDataResidency.US;
  }
}

/** Maps a domain {@link StorageBackend} to its proto value. */
export function storageBackendToProto(
  value: StorageBackend,
): ProtoStorageBackend {
  switch (value) {
    case kStorageBackends.managed:
      return ProtoStorageBackend.MANAGED;
    case kStorageBackends.byob:
      return ProtoStorageBackend.BYOB;
  }
}

export function projectToProto(project: Project): ProtoProject {
  return create(ProjectSchema, {
    id: create(ProjectIdSchema, { id: project.id }),
    orgId: create(OrganizationIdSchema, { id: project.organizationId }),
    dataResidency: dataResidencyToProto(project.dataResidency),
    storageBackend: storageBackendToProto(project.storageBackend),
    props: create(ProjectPropsSchema, {
      name: project.name,
      recordingDisabled: project.recordingDisabled,
      discardUnderSeconds: project.discardUnderSeconds ?? undefined,
      idleTimeoutSeconds: project.idleTimeoutSeconds ?? undefined,
      retentionDays: project.retentionDays ?? undefined,
    }),
  });
}

/** Maps a domain {@link SessionStatus} to its proto enum value. */
function sessionStatusToProto(status: Session["status"]): Session_Status {
  return status === "READY" ? Session_Status.READY : Session_Status.RECORDING;
}

function liveTransportToProto(transport: LiveTransport): ProtoLiveTransport {
  return transport === "upload"
    ? ProtoLiveTransport.UPLOAD
    : ProtoLiveTransport.SFU;
}

export function sessionToProto(session: Session): ProtoSession {
  return create(SessionSchema, {
    id: create(SessionIdSchema, { id: session.id }),
    projectId: create(ProjectIdSchema, { id: session.projectId }),
    status: sessionStatusToProto(session.status),
    liveTransport: liveTransportToProto(session.liveTransport),
    props: create(SessionPropsSchema, {
      tagIds: session.tagIds.map((id) => create(ProjectTagIdSchema, { id })),
    }),
    seen: session.seen,
    publisherInfo: create(SessionPublisherInfoSchema, {
      referrer: session.referrer,
    }),
    attributes: create(SessionAttributesSchema, {
      startedAt: timestampFromDate(session.startedAt),
      endedAt:
        session.endedAt != null
          ? timestampFromDate(session.endedAt)
          : undefined,
      duration:
        session.status === "READY"
          ? durationFromMs(session.durationMs)
          : undefined,
      sizeBytes: BigInt(session.sizeBytes),
      country: session.country,
      browser: session.browser,
      os: session.os,
      deviceType: session.deviceType,
      userAgent: session.userAgent,
      clientTcpRttMs: session.clientTcpRtt ?? undefined,
      deletedAt:
        session.deletedAt != null
          ? timestampFromDate(session.deletedAt)
          : undefined,
      activity: session.activity
        ? create(SparklineSchema, { points: session.activity.points })
        : undefined,
    }),
  });
}

/** Maps a store {@link UnseenCount} onto the wire message the seen RPCs answer with. */
export function unseenCountToProto(unseen: UnseenCount): ProtoUnseenCount {
  return create(UnseenSessionCountSchema, {
    count: unseen.count,
    capped: unseen.capped,
  });
}

export function siteKeyToProto(siteKey: SiteKey): ProtoProjectSiteKey {
  return create(ProjectSiteKeySchema, {
    key: create(SiteKeySchema, { key: siteKey.key }),
    status:
      siteKey.status === "REVOKED"
        ? ProjectSiteKey_Status.REVOKED
        : ProjectSiteKey_Status.ACTIVE,
    createdAt: timestampFromDate(siteKey.createdAt),
    revokedAt:
      siteKey.revokedAt != null
        ? timestampFromDate(siteKey.revokedAt)
        : undefined,
    props: create(ProjectSiteKeyPropsSchema, { label: siteKey.label ?? "" }),
  });
}
