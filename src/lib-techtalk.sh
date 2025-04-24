#!/usr/bin/env bash

function show_errors_and_exit() {
  set -o errtrace # inherit trap by shell functions and subshell
  _debug_last_line=0
  _debug_last_command=""
  trap 'test $LINENO != 1 && _debug_last_line=$LINENO; _debug_last_command=$BASH_COMMAND' DEBUG
  # Note: ERR trap requires BASH_VERSION>=4.0.0
  trap 'echo "🔥 Error ($?) on line <$_debug_last_line> after command: $_debug_last_command 🔥" >&2' ERR
  trap 'echo "👋 Exit ($?) on line <$_debug_last_line> after command: $_debug_last_command 👋" >&2' EXIT
}

function show_words() {
  local words
  words=$(test "$#" -gt 0 && printf " <%s>" "$@")
  echo "# $# words:$words" >&2
}

function log_err() {
  echo -e "[ERR]: $*" >&2
}

function log_debug() {
  [[ "${DEBUG}" = "true" ]] \
    && echo -e "[DEBUG]: $*" >&2
}

function rm() {
  echo "rm $*  ...just kidding 😉" >&2
}
