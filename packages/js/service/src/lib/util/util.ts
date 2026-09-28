import { Code, ConnectError } from "@connectrpc/connect";
import type { DescField } from "@bufbuild/protobuf";
import type { FieldMask } from "@bufbuild/protobuf/wkt";

/**
 * Reduces `input` to a URL-safe slug.
 */
export function slugify(input: string, maxLength = 64): string {
  const slug = input
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
  return slug.length <= maxLength
    ? slug
    : slug.slice(0, maxLength).replace(/-+$/, "");
}

/** Returns t, throwing a ConnectError if it is null or undefined. */
export function requireParam<T>(t: T): NonNullable<T> {
  if (t == null) {
    throw new ConnectError("missing required parameter", Code.InvalidArgument);
  }
  return t;
}

/**
 * Parses an update `mask` into a predicate reporting whether a given field is
 * selected for writing. An empty or absent mask means every field is selected;
 * otherwise only the fields explicitly named in the mask are. Mask paths naming
 * unknown fields are ignored.
 */
export function maskSelector(
  mask: FieldMask | undefined,
): (field: DescField) => boolean {
  const paths = mask?.paths ?? [];
  if (paths.length === 0) {
    return () => true; // no mask -> all selected
  }
  const selected = new Set(paths);
  return (field) => selected.has(field.name);
}

/** Returns s if nonempty, or ifEmpty if... empty.  */
export function stringOr(s: string, ifEmpty: string): string {
  const trimmed = s.trim();
  return trimmed === "" ? ifEmpty : trimmed;
}
