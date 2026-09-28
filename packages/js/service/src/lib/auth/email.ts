import { kProductName } from "../constants.js";
import type { EmailMessage } from "./config.js";

/** Minimal recipient shape shared by the account-level emails. */
interface Recipient {
  email: string;
  name?: string;
}

interface Template {
  to: string;
  subject: string;
  greeting: string;
  /** One paragraph explaining why the email was sent. */
  body: string;
  /** Call-to-action label for the link. */
  cta: string;
  url: string;
  /** Optional trailing note (e.g. "ignore this if you didn't request it"). */
  footer?: string;
}

/** Password reset. */
export function renderPasswordReset(
  user: Recipient,
  url: string,
): EmailMessage {
  return compose({
    to: user.email,
    subject: `Reset your ${kProductName} password`,
    greeting: greeting(user),
    body:
      `We received a request to reset your ${kProductName} password. ` +
      "Use the link below to choose a new one.",
    cta: "Reset password",
    url,
    footer: "If you didn't request this, you can safely ignore this email.",
  });
}

/** Email verification. */
export function renderEmailVerification(
  user: Recipient,
  url: string,
): EmailMessage {
  return compose({
    to: user.email,
    subject: `Verify your ${kProductName} email`,
    greeting: greeting(user),
    body: `Confirm this email address to finish setting up your ${kProductName} account.`,
    cta: "Verify email",
    url,
    footer:
      "If you didn't create this account, you can safely ignore this email.",
  });
}

/** Organization invitation. */
export function renderOrgInvitation(input: {
  email: string;
  organizationName: string;
  acceptUrl: string;
}): EmailMessage {
  return compose({
    to: input.email,
    subject: `You've been invited to ${input.organizationName} at ${kProductName}`,
    greeting: "Hello,",
    body: `You've been invited to join ${input.organizationName} at ${kProductName}.`,
    cta: "Accept invitation",
    url: input.acceptUrl,
  });
}

/** Renders a Template into matching HTML and plaintext bodies. */
function compose(t: Template): EmailMessage {
  const textLines = [t.greeting, "", t.body, "", t.url];
  const htmlParts = [
    `<p>${escapeHtml(t.greeting)}</p>`,
    `<p>${escapeHtml(t.body)}</p>`,
    `<p><a href="${escapeHtml(t.url)}">${escapeHtml(t.cta)}</a></p>`,
  ];
  if (t.footer) {
    textLines.push("", t.footer);
    htmlParts.push(`<p>${escapeHtml(t.footer)}</p>`);
  }
  return {
    // `to` and `subject` become email headers, so strip anything that could
    // inject additional headers (e.g. an org name containing cr/lf).
    to: sanitizeHeader(t.to),
    subject: sanitizeHeader(t.subject),
    text: textLines.join("\n"),
    html: htmlParts.join("\n"),
  };
}

/** Greeting that falls back gracefully when we don't have the user's name. */
function greeting(user: Recipient): string {
  return user.name ? `Hi ${user.name},` : "Hello,";
}

/** Escapes text for safe interpolation into HTML element and attribute content. */
function escapeHtml(s: string): string {
  return s
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

/** Strips CR/LF and other control characters from text that will end up in headers. */
function sanitizeHeader(s: string): string {
  let out = "";
  for (const ch of s) {
    const code = ch.codePointAt(0) ?? 0;
    out += code < 0x20 || code === 0x7f ? " " : ch;
  }
  return out.replace(/ {2,}/g, " ").trim();
}
