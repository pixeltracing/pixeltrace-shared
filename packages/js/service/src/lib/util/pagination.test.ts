import { Code, ConnectError } from "@connectrpc/connect";
import { describe, expect, it } from "vitest";
import {
  decodeCursor,
  encodeCursor,
  InvalidCursorError,
  kDefaultPageSize,
  keysetPage,
  kMaxPageSize,
  listPage,
  resolvePageSize,
  type Page,
  type PageParams,
} from "./pagination.js";

describe("resolvePageSize", () => {
  it("falls back to the default for an unset or non-positive size", () => {
    expect(resolvePageSize({})).toBe(kDefaultPageSize);
    expect(resolvePageSize({ pageSize: 0 })).toBe(kDefaultPageSize);
    expect(resolvePageSize({ pageSize: -5 })).toBe(kDefaultPageSize);
  });

  it("caps a size above the maximum", () => {
    expect(resolvePageSize({ pageSize: kMaxPageSize + 1 })).toBe(kMaxPageSize);
    expect(resolvePageSize({ pageSize: 10_000 })).toBe(kMaxPageSize);
  });

  it("honors a size within range", () => {
    expect(resolvePageSize({ pageSize: 7 })).toBe(7);
  });

  it("respects caller-supplied bounds", () => {
    expect(resolvePageSize({}, { fallback: 3, max: 10 })).toBe(3);
    expect(resolvePageSize({ pageSize: 50 }, { max: 10 })).toBe(10);
  });
});

describe("cursors", () => {
  it("round-trips a payload", () => {
    const payload = { createdAt: "2026-07-13T00:00:00.000Z", id: "proj_1" };
    expect(decodeCursor(encodeCursor(payload))).toEqual(payload);
  });

  it("reads an absent or empty token as the first page", () => {
    expect(decodeCursor(undefined)).toBeUndefined();
    expect(decodeCursor("")).toBeUndefined();
  });

  it("rejects a malformed token", () => {
    expect(() => decodeCursor("!!!not-a-cursor")).toThrow(InvalidCursorError);
  });
});

describe("keysetPage", () => {
  const rows = [{ id: "a" }, { id: "b" }, { id: "c" }];
  const cursorOf = (row: { id: string }) => ({ id: row.id });

  it("trims the lookahead row and resumes from the last row it kept", () => {
    const page = keysetPage(rows, 2, cursorOf);
    expect(page.items).toEqual([{ id: "a" }, { id: "b" }]);
    expect(decodeCursor(page.nextPageToken)).toEqual({ id: "b" });
  });

  it("ends the listing when the rows stop short of the lookahead", () => {
    expect(keysetPage(rows, 3, cursorOf).items).toEqual(rows);
    expect(keysetPage(rows, 3, cursorOf).nextPageToken).toBeUndefined();
    expect(keysetPage([], 3, cursorOf)).toEqual({
      items: [],
      nextPageToken: undefined,
    });
  });

  it("ends the listing for a last row that cannot be a boundary", () => {
    expect(keysetPage(rows, 2, () => undefined).nextPageToken).toBeUndefined();
  });

  it("falls back to the exhausted-scan token only once the rows run out", () => {
    const resume = { id: "z" };
    expect(
      decodeCursor(keysetPage(rows, 3, cursorOf, resume).nextPageToken),
    ).toEqual(resume);
    expect(
      decodeCursor(keysetPage(rows, 2, cursorOf, resume).nextPageToken),
    ).toEqual({ id: "b" });
  });
});

describe("listPage", () => {
  const emptyPage: Page<string> = { items: [] };

  it("resolves the page size before the store sees it", async () => {
    const seen: PageParams[] = [];
    const list = (page: PageParams) => {
      seen.push(page);
      return Promise.resolve(emptyPage);
    };

    await listPage({ pageSize: -5 }, list);
    await listPage({ pageSize: kMaxPageSize + 1 }, list);
    await listPage({ pageSize: 10, pageToken: "tok" }, list);

    expect(seen).toEqual([
      { pageSize: kDefaultPageSize, pageToken: undefined },
      { pageSize: kMaxPageSize, pageToken: undefined },
      { pageSize: 10, pageToken: "tok" },
    ]);
  });

  it("reports a malformed page token as invalid-argument", async () => {
    // Stands in for a store, which decodes the caller's token as its first act.
    const list = (page: PageParams) => {
      decodeCursor(page.pageToken);
      return Promise.resolve(emptyPage);
    };

    const err = await listPage({ pageToken: "!!!" }, list).catch(
      (e: unknown) => e,
    );
    expect(err).toBeInstanceOf(ConnectError);
    expect(err).toMatchObject({ code: Code.InvalidArgument });
  });

  it("passes any other store failure through untouched", async () => {
    const boom = new Error("store is down");
    await expect(listPage({}, () => Promise.reject(boom))).rejects.toBe(boom);
  });
});
