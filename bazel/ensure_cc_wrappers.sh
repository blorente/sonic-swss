#!/bin/bash
# Migrates native cc_library, cc_binary, and cc_test to use wrappers from //bazel:cc_wrappers.bzl.
#
# Usage: ./bazel/migrate_cc_wrappers.sh

set -euo pipefail

bazel run @buildozer -- -f - <<'EOF'
replace_load //bazel:cc_wrappers.bzl cc_library|//...:%cc_library
replace_load //bazel:cc_wrappers.bzl cc_binary|//...:%cc_binary
replace_load //bazel:cc_wrappers.bzl cc_test|//...:%cc_test
EOF
