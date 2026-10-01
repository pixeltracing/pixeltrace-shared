#!/usr/bin/env bash
#
# Regenerates the Dart protobuf bindings under lib/ from the shared proto
# module.
#

set -euo pipefail
cd "$(dirname "$0")"

dart pub get
rm -rf lib/google lib/pixeltrace
buf generate --include-imports ../../../proto

# The generated code imports a library `as connect` for its runtime import. We
# have a 'Connect' proto method, which the Dart generator emits as a binding
# named `connect`. The two names conflict and won't compile, so rename the
# import to `connectlib` and update its usage sites.
find lib -name '*.connect.*.dart' -exec sed -i \
  -e 's|" as connect;|" as connectlib;|' \
  -e 's/\bconnect\.\([A-Z]\)/connectlib.\1/g' {} +

dart format lib > /dev/null
echo "generate.sh: done."
