#!/usr/bin/env bash
#
# Regenerates the Go protobuf bindings under ./gen from the shared proto module.
#

set -euo pipefail
cd "$(dirname "$0")"

rm -rf gen
buf generate --include-imports ../../../proto
go mod tidy
echo "generate.sh: done."
