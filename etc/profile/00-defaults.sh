#!/bin/sh
# 00-defaults - Default application variables

if command -v lunch >/dev/null 2>&1; then
    eval "$(lunch -s)" \

    # Expand PAGER when taking in lunch(1) variables,
    # to fix stuff like mandoc doing special things for less(1).
    export PAGER="$(lunch -g pager | cut -d' ' -f1)"
else
    # Defaults for if lunch isn't on the system.
    export EDITOR=vi
    if command -v kak >/dev/null 2>&1; then
        export EDITOR=kak
    elif command -v busybox >/dev/null 2>&1 && busybox --list | grep -q "^vi$"; then
        export EDITOR='busybox vi'
    else
        export EDITOR=vi
    fi
    export PAGER=less
fi
