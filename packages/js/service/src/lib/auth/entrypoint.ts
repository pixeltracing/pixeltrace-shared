import type { Auth, AuthInstance } from "./create-auth.js";
import { isAuthRouteAllowed } from "./routes.js";

/**
 * The single entrypoint for Better Auth requests: mount it under `/api/auth/*`.
 */
export function handleBetterAuthReq(
  auth: Auth,
  req: Request,
): Promise<Response> {
  if (!isAuthRouteAllowed(new URL(req.url).pathname)) {
    return Promise.resolve(
      Response.json({ error: "route not enabled" }, { status: 403 }),
    );
  }
  return (auth as AuthInstance).handler(req);
}
