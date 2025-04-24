#!/usr/bin/env bash
# shellcheck source=src/lib-techtalk.sh
source "$(find .. -name lib-techtalk.sh)" && show_errors_and_exit


# same as `set -u`
set -o nounset # ✅ exit on unset variable

dir="build"
echo rm -rf "${dirr}/*" # oops, typo
