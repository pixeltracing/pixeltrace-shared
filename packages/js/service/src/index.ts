// Public entry point for @pixeltrace/service.

export { createAuth, type Auth } from "./lib/auth/create-auth.js";
export { handleBetterAuthReq } from "./lib/auth/entrypoint.js";
export { kAuth, kAuthContext, requireAuth } from "./lib/auth/context.js";
export type { AuthContext } from "./lib/auth/context.js";
export { resolveAuthContext } from "./lib/auth/interceptor.js";
export type { ProjectRoleLookup } from "./lib/auth/interceptor.js";
export type {
  AuthConfig,
  EmailMessage,
  EmailSender,
} from "./lib/auth/config.js";

export { routes } from "./routes.js";
export { requirePorts } from "./lib/util/context.js";
export {
  decodeCursor,
  encodeCursor,
  InvalidCursorError,
  kDefaultPageSize,
  keysetPage,
  kMaxPageSize,
  resolvePageSize,
} from "./lib/util/pagination.js";
export type { Page, PageParams } from "./lib/util/pagination.js";
export { kProjectPorts, projectPortsOf } from "./lib/project/context.js";
export type {
  CreateProjectParams,
  CreateProjectTagParams,
  CreateSiteKeyParams,
  ProjectPorts,
  ProjectStore,
  ProjectTagListing,
  SessionFilter,
  SessionTagUpdateSet,
  UnseenCount,
  UpdateProjectParams,
  UpdateProjectTagParams,
  UpdateSiteKeyParams,
} from "./lib/project/ports.js";
export { kOrgPorts, orgPortsOf } from "./lib/org/context.js";
export type {
  OrgPorts,
  OrgStore,
  CreateOrgParams,
  UpdateOrgParams,
} from "./lib/org/ports.js";
export {
  ClearSessionsUnsupportedError,
  LiveWatchOfferRequiredError,
  kMaxTagsPerProject,
  kMaxTagsPerSession,
  SessionNotLiveError,
  SessionNotPlayableError,
  SiteKeyRevokedError,
  SystemTagUndeletableError,
  TagLabelConflictError,
  TooManyProjectTagsError,
  TooManySessionTagsError,
  UnknownTagError,
  kStarterTagSeeds,
  kSystemTagSeeds,
} from "./lib/project/ports.js";
export type { LiveWatch, SessionPlayback } from "./lib/project/ports.js";
export { SlugTakenError } from "./lib/org/ports.js";
export { makeBetterAuthOrgPorts } from "./lib/org/better_auth_port.js";
export { makeBetterAuthMembershipPorts } from "./lib/membership/better_auth_port.js";
export {
  kMembershipPorts,
  membershipPortsOf,
} from "./lib/membership/context.js";
export type {
  MembershipPorts,
  MembershipStore,
  CreateMembershipGrant,
  DeleteMembershipGrant,
} from "./lib/membership/ports.js";
export type {
  Organization,
  Membership,
  Project,
  ProjectMember,
  ProjectTag,
  LiveTransport,
  Session,
  SessionStatus,
  SiteKey,
  SiteKeyStatus,
  Sparkline,
  StorageConfig,
  DataResidency,
  StorageBackend,
  TagColor,
  TagKind,
} from "./lib/types/types.js";
export {
  kDataResidencies,
  kStorageBackends,
  kTagColors,
  kTagKinds,
} from "./lib/types/types.js";
