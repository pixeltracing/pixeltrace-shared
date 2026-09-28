//
//  Generated code. Do not modify.
//  source: pixeltrace/mgmt/v1/project.proto
//

import "package:connectrpc/connect.dart" as connectlib;
import "project.pb.dart" as pixeltracemgmtv1project;
import "project.connect.spec.dart" as specs;

/// Provides data plane functionality related to projects.
extension type ProjectServiceClient(connectlib.Transport _transport) {
  /// Creates a new project within an organization.
  Future<pixeltracemgmtv1project.CreateProjectResponse> createProject(
    pixeltracemgmtv1project.CreateProjectRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.createProject,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Fetches a project.
  Future<pixeltracemgmtv1project.GetProjectResponse> getProject(
    pixeltracemgmtv1project.GetProjectRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.getProject,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a project's mutable properties.
  Future<pixeltracemgmtv1project.UpdateProjectResponse> updateProject(
    pixeltracemgmtv1project.UpdateProjectRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.updateProject,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a project.
  Future<pixeltracemgmtv1project.DeleteProjectResponse> deleteProject(
    pixeltracemgmtv1project.DeleteProjectRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.deleteProject,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Issues a new site key for a project.
  Future<pixeltracemgmtv1project.CreateSiteKeyResponse> createSiteKey(
    pixeltracemgmtv1project.CreateSiteKeyRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.createSiteKey,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Fetches a single site key belonging to a project.
  Future<pixeltracemgmtv1project.GetSiteKeyResponse> getSiteKey(
    pixeltracemgmtv1project.GetSiteKeyRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.getSiteKey,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Lists the site keys issued for a project.
  Future<pixeltracemgmtv1project.ListSiteKeysResponse> listSiteKeys(
    pixeltracemgmtv1project.ListSiteKeysRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.listSiteKeys,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a site key's mutable properties.
  Future<pixeltracemgmtv1project.UpdateSiteKeyResponse> updateSiteKey(
    pixeltracemgmtv1project.UpdateSiteKeyRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.updateSiteKey,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Revokes an existing site key.
  Future<pixeltracemgmtv1project.RevokeSiteKeyResponse> revokeSiteKey(
    pixeltracemgmtv1project.RevokeSiteKeyRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.revokeSiteKey,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Defines a new tag for a project.
  Future<pixeltracemgmtv1project.CreateProjectTagResponse> createProjectTag(
    pixeltracemgmtv1project.CreateProjectTagRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.createProjectTag,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Lists the tags defined for a project.
  Future<pixeltracemgmtv1project.ListProjectTagsResponse> listProjectTags(
    pixeltracemgmtv1project.ListProjectTagsRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.listProjectTags,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a project tag's mutable properties.
  Future<pixeltracemgmtv1project.UpdateProjectTagResponse> updateProjectTag(
    pixeltracemgmtv1project.UpdateProjectTagRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.updateProjectTag,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a project tag, removing it from every session carrying it.
  Future<pixeltracemgmtv1project.DeleteProjectTagResponse> deleteProjectTag(
    pixeltracemgmtv1project.DeleteProjectTagRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.deleteProjectTag,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Assigns a user a role on a project (creates the edge).
  Future<pixeltracemgmtv1project.AssignProjectMemberResponse>
  assignProjectMember(
    pixeltracemgmtv1project.AssignProjectMemberRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.assignProjectMember,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Fetches a user's role on a project.
  Future<pixeltracemgmtv1project.GetProjectMemberResponse> getProjectMember(
    pixeltracemgmtv1project.GetProjectMemberRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.getProjectMember,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a project member's role.
  Future<pixeltracemgmtv1project.UpdateProjectMemberResponse>
  updateProjectMember(
    pixeltracemgmtv1project.UpdateProjectMemberRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.updateProjectMember,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Removes a user's role on a project (deletes the edge).
  Future<pixeltracemgmtv1project.RemoveProjectMemberResponse>
  removeProjectMember(
    pixeltracemgmtv1project.RemoveProjectMemberRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.removeProjectMember,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Lists the members (role overrides) of a project.
  Future<pixeltracemgmtv1project.ListProjectMembersResponse> listProjectMembers(
    pixeltracemgmtv1project.ListProjectMembersRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.listProjectMembers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Lists the recorded sessions belonging to a project.
  Future<pixeltracemgmtv1project.ListSessionsResponse> listSessions(
    pixeltracemgmtv1project.ListSessionsRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.listSessions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Lists the project's sessions that are currently being recorded ("live").
  Future<pixeltracemgmtv1project.ListLiveSessionsResponse> listLiveSessions(
    pixeltracemgmtv1project.ListLiveSessionsRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.listLiveSessions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Fetches a single recorded session belonging to a project.
  Future<pixeltracemgmtv1project.GetSessionResponse> getSession(
    pixeltracemgmtv1project.GetSessionRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.getSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a session's mutable properties.
  Future<pixeltracemgmtv1project.UpdateSessionResponse> updateSession(
    pixeltracemgmtv1project.UpdateSessionRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.updateSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a recorded session and its captured media.
  Future<pixeltracemgmtv1project.DeleteSessionResponse> deleteSession(
    pixeltracemgmtv1project.DeleteSessionRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.deleteSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Lists the deleted sessions of a project that can still be restored.
  Future<pixeltracemgmtv1project.ListDeletedSessionsResponse>
  listDeletedSessions(
    pixeltracemgmtv1project.ListDeletedSessionsRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.listDeletedSessions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Undoes a session's deletion, before its captured media is deleted.
  Future<pixeltracemgmtv1project.RestoreSessionResponse> restoreSession(
    pixeltracemgmtv1project.RestoreSessionRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.restoreSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Marks sessions seen, or unseen, by the calling user.
  Future<pixeltracemgmtv1project.MarkSessionsSeenResponse> markSessionsSeen(
    pixeltracemgmtv1project.MarkSessionsSeenRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.markSessionsSeen,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Marks every one of a project's sessions seen by the calling user.
  Future<pixeltracemgmtv1project.MarkAllSessionsSeenResponse>
  markAllSessionsSeen(
    pixeltracemgmtv1project.MarkAllSessionsSeenRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.markAllSessionsSeen,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Counts the project's sessions the calling user has not seen.
  Future<pixeltracemgmtv1project.GetUnseenSessionCountResponse>
  getUnseenSessionCount(
    pixeltracemgmtv1project.GetUnseenSessionCountRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.getUnseenSessionCount,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes every recorded session of a project and their captured media.
  Future<pixeltracemgmtv1project.ClearSessionsResponse> clearSessions(
    pixeltracemgmtv1project.ClearSessionsRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.clearSessions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Returns a URL for playing back a session's recording.
  Future<pixeltracemgmtv1project.GetSessionPlaybackUrlResponse>
  getSessionPlaybackUrl(
    pixeltracemgmtv1project.GetSessionPlaybackUrlRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.getSessionPlaybackUrl,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Attaches a viewer to a session that is currently recording, so it can
  /// watch the capture live.
  Future<pixeltracemgmtv1project.WatchLiveSessionResponse> watchLiveSession(
    pixeltracemgmtv1project.WatchLiveSessionRequest input, {
    connectlib.Headers? headers,
    connectlib.AbortSignal? signal,
    Function(connectlib.Headers)? onHeader,
    Function(connectlib.Headers)? onTrailer,
  }) {
    return connectlib.Client(_transport).unary(
      specs.ProjectService.watchLiveSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
