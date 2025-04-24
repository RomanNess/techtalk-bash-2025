#!/usr/bin/env bash
#shellcheck enable=check-extra-masked-returns
set -euo pipefail
# inherit set -e in subshell
#shopt -s inherit_errexit

# shellcheck source=src/lib-techtalk.sh
source "$(find . -name lib-techtalk.sh)" && show_errors_and_exit

function fail_on_cd() {
  cd "missing_$1" #|| kill -HUP $$ # exit from command substitution
  echo rm -f "$1" >&2
}

# ⚠️ set -e not inherited in subshell
a="$(fail_on_cd 4)"
echo "$a"

# ⚠️ return type is masked, bc the actual command is echo
echo "$(set -e; fail_on_cd 5)"

b="$(set -e; fail_on_cd 6)" # 👋 exit(1)
echo "${b} bar"

# See also https://www.shellcheck.net/wiki/SC2312
