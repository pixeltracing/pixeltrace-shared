import {
  betterAuth,
  getCurrentAdapter,
  type BetterAuthOptions,
  type DBTransactionAdapter,
  type ModelNames,
  type User,
} from "better-auth";
import { organization } from "better-auth/plugins";
import { createAccessControl } from "better-auth/plugins/access";
import {
  adminAc,
  defaultStatements,
  memberAc,
  ownerAc,
} from "better-auth/plugins/organization/access";
import { kIdPrefixes, newId } from "@pixeltrace/authz";
import { type AuthConfig } from "./config.js";
import {
  renderEmailVerification,
  renderOrgInvitation,
  renderPasswordReset,
} from "./email.js";
import { FrontendRoutes, kProductName } from "../constants.js";
import { slugify } from "../util/util.js";

// Better Auth's organization plugin only ships the roles owner/admin/member, so
// we need to register the additional roles defined by `@pixeltrace/authz`
// (currently just `viewer`).
const orgAccessControl = createAccessControl(defaultStatements);
const viewerAc = orgAccessControl.newRole({
  organization: [],
  member: [],
  invitation: [],
  team: [],
  ac: [],
});
const orgRoles = {
  owner: ownerAc,
  admin: adminAc,
  member: memberAc,
  viewer: viewerAc,
};

function generateId(model: ModelNames): string {
  // Some models must conform to a specific prefix for authz; the rest get a
  // bare unique id.
  switch (model) {
    case "user":
      return newId(kIdPrefixes.user);
    case "organization":
      return newId(kIdPrefixes.org);
    default:
      return newId("");
  }
}

/**
 * Builds the Pixeltrace Better Auth server.
 */
export function createAuth(config: AuthConfig): Auth {
  return buildAuth(config);
}

function buildAuth(config: AuthConfig) {
  const { sendEmail, frontendURL } = config;
  const emailEnabled = sendEmail !== undefined;
  return betterAuth({
    appName: kProductName,
    database: config.database,
    secondaryStorage: config.secondaryStorage,
    secret: config.secret,
    baseURL: config.baseURL,
    trustedOrigins: config.trustedOrigins,
    emailAndPassword: {
      enabled: true,
      requireEmailVerification: emailEnabled,
      sendResetPassword: emailEnabled
        ? ({ user, url }) => sendEmail(renderPasswordReset(user, url))
        : undefined,
    },
    user: {
      additionalFields: {
        // The id of the user's personal organization.
        personalOrgId: {
          type: "string",
          required: false,
          input: false, // clients cannot set this
        },
      },
    },
    emailVerification: emailEnabled
      ? {
          autoSignInAfterVerification: true,
          expiresIn: 10 * 60, // 10 minutes
          sendVerificationEmail: ({ user, url }) =>
            sendEmail(
              renderEmailVerification(
                user,
                withFrontendCallback(url, frontendURL),
              ),
            ),
        }
      : undefined,
    socialProviders: config.socialProviders,
    rateLimit: { storage: "database" },
    databaseHooks: {
      session: {
        create: { before: runPreLoginHooks },
      },
    },
    advanced: {
      database: {
        generateId: ({ model }) => generateId(model),
      },
      crossSubDomainCookies: {
        enabled: config.sharedDomain !== undefined,
        domain: config.sharedDomain,
      },
    },
    plugins: [
      organization({
        ac: orgAccessControl,
        roles: orgRoles,
        requireEmailVerificationOnInvitation: emailEnabled,
        sendInvitationEmail: emailEnabled
          ? ({ email, organization, id }) =>
              sendEmail(
                renderOrgInvitation({
                  email,
                  organizationName: organization.name,
                  acceptUrl: acceptInvitationUrl(frontendURL, id),
                }),
              )
          : undefined,
      }),
    ],
  });
}

/**
 * Point the callback param of the given Better Auth verification url at the
 * frontend's email-verify route. Better Auth redirects there after success and,
 * on failure, appends `?error=<code>`, so the route can surface both outcomes.
 * Left untouched when no frontend URL is configured (e.g. local dev).
 */
function withFrontendCallback(
  url: string,
  frontendURL: string | undefined,
): string {
  if (!frontendURL) {
    return url;
  }
  const verifyUrl = new URL(url);
  verifyUrl.searchParams.set(
    "callbackURL",
    new URL(FrontendRoutes.EmailVerify, frontendURL).toString(),
  );
  return verifyUrl.toString();
}

