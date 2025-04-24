#!/usr/bin/env bash
# shellcheck source=src/lib-techtalk.sh
source "$(find .. -name lib-techtalk.sh)" && show_errors_and_exit


# same as `set -e`
set -o errexit # ✅ exit on error

cd missing_dir # 💣 error here
echo rm *
