import type { ConnectRouter } from "@connectrpc/connect";
import {
  MembershipService,
  OrganizationService,
  ProjectService,
} from "@pixeltrace/schema";
import { authInterceptor } from "./lib/auth/interceptor";
import { errorLogInterceptor } from "./lib/observability/error-log-interceptor";
import {
  createMembership,
  deleteMembership,
  getMembership,
  listMemberships,
  updateMembership,
} from "./lib/membership/service";
import {
  createOrganization,
  deleteOrganization,
  getOrganization,
  listProjects,
  updateOrganization,
} from "./lib/org/service";
import {
  assignProjectMember,
  clearSessions,
  listDeletedSessions,
  restoreSession,
  createProject,
  createProjectTag,
  createSiteKey,
  deleteProject,
  deleteProjectTag,
  deleteSession,
  getProject,
  getProjectMember,
  getSession,
  getSessionPlaybackUrl,
  getSiteKey,
  getUnseenSessionCount,
  listLiveSessions,
  listProjectMembers,
  listProjectTags,
  listSessions,
  listSiteKeys,
  watchLiveSession,
  markAllSessionsSeen,
  markSessionsSeen,
  removeProjectMember,
  revokeSiteKey,
  updateProject,
  updateProjectMember,
  updateProjectTag,
  updateSession,
  updateSiteKey,
} from "./lib/project/service";

// Register the Connect service(s), each of which exposes its own set of routes.
export function routes(router: ConnectRouter) {
  // errorLogInterceptor is first (outermost) so its catch sees the raw error
  // from authInterceptor or any handler before Connect wraps it as an opaque
  // "internal error".
  const m = [errorLogInterceptor(), authInterceptor()];
  router.service(
    ProjectService,
    {
      createProject: createProject,
      getProject: getProject,
      updateProject: updateProject,
      deleteProject: deleteProject,
      createSiteKey: createSiteKey,
      getSiteKey: getSiteKey,
      listSiteKeys: listSiteKeys,
      updateSiteKey: updateSiteKey,
      revokeSiteKey: revokeSiteKey,
      createProjectTag: createProjectTag,
      listProjectTags: listProjectTags,
      updateProjectTag: updateProjectTag,
      deleteProjectTag: deleteProjectTag,
      assignProjectMember: assignProjectMember,
      getProjectMember: getProjectMember,
      updateProjectMember: updateProjectMember,
      removeProjectMember: removeProjectMember,
      listProjectMembers: listProjectMembers,
      listSessions: listSessions,
      listLiveSessions: listLiveSessions,
      getSession: getSession,
      updateSession: updateSession,
      deleteSession: deleteSession,
      listDeletedSessions: listDeletedSessions,
      restoreSession: restoreSession,
      markSessionsSeen: markSessionsSeen,
      markAllSessionsSeen: markAllSessionsSeen,
      getUnseenSessionCount: getUnseenSessionCount,
      clearSessions: clearSessions,
      getSessionPlaybackUrl: getSessionPlaybackUrl,
      watchLiveSession: watchLiveSession,
    },
    { interceptors: m },
  );
  router.service(
    OrganizationService,
    {
      createOrganization: createOrganization,
      getOrganization: getOrganization,
      updateOrganization: updateOrganization,
      deleteOrganization: deleteOrganization,
      listProjects: listProjects,
    },
    { interceptors: m },
  );
  router.service(
    MembershipService,
    {
      createMembership: createMembership,
      getMembership: getMembership,
      updateMembership: updateMembership,
      deleteMembership: deleteMembership,
      listMemberships: listMemberships,
    },
    { interceptors: m },
  );
}
