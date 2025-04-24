#!/usr/bin/env bash
# shellcheck source=src/lib-techtalk.sh
source "$(find .. -name lib-techtalk.sh)" && show_errors_and_exit


set -e
set -o pipefail # ✅ treat error in pipeline as error

cat missingfile.txt | wc -l
echo "🟢 file processed"
