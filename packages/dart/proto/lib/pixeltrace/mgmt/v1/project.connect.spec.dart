//
//  Generated code. Do not modify.
//  source: pixeltrace/mgmt/v1/project.proto
//

import "package:connectrpc/connect.dart" as connectlib;
import "project.pb.dart" as pixeltracemgmtv1project;

/// Provides data plane functionality related to projects.
abstract final class ProjectService {
  /// Fully-qualified name of the ProjectService service.
  static const name = 'pixeltrace.mgmt.v1.ProjectService';

  /// Creates a new project within an organization.
  static const createProject = connectlib.Spec(
    '/$name/CreateProject',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.CreateProjectRequest.new,
    pixeltracemgmtv1project.CreateProjectResponse.new,
  );

  /// Fetches a project.
  static const getProject = connectlib.Spec(
    '/$name/GetProject',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.GetProjectRequest.new,
    pixeltracemgmtv1project.GetProjectResponse.new,
  );

  /// Updates a project's mutable properties.
  static const updateProject = connectlib.Spec(
    '/$name/UpdateProject',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.UpdateProjectRequest.new,
    pixeltracemgmtv1project.UpdateProjectResponse.new,
  );

  /// Deletes a project.
  static const deleteProject = connectlib.Spec(
    '/$name/DeleteProject',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.DeleteProjectRequest.new,
    pixeltracemgmtv1project.DeleteProjectResponse.new,
  );

  /// Issues a new site key for a project.
  static const createSiteKey = connectlib.Spec(
    '/$name/CreateSiteKey',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.CreateSiteKeyRequest.new,
    pixeltracemgmtv1project.CreateSiteKeyResponse.new,
  );

  /// Fetches a single site key belonging to a project.
  static const getSiteKey = connectlib.Spec(
    '/$name/GetSiteKey',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.GetSiteKeyRequest.new,
    pixeltracemgmtv1project.GetSiteKeyResponse.new,
  );

  /// Lists the site keys issued for a project.
  static const listSiteKeys = connectlib.Spec(
    '/$name/ListSiteKeys',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.ListSiteKeysRequest.new,
    pixeltracemgmtv1project.ListSiteKeysResponse.new,
  );

  /// Updates a site key's mutable properties.
  static const updateSiteKey = connectlib.Spec(
    '/$name/UpdateSiteKey',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.UpdateSiteKeyRequest.new,
    pixeltracemgmtv1project.UpdateSiteKeyResponse.new,
  );

  /// Revokes an existing site key.
  static const revokeSiteKey = connectlib.Spec(
    '/$name/RevokeSiteKey',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.RevokeSiteKeyRequest.new,
    pixeltracemgmtv1project.RevokeSiteKeyResponse.new,
  );

  /// Defines a new tag for a project.
  static const createProjectTag = connectlib.Spec(
    '/$name/CreateProjectTag',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.CreateProjectTagRequest.new,
    pixeltracemgmtv1project.CreateProjectTagResponse.new,
  );

  /// Lists the tags defined for a project.
  static const listProjectTags = connectlib.Spec(
    '/$name/ListProjectTags',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.ListProjectTagsRequest.new,
    pixeltracemgmtv1project.ListProjectTagsResponse.new,
  );

  /// Updates a project tag's mutable properties.
  static const updateProjectTag = connectlib.Spec(
    '/$name/UpdateProjectTag',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.UpdateProjectTagRequest.new,
    pixeltracemgmtv1project.UpdateProjectTagResponse.new,
  );

  /// Deletes a project tag, removing it from every session carrying it.
  static const deleteProjectTag = connectlib.Spec(
    '/$name/DeleteProjectTag',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.DeleteProjectTagRequest.new,
    pixeltracemgmtv1project.DeleteProjectTagResponse.new,
  );

  /// Assigns a user a role on a project (creates the edge).
  static const assignProjectMember = connectlib.Spec(
    '/$name/AssignProjectMember',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.AssignProjectMemberRequest.new,
    pixeltracemgmtv1project.AssignProjectMemberResponse.new,
  );

  /// Fetches a user's role on a project.
  static const getProjectMember = connectlib.Spec(
    '/$name/GetProjectMember',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.GetProjectMemberRequest.new,
    pixeltracemgmtv1project.GetProjectMemberResponse.new,
  );

