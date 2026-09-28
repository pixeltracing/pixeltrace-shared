import { create } from "@bufbuild/protobuf";
import {
  OrganizationIdSchema,
  OrganizationPropsSchema,
  OrganizationSchema,
  type Organization as ProtoOrganization,
} from "@pixeltrace/schema";
import type { Organization } from "../types/types";

export function orgToProto(org: Organization): ProtoOrganization {
  return create(OrganizationSchema, {
    id: create(OrganizationIdSchema, { id: org.id }),
    props: create(OrganizationPropsSchema, {
      name: org.name,
    }),
  });
}
