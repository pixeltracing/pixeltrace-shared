import { getMigrations } from "better-auth/db/migration";
import { runMembershipServiceTests } from "./membership-service-contract";
import { runOrgServiceTests } from "./org-service-contract";
import { createAuth, type Auth } from "../lib/auth/create-auth";
import { DatabaseSync } from "node:sqlite";

async function createSqliteAuth(): Promise<Auth> {
  const auth = createAuth({
    database: new DatabaseSync(":memory:"),
    secret: "test-secret-value-that-is-at-least-32-chars",
    baseURL: "http://localhost:3000",
  });
  const { runMigrations } = await getMigrations(auth.options);
  await runMigrations();
  return auth;
}

runOrgServiceTests("in-memory reference impl", () => createSqliteAuth());

runMembershipServiceTests("in-memory reference impl", () => createSqliteAuth());
