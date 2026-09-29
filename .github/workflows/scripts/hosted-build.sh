#!/usr/bin/env bash
#
# Required env:
#   GH_TOKEN           app token with Actions read+write on the private downstream repo
#   HOSTED_REPO_NAME   owner/name of that private repo (kept out of this public script)
#   SHARED_REF         the shared commit SHA to build against
#   CORRELATION_ID     opaque id, echoed in the run name so we can find our run

# Deliberately no `set -x`: a little paranoia never hurt
set -euo pipefail

: "${GH_TOKEN:?GH_TOKEN is required}"
: "${HOSTED_REPO_NAME:?HOSTED_REPO_NAME is required}"
: "${SHARED_REF:?SHARED_REF is required}"
: "${CORRELATION_ID:?CORRELATION_ID is required}"

repo="${HOSTED_REPO_NAME}"
workflow="downstream-verify.yml"

echo "hosted verify: dispatching downstream build for shared ${SHARED_REF}"
gh api -X POST "repos/${repo}/actions/workflows/${workflow}/dispatches" \
  -f "ref=main" \
  -f "inputs[shared_ref]=${SHARED_REF}" \
  -f "inputs[correlation_id]=${CORRELATION_ID}" >/dev/null

# The dispatch endpoint returns no run id, so locate our run by the correlation
# id we planted.
run_id=""
for _ in $(seq 1 30); do
  sleep 5
  run_id="$(gh api "repos/${repo}/actions/runs?event=workflow_dispatch&per_page=50" \
    --jq "[.workflow_runs[] | select(.name == \"downstream-verify ${CORRELATION_ID}\") | .id] | first // empty")"
  [ -n "${run_id}" ] && break
done
if [ -z "${run_id}" ]; then
  echo "hosted verify: timed out waiting for the dispatched run to appear" >&2
  exit 1
fi

run_url="https://github.com/$repo/actions/runs/${run_id}"
echo "hosted verify: tracking run: ${run_url}"

# Block on gh exit status (non-zero on run failure)
if gh run watch "${run_id}" --repo "${repo}" --interval 15 --exit-status >/dev/null 2>&1; then
  echo "hosted verify: success"
else
  echo "hosted verify: failure — run: ${run_url}" >&2
  exit 1
fi
