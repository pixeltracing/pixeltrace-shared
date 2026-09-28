import { Code, ConnectError, type Interceptor } from "@connectrpc/connect";

/**
 * Server interceptor that logs unexpected errors thrown by a handler (or a
 * downstream interceptor) before ConnectRPC strips their detail.
 *
 * Client-facing errors (e.g. ConnectError with a non-internal code like
 * `PermissionDenied` or `NotFound`) already carry a meaningful code and message
 * to the client, so they are left unlogged to keep the error signal high.
 */
export function errorLogInterceptor(): Interceptor {
  return (next) => async (req) => {
    try {
      return await next(req);
    } catch (err) {
      if (!(err instanceof ConnectError) || err.code === Code.Internal) {
        console.error(
          JSON.stringify({
            msg: "rpc handler error",
            service: req.service.typeName,
            method: req.method.name,
            error: err instanceof Error ? err.message : String(err),
            stack: err instanceof Error ? err.stack : undefined,
          }),
        );
      }
      throw err;
    }
  };
}
