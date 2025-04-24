#!/usr/bin/env bash
#set -euo pipefail # commented out to illustrate errors
# shellcheck source=src/lib-techtalk.sh
source "$(find . -name lib-techtalk.sh)" #&& show_errors_and_exit

string="src/01*" # ✅ no spaces around equal sign
echo $string # ⚠️ needs quotes to prevent globbing
echo '${string}' # ⚠️ no expansion in single quotes
echo "a=$string_bar b=${string}_bar"  # ⚠️ no expansion without braces

i= hostname # ⚠️ i="" hostname
ls =bar # ⚠️ ls "=bar"
i=foo echo oops # ⚠️ i="foo" echo oops


filename="a filename with spaces.txt" # ✅ string with spaces is quoted
echo "filename=${filename}" # ✅ quote every string
ls ${filename} # ⚠️ ls "a" "filename" "with" "spaces.txt
