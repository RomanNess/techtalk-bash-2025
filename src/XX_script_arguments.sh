#!/usr/bin/env bash
set -euo pipefail

# env var with default
JOIN_CHAR=${JOIN_CHAR:-"-"}

usage() {
  cat << EOF
  Usage: $0 <STRING>...
  joins all provided strings with '-'
EOF
  exit 1
}

# validate arguments
if [[ "$#" == 0 ]]; then
  usage
fi

joined_string=$(printf "%s${JOIN_CHAR}" "$@" | sed "s/${JOIN_CHAR}\$//")
echo "${joined_string}"
