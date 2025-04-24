#!/usr/bin/env bash
set -euo pipefail

logAndRun() {
  echo " # " "$@"
  if [[ "${dryRun}" = false ]]; then
    "$@"
  else
    echo "🧪 dry run"
  fi
}

dryRun=true
logAndRun aws s3 sync ./ s3://mybucket/


