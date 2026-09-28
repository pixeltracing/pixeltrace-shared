import { memoryAdapter, type MemoryDB } from "better-auth/adapters/memory";
import { beforeEach, describe, expect, it } from "vitest";
import { createAuth } from "./create-auth.js";

let db: MemoryDB;

function newAuth() {
  return createAuth({
    database: memoryAdapter(db),
    secret: "test-secret-value-that-is-at-least-32-chars",
    baseURL: "http://localhost:3000",
  });
}

async function signUp(email: string, name: string) {
  await newAuth().api.signUpEmail({
    body: { email, name, password: "abcd1234" },
  });
}

async function signIn(email: string) {
  await newAuth().api.signInEmail({ body: { email, password: "abcd1234" } });
}

/** Returns rows of the given table. */
function rows(model: string): Record<string, unknown>[] {
  return db[model] ?? [];
}

/** The row at `index` of a table. */
function row(model: string, index = 0): Record<string, unknown> {
  const r = rows(model)[index];
  if (!r) {
    throw new Error(`expected ${model}[${index}] to exist`);
  }
  return r;
}

beforeEach(() => {
  db = {
    user: [],
    session: [],
    account: [],
    verification: [],
    organization: [],
    member: [],
    invitation: [],
    rateLimit: [],
  };
});

describe("personal org provisioning on signup", () => {
  it("gives a new user an owner-membership personal org", async () => {
    await signUp("New.User@example.com", "New User");

    expect(rows("organization")).toHaveLength(1);
    const org = row("organization");
    expect(org.id).toMatch(/^org_/);
    expect(org.name).toBe("My Org");
    expect(org.slug).toMatch(/^personal-/);

    expect(rows("member")).toHaveLength(1);
    const member = row("member");
    expect(member.organizationId).toBe(org.id);
    expect(member.userId).toBe(row("user").id);
    expect(member.role).toBe("owner");
    expect(row("user").personalOrgId).toBe(org.id);
  });

  it("makes the personal org the session's active org", async () => {
    await signUp("solo@example.com", "Solo Dev");

    expect(rows("session")).toHaveLength(1);
    expect(row("session").activeOrganizationId).toBe(row("organization").id);
  });

  it("does not create a second org on a later login", async () => {
    await signUp("repeat@example.com", "Repeat Visitor");
    await signIn("repeat@example.com");

    expect(rows("organization")).toHaveLength(1);
    expect(rows("member")).toHaveLength(1);
    expect(rows("session")).toHaveLength(2);
    expect(row("session", 0).activeOrganizationId).toBe(
      row("session", 1).activeOrganizationId,
    );
    expect(row("user").personalOrgId).toBe(row("organization").id);
  });

  it("gives each user's personal org a unique slug", async () => {
    await signUp("a@example.com", "Alice");
    await signUp("b@example.com", "Bob");

    expect(rows("organization")).toHaveLength(2);
    expect(row("organization", 0).name).toBe(row("organization", 1).name);
    expect(row("organization", 0).slug).not.toBe(row("organization", 1).slug);
  });

  it("provisions the user's own personal org, not another org they belong to", async () => {
    await signUp("owner@example.com", "Team Owner");
    const teamOrgId = row("organization").id;

    // Set up a user whose only membership is someone else's org and who has no
    // personal org yet e.g. a user provisioned before `personalOrgId` existed,
    // or one who joined a team by invitation.
    await signUp("member@example.com", "Team Member");
    const member = rows("user").find((u) => u.email === "member@example.com")!;
    const orgs = rows("organization");
    orgs.splice(
      orgs.findIndex((o) => o.id === member.personalOrgId),
      1,
    );
    const members = rows("member");
    members.splice(
      members.findIndex((m) => m.userId === member.id),
      1,
    );
    member.personalOrgId = null;
    members.push({
      id: "member_seed",
      organizationId: teamOrgId,
      userId: member.id,
      role: "member",
      createdAt: new Date(),
    });

    // Sign in - the provision should have given them a personal org.
    await signIn("member@example.com");
    const after = rows("user").find((u) => u.email === "member@example.com")!;
    expect(after.personalOrgId).toBeTruthy();
    expect(after.personalOrgId).not.toBe(teamOrgId);

    const personalOrg = rows("organization").find(
      (o) => o.id === after.personalOrgId,
    );
    expect(personalOrg?.slug).toMatch(/^personal-/);

    const ownerRow = rows("member").find(
      (m) => m.userId === after.id && m.organizationId === after.personalOrgId,
    );
    expect(ownerRow?.role).toBe("owner");
  });
});