  /// Updates a project member's role.
  static const updateProjectMember = connectlib.Spec(
    '/$name/UpdateProjectMember',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.UpdateProjectMemberRequest.new,
    pixeltracemgmtv1project.UpdateProjectMemberResponse.new,
  );

  /// Removes a user's role on a project (deletes the edge).
  static const removeProjectMember = connectlib.Spec(
    '/$name/RemoveProjectMember',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.RemoveProjectMemberRequest.new,
    pixeltracemgmtv1project.RemoveProjectMemberResponse.new,
  );

  /// Lists the members (role overrides) of a project.
  static const listProjectMembers = connectlib.Spec(
    '/$name/ListProjectMembers',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.ListProjectMembersRequest.new,
    pixeltracemgmtv1project.ListProjectMembersResponse.new,
  );

  /// Lists the recorded sessions belonging to a project.
  static const listSessions = connectlib.Spec(
    '/$name/ListSessions',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.ListSessionsRequest.new,
    pixeltracemgmtv1project.ListSessionsResponse.new,
  );

  /// Lists the project's sessions that are currently being recorded ("live").
  static const listLiveSessions = connectlib.Spec(
    '/$name/ListLiveSessions',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.ListLiveSessionsRequest.new,
    pixeltracemgmtv1project.ListLiveSessionsResponse.new,
  );

  /// Fetches a single recorded session belonging to a project.
  static const getSession = connectlib.Spec(
    '/$name/GetSession',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.GetSessionRequest.new,
    pixeltracemgmtv1project.GetSessionResponse.new,
  );

  /// Updates a session's mutable properties.
  static const updateSession = connectlib.Spec(
    '/$name/UpdateSession',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.UpdateSessionRequest.new,
    pixeltracemgmtv1project.UpdateSessionResponse.new,
  );

  /// Deletes a recorded session and its captured media.
  static const deleteSession = connectlib.Spec(
    '/$name/DeleteSession',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.DeleteSessionRequest.new,
    pixeltracemgmtv1project.DeleteSessionResponse.new,
  );

  /// Lists the deleted sessions of a project that can still be restored.
  static const listDeletedSessions = connectlib.Spec(
    '/$name/ListDeletedSessions',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.ListDeletedSessionsRequest.new,
    pixeltracemgmtv1project.ListDeletedSessionsResponse.new,
  );

  /// Undoes a session's deletion, before its captured media is deleted.
  static const restoreSession = connectlib.Spec(
    '/$name/RestoreSession',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.RestoreSessionRequest.new,
    pixeltracemgmtv1project.RestoreSessionResponse.new,
  );

  /// Marks sessions seen, or unseen, by the calling user.
  static const markSessionsSeen = connectlib.Spec(
    '/$name/MarkSessionsSeen',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.MarkSessionsSeenRequest.new,
    pixeltracemgmtv1project.MarkSessionsSeenResponse.new,
  );

  /// Marks every one of a project's sessions seen by the calling user.
  static const markAllSessionsSeen = connectlib.Spec(
    '/$name/MarkAllSessionsSeen',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.MarkAllSessionsSeenRequest.new,
    pixeltracemgmtv1project.MarkAllSessionsSeenResponse.new,
  );

  /// Counts the project's sessions the calling user has not seen.
  static const getUnseenSessionCount = connectlib.Spec(
    '/$name/GetUnseenSessionCount',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.GetUnseenSessionCountRequest.new,
    pixeltracemgmtv1project.GetUnseenSessionCountResponse.new,
  );

  /// Deletes every recorded session of a project and their captured media.
  static const clearSessions = connectlib.Spec(
    '/$name/ClearSessions',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.ClearSessionsRequest.new,
    pixeltracemgmtv1project.ClearSessionsResponse.new,
  );

  /// Returns a URL for playing back a session's recording.
  static const getSessionPlaybackUrl = connectlib.Spec(
    '/$name/GetSessionPlaybackUrl',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.GetSessionPlaybackUrlRequest.new,
    pixeltracemgmtv1project.GetSessionPlaybackUrlResponse.new,
  );

  /// Attaches a viewer to a session that is currently recording, so it can
  /// watch the capture live.
  static const watchLiveSession = connectlib.Spec(
    '/$name/WatchLiveSession',
    connectlib.StreamType.unary,
    pixeltracemgmtv1project.WatchLiveSessionRequest.new,
    pixeltracemgmtv1project.WatchLiveSessionResponse.new,
  );
}
