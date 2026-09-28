# @pixeltrace/schema

TypeScript definitions for the Pixeltrace protobuf schema.

Homepage: [pixeltrace.dev](https://pixeltrace.dev/)

These bindings are generated from the canonical `.proto` definitions in
[`/proto`](../../../proto) using [protobuf-es](https://github.com/bufbuild/protobuf-es).

## Usage

```ts
import { create, toBinary, fromBinary } from "@bufbuild/protobuf";
import { ConnectRequestSchema, type ConnectRequest } from "@pixeltrace/schema";

const req: ConnectRequest = create(ConnectRequestSchema, {
  siteKey: { key: "site_abc" },
  sdpOffer: { sdp: "v=0..." },
});

const bytes = toBinary(ConnectRequestSchema, req);
const decoded = fromBinary(ConnectRequestSchema, bytes);
```

## Development

The generated sources (`src/gen`) and build output (`dist`) are not committed.
Regenerate and build them from the proto source:

```sh
pnpm install
pnpm run build      # generate + tsc
pnpm run generate   # regenerate src/gen only
pnpm run typecheck  # type-check without emitting
```

`prepack` runs a clean build, so `pnpm pack` / `npm publish` always ship freshly
generated output.
