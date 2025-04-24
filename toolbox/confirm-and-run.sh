#!/usr/bin/env bash

function confirmAndRun() {
    echo " # " "$@" >&2

    read -r -p "(y) run, (s) skip, (n) cancel: " yn </dev/tty >&2
    case ${yn} in
        [yY]* ) "$@" ;;
        s) echo "🙅 skipped." >&2;;
        *) echo "👋 exiting ..." >&2; exit 1 ;;
    esac
}

confirmAndRun date
confirmAndRun pwd
confirmAndRun hostname
confirmAndRun uname
