import type { BetterAuthOptions } from "better-auth";

/** The deployment-specific configuration for the auth server. */
export interface AuthConfig {
  /** Primary database, e.g. postgres. */
  database: NonNullable<BetterAuthOptions["database"]>;
  /** Optional KV-style secondary storage for sessions/verification. */
  secondaryStorage?: BetterAuthOptions["secondaryStorage"];
  /** Signing secret (`BETTER_AUTH_SECRET`). */
  secret?: string;
  /** Public base URL of the auth server, e.g. `https://api.pixeltrace.dev`. */
  baseURL?: string;
  /** Public base URL of the frontend, e.g. `https://app.pixeltrace.dev`. */
  frontendURL?: string;
  /** Origins permitted to call the auth endpoints. */
  trustedOrigins?: string[];
  /** If non-null, the domain for cross-subdomain cookies, e.g. `.domain.com`. */
  sharedDomain?: string;
  /**
   * Social login providers keyed by provider id carrying OAuth
   * `clientId`/`clientSecret`.
   */
  socialProviders?: BetterAuthOptions["socialProviders"];
  /**
   * How required auth emails (password reset, verification, org invitations)
   * are delivered.
   */
  sendEmail?: EmailSender;
}

/** A fully-rendered outbound email. */
export interface EmailMessage {
  /** Recipient address. */
  to: string;
  /** Subject. */
  subject: string;
  /** HTML body. */
  html: string;
  /** Plaintext (fallback) body. */
  text: string;
}

/** Receives a fully-composed message and delivers it. */
export type EmailSender = (message: EmailMessage) => Promise<void>;
