/**
 * Shared pagination primitives for list endpoints. The wire contract mirrors
 * the proto `PageRequest`/`PageResponse`: an opaque `pageToken` cursor plus a
 * caller-hinted `pageSize`. Cursors are store-defined and opaque to callers.
 */

import { Code, ConnectError } from "@connectrpc/connect";
import type { PageRequest } from "@pixeltrace/schema";

/** Default items-per-page when a request doesn't specify (or asks for 0). */
export const kDefaultPageSize = 50;

/** Hard cap on items-per-page, so a caller can't request an unbounded page. */
export const kMaxPageSize = 100;

/** Pagination parameters for a list request. */
export interface PageParams {
  /** Maximum number of items to return; the store may return fewer. Zero or
   * omitted lets the store choose a default page size. */
  pageSize?: number;
  /** Opaque cursor from a prior page's `nextPageToken`. Omit for the first
   * page. */
  pageToken?: string;
}

/** A single page of list results plus the cursor for the following page. */
export interface Page<T> {
  /** The items in this page. May be empty. */
  items: T[];
  /** Cursor to pass as `pageToken` to fetch the next page; undefined once the
   * last page has been returned. */
  nextPageToken?: string;
}

/** Thrown by {@link decodeCursor} when a page token is present but malformed. */
export class InvalidCursorError extends Error {
  constructor(token: string) {
    super(`invalid page token: ${token}`);
    this.name = "InvalidCursorError";
  }
}

/** Reads a request's proto `PageRequest` as the domain's {@link PageParams}. */
export function pageParams(page: PageRequest | undefined): PageParams {
  // An empty token is proto's default for "unset", i.e. the first page.
  return { pageSize: page?.pageSize, pageToken: page?.pageToken || undefined };
}

/**
 * Resolves the effective page size for a request: the caller's `pageSize`
 * clamped to `[1, max]`, or `fallback` when unset/non-positive.
 */
export function resolvePageSize(
  params: PageParams,
  {
    fallback = kDefaultPageSize,
    max = kMaxPageSize,
  }: {
    fallback?: number;
    max?: number;
  } = {},
): number {
  const requested = params.pageSize;
  if (!requested || requested <= 0) {
    return Math.min(fallback, max);
  }
  return Math.min(requested, max);
}

/**
 * Runs a store's paginated `list` on behalf of a service handler: the caller's
 * page size is resolved (clamped to `[1, kMaxPageSize]`) before it reaches the
 * store. A store signals a bad token by throwing {@link InvalidCursorError},
 * which is then surfaced as a proper connect rpc error.
 */
export async function listPage<T>(
  params: PageParams,
  list: (page: PageParams) => Promise<Page<T>>,
): Promise<Page<T>> {
  const page: PageParams = {
    pageSize: resolvePageSize(params),
    pageToken: params.pageToken,
  };
  try {
    return await list(page);
  } catch (err) {
    if (err instanceof InvalidCursorError) {
      throw new ConnectError(err.message, Code.InvalidArgument);
    }
    throw err;
  }
}

/**
 * Splits a keyset query's rows into one page plus the token for the next one.
 * The query asks for `size + 1` rows, so the row past the page is what proves a
 * further page exists without a second count query; `cursorOf` turns the last
 * row of the page into the boundary the next query resumes from, and may return
 * undefined for a row that cannot be a boundary.
 *
 * `whenExhausted` is the token payload to fall back on once the rows run out —
 * for scans that can come up short of a full page with ground still to cover,
 * and so still owe the caller somewhere to resume.
 */
export function keysetPage<T>(
  rows: readonly T[],
  size: number,
  cursorOf: (last: T) => unknown,
  whenExhausted?: unknown,
): Page<T> {
  const hasMore = rows.length > size;
  const items = rows.slice(0, size);
  const last = items[items.length - 1];
  const cursor = hasMore && last !== undefined ? cursorOf(last) : whenExhausted;
  return {
    items,
    nextPageToken: cursor === undefined ? undefined : encodeCursor(cursor),
  };
}

/** Encodes a store's cursor payload as an opaque, URL-safe page token. */
export function encodeCursor(payload: unknown): string {
  return base64UrlEncode(JSON.stringify(payload));
}

/**
 * Decodes a page token produced by {@link encodeCursor}. Returns undefined for
 * an absent or empty token (the first page), and throws
 * {@link InvalidCursorError} for a present-but-malformed one.
 */
export function decodeCursor<T>(token: string | undefined): T | undefined {
  if (!token) {
    return undefined;
  }
  try {
    return JSON.parse(base64UrlDecode(token)) as T;
  } catch {
    throw new InvalidCursorError(token);
  }
}

// Base64url so tokens survive query strings and headers without escaping.
function base64UrlEncode(value: string): string {
  const b64 = btoa(unescape(encodeURIComponent(value)));
  return b64.replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}

function base64UrlDecode(token: string): string {
  const b64 = token.replace(/-/g, "+").replace(/_/g, "/");
  return decodeURIComponent(escape(atob(b64)));
}
