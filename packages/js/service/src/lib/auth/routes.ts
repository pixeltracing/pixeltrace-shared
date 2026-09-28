/**
 * Access policy for the Better Auth routes a backend mounts under
 * `/api/auth/*`.
 *
 * We layer our own RBAC on top of Better Auth; most routes are therefore
 * disallowed, to ensure auth-related actions go through the front door (our
 * handlers).
 */

const kUrlPrefix = "/api/auth";

/**
 * Routes allowed to reach the Better Auth handler: the normal sign-up, sign-in,
 * and account-recovery (password reset, email verification) flows. Paths are
 * relative to {@link kUrlPrefix}.
 */
const kAllowedRoutes: ReadonlySet<string> = new Set<string>([
  "/sign-up/email",
  "/sign-in/email",
  "/sign-in/social",
  "/sign-out", // logout
  "/get-session",
  "/request-password-reset",
  "/forget-password",
  "/reset-password",
  "/send-verification-email",
  "/verify-email",
  "/error",
]);

/**
 * Allowed route subtrees, each taking exactly one dynamic segment:
 *   - `/reset-password/<token>`: the GET link in a password-reset email.
 *   - `/callback/<provider>`: where an OAuth provider redirects after social
 *     sign-in (e.g. `/callback/github`).
 * Each keeps a trailing slash so it can't match a sibling like
 * `/reset-password-foo`.
 */
const kAllowedRoutePrefixes: readonly string[] = [
  "/reset-password/",
  "/callback/",
];

/**
 * Whether a request may reach the Better Auth handler.
 */
export function isAuthRouteAllowed(pathname: string): boolean {
  const path = normalizePath(pathname);
  if (!path.startsWith(`${kUrlPrefix}/`)) {
    // Not a Better Auth route
    return false;
  }

  const route = path.slice(kUrlPrefix.length);
  if (kAllowedRoutes.has(route)) {
    return true;
  }
  const prefix = kAllowedRoutePrefixes.find((p) => route.startsWith(p));
  if (!prefix) {
    return false;
  }
  return isLiteralSegment(route.slice(prefix.length));
}

/**
 * Whether `segment` is a single path segment that means exactly what it says,
 * i.e. encode/decode changes nothing. This means e.g. the segment cannot have
 * any percent-escapes (`%` would encode to `%25`) or separators (`/` would
 * encode to `%2F`).
 *
 * That is what denies route-escapes like `/callback/%2e%2e/organization/create`
 */
function isLiteralSegment(segment: string): boolean {
  return segment.length > 0 && encodeURIComponent(segment) === segment;
}

/**
 * Normalizes `pathname` via a URL parser.
 */
function normalizePath(pathname: string): string {
  try {
    // A fixed base makes this a pure path computation: an absolute-path input
    // resolves against it, and an input that is itself a URL keeps its own path.
    return new URL(pathname, "http://auth.invalid").pathname;
  } catch {
    return "";
  }
}
