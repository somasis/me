#!/bin/ksh
# mess - Set up `mess` integration.

if command -v mess >/dev/null 2>&1;then
    eval "$(mess -s)"

    mkdir -p ~/mess/current/src >/dev/null 2>&1

    src() {
        CDPATH=~/mess/current/src:~/src cd "${@:-}"
    }

    CDPATH="${CDPATH:+$CDPATH:}"~/mess:~/mess/$(date +%Y):~/mess/current
fi
