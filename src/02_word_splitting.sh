#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=src/lib-techtalk.sh
source "$(find . -name lib-techtalk.sh)"

show_words a b   'c d' 'e'"f"
# 4 words: <a> <b> <c d> <ef>

arr=(a b   'c d' 'e'"f")
show_words "${arr[@]}" # array preserves words
# 4 words: <a> <b> <c d> <ef>
show_words "${arr[*]}" # array to string
# 1 words: <a b c d ef>

string="a	b c"
show_words $string # ⚠️
# 3 words: <a> <b> <c>
show_words "$string"
# 1 words: <a   b c>

