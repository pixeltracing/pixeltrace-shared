import { Code, ConnectError } from "@connectrpc/connect";
import { Role as ProtoRole } from "@pixeltrace/schema";
import type { Role } from "@pixeltrace/authz";

// The role ladder is shared by org and project membership, so its proto<->domain
// conversion lives here rather than being duplicated per protoconv module.

const toProto: Record<Role, ProtoRole> = {
  viewer: ProtoRole.VIEWER,
  member: ProtoRole.MEMBER,
  admin: ProtoRole.ADMIN,
  owner: ProtoRole.OWNER,
};

const fromProto: Partial<Record<ProtoRole, Role>> = {
  [ProtoRole.VIEWER]: "viewer",
  [ProtoRole.MEMBER]: "member",
  [ProtoRole.ADMIN]: "admin",
  [ProtoRole.OWNER]: "owner",
};

/** Maps a domain {@link Role} to its proto enum. */
export function roleToProto(role: Role): ProtoRole {
  return toProto[role];
}

/** Maps a proto role to its domain value, rejecting UNSPECIFIED. */
export function roleFromProto(role: ProtoRole): Role {
  const domain = fromProto[role];
  if (!domain) {
    throw new ConnectError("role is unspecified", Code.InvalidArgument);
  }
  return domain;
}
