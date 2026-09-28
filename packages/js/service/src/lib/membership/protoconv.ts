import { create } from "@bufbuild/protobuf";
import {
  MembershipKeySchema,
  MembershipPropsSchema,
  MembershipSchema,
  OrganizationIdSchema,
  UserIdSchema,
  type Membership as ProtoMembership,
} from "@pixeltrace/schema";
import type { Membership } from "../types/types";
import { roleToProto } from "../util/roles";

export function membershipToProto(m: Membership): ProtoMembership {
  return create(MembershipSchema, {
    key: create(MembershipKeySchema, {
      orgId: create(OrganizationIdSchema, { id: m.orgId }),
      userId: create(UserIdSchema, { id: m.userId }),
    }),
    props: create(MembershipPropsSchema, {
      role: roleToProto(m.role),
    }),
  });
}
