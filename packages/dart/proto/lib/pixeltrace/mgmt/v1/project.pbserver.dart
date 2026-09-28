// This is a generated file - do not edit.
//
// Generated from pixeltrace/mgmt/v1/project.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'project.pb.dart' as $7;
import 'project.pbjson.dart';

export 'project.pb.dart';

abstract class ProjectServiceBase extends $pb.GeneratedService {
  $async.Future<$7.CreateProjectResponse> createProject(
      $pb.ServerContext ctx, $7.CreateProjectRequest request);
  $async.Future<$7.GetProjectResponse> getProject(
      $pb.ServerContext ctx, $7.GetProjectRequest request);
  $async.Future<$7.UpdateProjectResponse> updateProject(
      $pb.ServerContext ctx, $7.UpdateProjectRequest request);
  $async.Future<$7.DeleteProjectResponse> deleteProject(
      $pb.ServerContext ctx, $7.DeleteProjectRequest request);
  $async.Future<$7.CreateSiteKeyResponse> createSiteKey(
      $pb.ServerContext ctx, $7.CreateSiteKeyRequest request);
  $async.Future<$7.GetSiteKeyResponse> getSiteKey(
      $pb.ServerContext ctx, $7.GetSiteKeyRequest request);
  $async.Future<$7.ListSiteKeysResponse> listSiteKeys(
      $pb.ServerContext ctx, $7.ListSiteKeysRequest request);
  $async.Future<$7.UpdateSiteKeyResponse> updateSiteKey(
      $pb.ServerContext ctx, $7.UpdateSiteKeyRequest request);
  $async.Future<$7.RevokeSiteKeyResponse> revokeSiteKey(
      $pb.ServerContext ctx, $7.RevokeSiteKeyRequest request);
  $async.Future<$7.CreateProjectTagResponse> createProjectTag(
      $pb.ServerContext ctx, $7.CreateProjectTagRequest request);
  $async.Future<$7.ListProjectTagsResponse> listProjectTags(
      $pb.ServerContext ctx, $7.ListProjectTagsRequest request);
  $async.Future<$7.UpdateProjectTagResponse> updateProjectTag(
      $pb.ServerContext ctx, $7.UpdateProjectTagRequest request);
  $async.Future<$7.DeleteProjectTagResponse> deleteProjectTag(
      $pb.ServerContext ctx, $7.DeleteProjectTagRequest request);
  $async.Future<$7.AssignProjectMemberResponse> assignProjectMember(
      $pb.ServerContext ctx, $7.AssignProjectMemberRequest request);
  $async.Future<$7.GetProjectMemberResponse> getProjectMember(
      $pb.ServerContext ctx, $7.GetProjectMemberRequest request);
  $async.Future<$7.UpdateProjectMemberResponse> updateProjectMember(
      $pb.ServerContext ctx, $7.UpdateProjectMemberRequest request);
  $async.Future<$7.RemoveProjectMemberResponse> removeProjectMember(
      $pb.ServerContext ctx, $7.RemoveProjectMemberRequest request);
  $async.Future<$7.ListProjectMembersResponse> listProjectMembers(
      $pb.ServerContext ctx, $7.ListProjectMembersRequest request);
  $async.Future<$7.ListSessionsResponse> listSessions(
      $pb.ServerContext ctx, $7.ListSessionsRequest request);
  $async.Future<$7.ListLiveSessionsResponse> listLiveSessions(
      $pb.ServerContext ctx, $7.ListLiveSessionsRequest request);
  $async.Future<$7.GetSessionResponse> getSession(
      $pb.ServerContext ctx, $7.GetSessionRequest request);
  $async.Future<$7.UpdateSessionResponse> updateSession(
      $pb.ServerContext ctx, $7.UpdateSessionRequest request);
  $async.Future<$7.DeleteSessionResponse> deleteSession(
      $pb.ServerContext ctx, $7.DeleteSessionRequest request);
  $async.Future<$7.ListDeletedSessionsResponse> listDeletedSessions(
      $pb.ServerContext ctx, $7.ListDeletedSessionsRequest request);
  $async.Future<$7.RestoreSessionResponse> restoreSession(
      $pb.ServerContext ctx, $7.RestoreSessionRequest request);
  $async.Future<$7.MarkSessionsSeenResponse> markSessionsSeen(
      $pb.ServerContext ctx, $7.MarkSessionsSeenRequest request);
  $async.Future<$7.MarkAllSessionsSeenResponse> markAllSessionsSeen(
      $pb.ServerContext ctx, $7.MarkAllSessionsSeenRequest request);
  $async.Future<$7.GetUnseenSessionCountResponse> getUnseenSessionCount(
      $pb.ServerContext ctx, $7.GetUnseenSessionCountRequest request);
  $async.Future<$7.ClearSessionsResponse> clearSessions(
      $pb.ServerContext ctx, $7.ClearSessionsRequest request);
  $async.Future<$7.GetSessionPlaybackUrlResponse> getSessionPlaybackUrl(
      $pb.ServerContext ctx, $7.GetSessionPlaybackUrlRequest request);
  $async.Future<$7.WatchLiveSessionResponse> watchLiveSession(
      $pb.ServerContext ctx, $7.WatchLiveSessionRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateProject':
        return $7.CreateProjectRequest();
      case 'GetProject':
        return $7.GetProjectRequest();
      case 'UpdateProject':
        return $7.UpdateProjectRequest();
      case 'DeleteProject':
        return $7.DeleteProjectRequest();
      case 'CreateSiteKey':
        return $7.CreateSiteKeyRequest();
      case 'GetSiteKey':
        return $7.GetSiteKeyRequest();
      case 'ListSiteKeys':
        return $7.ListSiteKeysRequest();
      case 'UpdateSiteKey':
        return $7.UpdateSiteKeyRequest();
      case 'RevokeSiteKey':
        return $7.RevokeSiteKeyRequest();
      case 'CreateProjectTag':
        return $7.CreateProjectTagRequest();
      case 'ListProjectTags':
        return $7.ListProjectTagsRequest();
      case 'UpdateProjectTag':
        return $7.UpdateProjectTagRequest();
      case 'DeleteProjectTag':
        return $7.DeleteProjectTagRequest();
      case 'AssignProjectMember':
        return $7.AssignProjectMemberRequest();
      case 'GetProjectMember':
        return $7.GetProjectMemberRequest();
      case 'UpdateProjectMember':
        return $7.UpdateProjectMemberRequest();
      case 'RemoveProjectMember':
        return $7.RemoveProjectMemberRequest();
      case 'ListProjectMembers':
        return $7.ListProjectMembersRequest();
      case 'ListSessions':
        return $7.ListSessionsRequest();
      case 'ListLiveSessions':
        return $7.ListLiveSessionsRequest();
      case 'GetSession':
        return $7.GetSessionRequest();
      case 'UpdateSession':
        return $7.UpdateSessionRequest();
      case 'DeleteSession':
        return $7.DeleteSessionRequest();
      case 'ListDeletedSessions':
        return $7.ListDeletedSessionsRequest();
      case 'RestoreSession':
        return $7.RestoreSessionRequest();
      case 'MarkSessionsSeen':
        return $7.MarkSessionsSeenRequest();
      case 'MarkAllSessionsSeen':
        return $7.MarkAllSessionsSeenRequest();
      case 'GetUnseenSessionCount':
        return $7.GetUnseenSessionCountRequest();
      case 'ClearSessions':
        return $7.ClearSessionsRequest();
      case 'GetSessionPlaybackUrl':
        return $7.GetSessionPlaybackUrlRequest();
      case 'WatchLiveSession':
        return $7.WatchLiveSessionRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateProject':
        return createProject(ctx, request as $7.CreateProjectRequest);
      case 'GetProject':
        return getProject(ctx, request as $7.GetProjectRequest);
      case 'UpdateProject':
        return updateProject(ctx, request as $7.UpdateProjectRequest);
      case 'DeleteProject':
        return deleteProject(ctx, request as $7.DeleteProjectRequest);
      case 'CreateSiteKey':
        return createSiteKey(ctx, request as $7.CreateSiteKeyRequest);
      case 'GetSiteKey':
        return getSiteKey(ctx, request as $7.GetSiteKeyRequest);
      case 'ListSiteKeys':
        return listSiteKeys(ctx, request as $7.ListSiteKeysRequest);
      case 'UpdateSiteKey':
        return updateSiteKey(ctx, request as $7.UpdateSiteKeyRequest);
      case 'RevokeSiteKey':
        return revokeSiteKey(ctx, request as $7.RevokeSiteKeyRequest);
      case 'CreateProjectTag':
        return createProjectTag(ctx, request as $7.CreateProjectTagRequest);
      case 'ListProjectTags':
        return listProjectTags(ctx, request as $7.ListProjectTagsRequest);
      case 'UpdateProjectTag':
        return updateProjectTag(ctx, request as $7.UpdateProjectTagRequest);
      case 'DeleteProjectTag':
        return deleteProjectTag(ctx, request as $7.DeleteProjectTagRequest);
      case 'AssignProjectMember':
        return assignProjectMember(
            ctx, request as $7.AssignProjectMemberRequest);
      case 'GetProjectMember':
        return getProjectMember(ctx, request as $7.GetProjectMemberRequest);
      case 'UpdateProjectMember':
        return updateProjectMember(
            ctx, request as $7.UpdateProjectMemberRequest);
      case 'RemoveProjectMember':
        return removeProjectMember(
            ctx, request as $7.RemoveProjectMemberRequest);
      case 'ListProjectMembers':
        return listProjectMembers(ctx, request as $7.ListProjectMembersRequest);
      case 'ListSessions':
        return listSessions(ctx, request as $7.ListSessionsRequest);
      case 'ListLiveSessions':
        return listLiveSessions(ctx, request as $7.ListLiveSessionsRequest);
      case 'GetSession':
        return getSession(ctx, request as $7.GetSessionRequest);
      case 'UpdateSession':
        return updateSession(ctx, request as $7.UpdateSessionRequest);
      case 'DeleteSession':
        return deleteSession(ctx, request as $7.DeleteSessionRequest);
      case 'ListDeletedSessions':
        return listDeletedSessions(
            ctx, request as $7.ListDeletedSessionsRequest);
      case 'RestoreSession':
        return restoreSession(ctx, request as $7.RestoreSessionRequest);
      case 'MarkSessionsSeen':
        return markSessionsSeen(ctx, request as $7.MarkSessionsSeenRequest);
      case 'MarkAllSessionsSeen':
        return markAllSessionsSeen(
            ctx, request as $7.MarkAllSessionsSeenRequest);
      case 'GetUnseenSessionCount':
        return getUnseenSessionCount(
            ctx, request as $7.GetUnseenSessionCountRequest);
      case 'ClearSessions':
        return clearSessions(ctx, request as $7.ClearSessionsRequest);
      case 'GetSessionPlaybackUrl':
        return getSessionPlaybackUrl(
            ctx, request as $7.GetSessionPlaybackUrlRequest);
      case 'WatchLiveSession':
        return watchLiveSession(ctx, request as $7.WatchLiveSessionRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ProjectServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => ProjectServiceBase$messageJson;
}
