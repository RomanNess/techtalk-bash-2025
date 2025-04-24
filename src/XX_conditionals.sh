#!/usr/bin/env bash
set -euo pipefail

a="foo"
b="bar"
with_spaces="with spaces"

# boolean operators within brackets
[[ "$#" == 0 && "$a" != "$b" ]]
# can handle word splitting
[[ $with_spaces == "with spaces" ]]
# regex comparison
[[ "$with_spaces" =~ spaces$ ]]

# true and false are printed
true && { echo true; false; } || echo false
