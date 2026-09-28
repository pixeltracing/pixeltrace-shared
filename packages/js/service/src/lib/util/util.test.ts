import { describe, expect, it } from "vitest";
import { slugify } from "./util.js";

describe("slugify", () => {
  it("lowercases and hyphenates runs of non-alphanumerics", () => {
    expect(slugify("New User")).toBe("new-user");
    expect(slugify("Acme, Inc.")).toBe("acme-inc");
    expect(slugify("a  --  b")).toBe("a-b");
  });

  it("trims leading and trailing hyphens", () => {
    expect(slugify("  hello!  ")).toBe("hello");
    expect(slugify("***x***")).toBe("x");
  });

  it("truncates to maxLength without leaving a trailing hyphen", () => {
    expect(slugify("abcdefghij", 5)).toBe("abcde");
    // The cut lands on a hyphen, which is trimmed away.
    expect(slugify("ab cd ef", 3)).toBe("ab");
  });
});
