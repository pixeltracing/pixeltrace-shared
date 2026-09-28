import { toProjectId, toProjectTagId, toSessionId } from "@pixeltrace/authz";
import { describe, expect, it } from "vitest";
import type { Session } from "../types/types";
import { sessionToProto } from "./protoconv";

function session(overrides: Partial<Session> = {}): Session {
  return {
    id: toSessionId("sess_01HZY000000000000000000000"),
    projectId: toProjectId("proj_01HZY000000000000000000000"),
    status: "READY",
    liveTransport: "sfu",
    startedAt: new Date(1000),
    endedAt: new Date(5000),
    durationMs: 4000,
    sizeBytes: 2048,
    referrer: "",
    country: "",
    browser: "",
    os: "",
    deviceType: "",
    userAgent: "",
    clientTcpRtt: null,
    deletedAt: null,
    seen: false,
    tagIds: [],
    activity: null,
    ...overrides,
  };
}

const kAlpha = toProjectTagId("tag_01hzy000000000000000000a0");
const kBlue = toProjectTagId("tag_01hzy000000000000000000b0");

describe("sessionToProto", () => {
  it("carries each applied tag as a ProjectTagId rather than a bare string", () => {
    const proto = sessionToProto(session({ tagIds: [kAlpha, kBlue] }));

    expect(proto.props?.tagIds).toEqual([
      expect.objectContaining({ id: kAlpha }),
      expect.objectContaining({ id: kBlue }),
    ]);
  });

  it("emits no tags for an untagged session", () => {
    expect(sessionToProto(session()).props?.tagIds).toEqual([]);
  });
});
