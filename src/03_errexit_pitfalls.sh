#!/usr/bin/env bash
##shellcheck enable=check-set-e-suppressed
set -euo pipefail

# shellcheck source=src/lib-techtalk.sh
source "$(find . -name lib-techtalk.sh)" && show_errors_and_exit

function fail_on_cd() {
  cd "missing_$1" # 🔴 error here
  echo rm -f "$1" >&2
}

# ⚠️ set -e is disabled in if-condition
if fail_on_cd 1; then true; fi

# ⚠️ set -e is disabled for left-hand side of `||` and `&&`
fail_on_cd 2 && true
# ⚠️ set -e is disabled for negations with `!`
! fail_on_cd 3

fail_on_cd 4 # ✅ will exit(1) here
echo "not reached"

# See also https://www.shellcheck.net/wiki/SC2310
