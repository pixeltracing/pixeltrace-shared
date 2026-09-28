# @pixeltrace/authz

TypeScript definitions for the Pixeltrace authz surface.

Homepage: [pixeltrace.dev](https://pixeltrace.dev/)

These are hand-authored TypeScript definitions describing the Pixeltrace
authorization model (roles, permissions, and scopes) shared across services.

## Usage

```ts
import type {} from "@pixeltrace/authz";
```

## Development

The build output (`dist`) is not committed. Build it from the TypeScript
sources in `src`:

```sh
pnpm install
pnpm run build      # tsc
pnpm run typecheck  # type-check without emitting
```

`prepack` runs a clean build, so `pnpm pack` / `npm publish` always ship freshly
compiled output.
