import { Code, ConnectError, type UnaryRequest } from "@connectrpc/connect";
import { afterEach, describe, expect, it, vi } from "vitest";
import { errorLogInterceptor } from "./error-log-interceptor.js";

// A minimal request stand-in; the interceptor only reads service/method names.
const kReq = {
  service: { typeName: "pixeltrace.mgmt.v1.ProjectService" },
  method: { name: "CreateProject" },
} as unknown as UnaryRequest;

function runWith(err: unknown) {
  const interceptor = errorLogInterceptor();
  const next = vi.fn().mockRejectedValue(err);
  return interceptor(next)(kReq);
}

afterEach(() => {
  vi.restoreAllMocks();
});

describe("errorLogInterceptor", () => {
  it("logs and rethrows an unexpected (non-Connect) error", async () => {
    const spy = vi.spyOn(console, "error").mockImplementation(() => {});
    const boom = new Error("cannot provision managed storage");

    await expect(runWith(boom)).rejects.toBe(boom);
    expect(spy).toHaveBeenCalledOnce();
    const logged = JSON.parse(spy.mock.calls[0]?.[0] as string);
    expect(logged).toMatchObject({
      service: "pixeltrace.mgmt.v1.ProjectService",
      method: "CreateProject",
      error: "cannot provision managed storage",
    });
  });

  it("logs a ConnectError carrying the internal code", async () => {
    const spy = vi.spyOn(console, "error").mockImplementation(() => {});
    const err = new ConnectError("misconfigured", Code.Internal);

    await expect(runWith(err)).rejects.toBe(err);
    expect(spy).toHaveBeenCalledOnce();
  });

  it("stays quiet for expected business errors", async () => {
    const spy = vi.spyOn(console, "error").mockImplementation(() => {});
    const denied = new ConnectError("nope", Code.PermissionDenied);

    await expect(runWith(denied)).rejects.toBe(denied);
    expect(spy).not.toHaveBeenCalled();
  });

  it("passes through a successful call without logging", async () => {
    const spy = vi.spyOn(console, "error").mockImplementation(() => {});
    const interceptor = errorLogInterceptor();
    const res = { stream: false } as unknown;
    const next = vi.fn().mockResolvedValue(res);

    await expect(interceptor(next)(kReq)).resolves.toBe(res);
    expect(spy).not.toHaveBeenCalled();
  });
});
