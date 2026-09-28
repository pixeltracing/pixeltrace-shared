import { describe, expect, it } from "vitest";
import {
  isMintedId,
  isOrgId,
  isProjectId,
  isSessionId,
  isSiteKeyId,
  isUserId,
  kIdPrefixes,
  newId,
} from "./definitions";

describe("newId", () => {
  it("prefixes known id prefixes", () => {
    expect(newId(kIdPrefixes.org)).toMatch(/^org_[0-9a-hjkmnp-tv-z]{25}$/);
    expect(newId(kIdPrefixes.project)).toMatch(/^proj_/);
    expect(newId(kIdPrefixes.user)).toMatch(/^user_/);
    expect(newId(kIdPrefixes.siteKey)).toMatch(/^pubk_/);
    expect(newId(kIdPrefixes.session)).toMatch(/^sess_/);
  });

  it("returns a bare unique id for unknown prefixes", () => {
    const id = newId("asdf");
    expect(id).toMatch(/^[0-9a-hjkmnp-tv-z]{25}$/);
    expect(id.startsWith("asdf")).toBe(false);
  });

  it("mints distinct ids on each call", () => {
    expect(newId(kIdPrefixes.org)).not.toBe(newId(kIdPrefixes.org));
  });

  it("produces ids that pass their matching type guard", () => {
    expect(isOrgId(newId(kIdPrefixes.org))).toBe(true);
    expect(isProjectId(newId(kIdPrefixes.project))).toBe(true);
    expect(isUserId(newId(kIdPrefixes.user))).toBe(true);
    expect(isSiteKeyId(newId(kIdPrefixes.siteKey))).toBe(true);
    expect(isSessionId(newId(kIdPrefixes.session))).toBe(true);
  });
});

describe("isMintedId", () => {
  it("accepts freshly minted ids of the matching prefix", () => {
    for (const prefix of Object.values(kIdPrefixes)) {
      expect(isMintedId(prefix, newId(prefix))).toBe(true);
    }
  });

  it("rejects a minted id under a different prefix", () => {
    expect(isMintedId(kIdPrefixes.org, newId(kIdPrefixes.session))).toBe(false);
  });

  it("rejects bodies that are not the minted shape", () => {
    for (const bad of [
      "sess_",
      "sess_short",
      "sess_0123456789abcdefghjkmnpqrs", // one char too long
      "sess_UPPERCASE0000000000000",
      `sess_${"ilou".repeat(6)}0`, // lowercase, but outside Crockford base 32
      "sess_../../../evil",
      "nope",
    ]) {
      expect(isMintedId(kIdPrefixes.session, bad)).toBe(false);
    }
  });
});
