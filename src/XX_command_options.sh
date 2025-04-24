#!/usr/bin/env bash
set -euo pipefail

# ❓what does this do?
docker ps -a -l -q
# ✅ easier to understand
docker ps --all --latest --quiet

# ✅ arrays are great for command options
ls_flags=(-l --color=auto)
ls_flags+=(-a)
ls "${ls_flags[@]}"