function acceptInvitationUrl(
  frontendURL: string | undefined,
  invitationId: string,
): string {
  const path = `${FrontendRoutes.AcceptInvitation}/${invitationId}`;
  return frontendURL ? new URL(path, frontendURL).toString() : path;
}

// Better Auth's base `User` type doesn't know about our `personalOrgId`
// additional field, so we widen it where we read/write that column.
type UserWithPersonalOrg = User & { personalOrgId?: string | null };

/** The slug of `userId`'s personal org. Deterministic from the user id so that
 * requests with respect to a user's personal org are idempotent. */
function personalOrgSlug(userId: string): string {
  return slugify(`personal-${userId}`);
}

/**
 * Ensures `user` owns a personal organization and that its id is recorded on
 * the user's `personalOrgId`. Returns the org id. `adapter` should be part of a
 * transaction. Idempotent.
 */
async function ensurePersonalOrg(
  adapter: DBTransactionAdapter,
  user: UserWithPersonalOrg,
): Promise<string> {
  if (user.personalOrgId) {
    return user.personalOrgId;
  }

  // Two logins for the same user can reach this point concurrently, each having
  // read a null personalOrgId. Both then try to create, and the unique index on
  // the derived slug settles it: the loser adopts the winner's org rather than
  // minting a second one. Both go on to write the same id to the user row, so
  // the racing updates arrive at the same result.
  const slug = personalOrgSlug(user.id);
  const created = await createPersonalOrg(adapter, user, slug);
  const orgId = created ?? (await findOrgIdBySlug(adapter, slug));
  if (!orgId) {
    throw new Error(`could not create or find personal org for ${user.id}`);
  }

  await adapter.update({
    model: "user",
    where: [{ field: "id", value: user.id }],
    update: { personalOrgId: orgId },
  });
  return orgId;
}

/**
 * Creates the personal organization owned by `user`, returning its id, or
 * undefined if the slug is already taken.
 */
async function createPersonalOrg(
  adapter: DBTransactionAdapter,
  user: User,
  slug: string,
): Promise<string | undefined> {
  const now = new Date();
  let org;
  try {
    org = await adapter.create<{ id: string }>({
      model: "organization",
      data: { name: "My Org", slug, createdAt: now },
    });
  } catch {
    // Taken
    return undefined;
  }

  await adapter.create({
    model: "member",
    data: {
      organizationId: org.id,
      userId: user.id,
      role: "owner",
      createdAt: now,
    },
  });
  return org.id;
}

/** Looks up an org id by slug. */
async function findOrgIdBySlug(
  adapter: DBTransactionAdapter,
  slug: string,
): Promise<string | undefined> {
  const org = await adapter.findOne<{ id: string }>({
    model: "organization",
    where: [{ field: "slug", value: slug }],
  });
  return org?.id;
}

/**
 * Better Auth's `session.create.before` hook runs just before a session is
 * established (i.e. before login/signup completes). Calls made here must be
 * idempotent.
 */
const runPreLoginHooks: NonNullable<
  NonNullable<
    NonNullable<BetterAuthOptions["databaseHooks"]>["session"]
  >["create"]
>["before"] = async (session, ctx) => {
  if (!ctx || session.activeOrganizationId) {
    return;
  }

  const adapter = await getCurrentAdapter(ctx.context.adapter);
  const user = await adapter.findOne<UserWithPersonalOrg>({
    model: "user",
    where: [{ field: "id", value: session.userId }],
  });
  if (!user) {
    return;
  }

  const activeOrganizationId = await ensurePersonalOrg(adapter, user);
  return { data: { ...session, activeOrganizationId } };
};

/**
 * The Better Auth server as everything outside this package sees it: the full
 * instance minus its raw `handler`. Hiding the handler means a backend has no
 * way to mount Better Auth except through `handleBetterAuthReq`, which is what
 * enforces the route allowlist.
 */
export type Auth = Omit<AuthInstance, "handler">;

/** The full instance, handler included. Package-internal: only the Better Auth
 * entrypoint may reach the handler. */
export type AuthInstance = ReturnType<typeof buildAuth>;
