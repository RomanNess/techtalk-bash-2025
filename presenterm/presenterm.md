---
title: "**Then there is BASH**"
sub_title: (from 1989 💾)
author: Roman Neß (as old as BASH)
#event: slides powered by presenterm
---
## Basically automates commands issued to your Terminal
```bash +exec +line_numbers
echo "Hello, world!"        # Print text
ls                          # List files 
pwd                         # Print current directory
whoami                      # Show current user
date                        # Print the current date and time
```
<!-- end_slide -->
## No linter. The script must go on...
```bash +exec +line_numbers
echo "Hello, world!"        # Print text
ls                          # List files 
I'm a cat running over the keyborard§"$%§'%&/ª¯\_😸_/¯
whoami                      # Show current user
date                        # Print the current date and time
```
<!-- end_slide -->
## No type checks
Everything is a string (unless it is an array of strings).
```bash +exec +line_numbers
x="42" # x is a string

if [[ "$x" -eq "42" ]]; then
  echo "x is a number and equals 42"
fi

if [[ "$x" == "42" ]]; then
  echo "x is the string '42'"
fi
```
<!-- end_slide -->
## A lot of weird operators
```bash +line_numbers
grep "foo" <*.md >/dev/null 2>&1 || exit $?
```
<!-- end_slide -->
## No seatbelts
```bash +exec +line_numbers
dir="build"
# one typo can mess everything up
echo rm -rf ${dirr}/* # 💣
```
<!-- end_slide -->
```bash +exec
text="Okay, enough bashing! Let's do a quick Bash syntax refresher."
cowsay "${text}"
say "${text}"
```
<!-- end_slide -->
## Variables
There are only strings and arrays of strings.
```bash +exec +line_numbers
string="Techtalk"
echo "Hello ${string}. unset=${unset}"

arr=("a" "b" "c")
echo "The first element of: ${arr[@]} is ${arr[0]}"
```
<!-- end_slide -->

## Command substitution
`$(cmd)` and `` `cmd` `` execute in a sub-shell.
```bash +exec +line_numbers
hostname="$(hostname)"
echo "Running on hostname: '${hostname}'"
echo "in directory: $(basename "$(pwd)")"
echo "at date: `date`"
```
<!-- end_slide -->

## Arrays & Loops
It's possible to iterate over array elements or words in a string.
<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
```bash +exec +line_numbers
arr=("one" "two" "three")

for elem in "${arr[@]}"; do
  echo "$elem"
done
```
<!-- column: 1 -->
```bash +exec +line_numbers
string="one two three"

for word in ${string}; do
  echo "$word"
done
```
<!-- end_slide -->
## stdin, stdout, stderr, pipestreams
Pipestreams feed the stdout as stdin of the next command.
<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
```bash +exec +line_numbers
echo "redirect stdout" > /tmp/stdout.log
echo "append stdout" >> /tmp/stdout.log
# pipe stdout to other commands
cat /tmp/stdout.log | grep "std" | sort
```
<!-- column: 1 -->
```bash +exec +line_numbers
ls does-not-exist 2> /tmp/stderr.log
# feed stdin from file
grep "exist" < /tmp/stderr.log
```
<!-- end_slide -->

## Exit Codes
exit 0 -> true

all other codes -> false
```bash +exec +line_numbers
false # builtin that returns non-zero
if [[ "$?" -ne 0 ]]; then 
  echo "previous command failed 🔴"
fi

false || echo "handle failure of previous cmd 🩹"
true && echo "previous command was successful 🟢"

false # exit code of last command is exit code of script
```
<!-- end_slide -->

## Functions
Functions are simply named code blocks that set parameters as $1,$2,...\
Parameters are not validated.
```bash +exec +line_numbers
function add() {
  echo $(($1 + $2))
}

add 3 4
echo "'add 3 4' returned with code: $?"

add 3 foo bar
echo "'add 3 foo bar' returned with code: $?"
```
<!-- end_slide -->

## Run processes in the background
```bash +exec +line_numbers
function sleep_and_log() {
  sleep 1
  echo "$1 finished at $(date)."
  say "done."
}

echo "started at $(date)"
# command ended with '&' run in background
sleep_and_log 1 & # forks a sub process
sleep_and_log 2 &
sleep_and_log 3 &
wait # wait for all background processes
echo "all done at $(date)"
```
<!-- end_slide -->

## Traps
```bash +exec +line_numbers
# "event listener" on EXIT event
trap 'echo "👋 Exit ($?) on: $BASH_COMMAND" >&2' EXIT

echo "hello"
exit 42
```
<!-- end_slide -->

## shebang sets the interpreter
<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
```file
path: shebang_pitfall.sh
language: bash
```
```bash +exec +line_numbers
# obey shebang
./shebang_pitfall.sh
# ignore shebang
bash ./shebang_pitfall.sh
```
<!-- column: 1 -->
```file
path: shebang.sh
language: bash
```
```bash +exec +line_numbers
./shebang.sh
```
<!-- end_slide -->
## safe exit on errors
💡 Use `set -o errexit` or `set -e`.
<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
```bash +exec +line_numbers
# ⚠️ error is ignored
cd missing_dir 
echo rm * 💣
```
<!-- column: 1 -->
```bash +exec +line_numbers
set -o errexit

cd missing_dir # 👋 exit here
echo rm *
```
<!-- end_slide -->
## safe exit on unset variables
💡 Use `set -o nounset` or `set -u`.
<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
```bash +exec +line_numbers
dir="build"
echo rm -rf "${dirr}/*" # ⚠️ typo
```
<!-- column: 1 -->
```bash +exec +line_numbers
# ✅ exit on unset variable
set -o nounset

dir="build"
echo rm -rf "${dirr}/*" # 👋
```
<!-- end_slide -->
## exit on error in pipestream
💡 Use `set -o pipefail`.
<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
```bash +exec +line_numbers
# ⚠️ error is ignored
cat missingfile.txt | wc -l
echo "🟢 file processed"
```
<!-- column: 1 -->
```bash +exec +line_numbers
set -e
set -o pipefail # ✅ treat error in pipeline as error

cat missingfile.txt | wc -l # 👋
echo "🟢 file processed"
```
<!-- end_slide -->
```bash +exec
cowsay "Let's go back to the future!"
```
<!-- end_slide -->
## That's all folks
<!-- column_layout: [1, 1] -->
<!-- column: 0 -->
```bash +exec
figlet THANKS
```
<!-- column: 1 -->
```bash +exec
qrencode -m 2 -t utf8 <<< "https://github.com/RomanNess/techtalk-bash-2025"
```



