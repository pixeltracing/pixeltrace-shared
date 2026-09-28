// Public entry point for @pixeltrace/schema.

export * from "./gen/pixeltrace/coord/v1/session_pb.js";
export * from "./gen/pixeltrace/coord/v1/upload_pb.js";
export * from "./gen/pixeltrace/data/v1/types_pb.js";
export * from "./gen/pixeltrace/mgmt/v1/membership_pb.js";
export * from "./gen/pixeltrace/mgmt/v1/organization_pb.js";
export * from "./gen/pixeltrace/mgmt/v1/project_pb.js";
export * from "./gen/pixeltrace/mgmt/v1/types_pb.js";
export * from "./gen/pixeltrace/error/v1/error_pb.js";
export * from "./gen/pixeltrace/types/v1/types_pb.js";

// google.rpc.Code backs the `canonical_code` option on every ErrorReason, so
// exporting here for convenience. Renamed because `Code` collides with
// @connectrpc/connect's error code enum.
export {
  Code as RpcCode,
  CodeSchema as RpcCodeSchema,
  file_google_rpc_code,
} from "./gen/google/rpc/code_pb.js";

// Implementable service interfaces derived from the generated descriptors, and
// helpers.
export {
  type ServiceImpl,
  type RegisterHandlerFn,
  type RegisteredService,
  registerService,
} from "./service.js";
