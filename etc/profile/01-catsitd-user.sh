#!/bin/sh
# catsitd-user - see catsitd(8).

{ command -v catsitd-user >/dev/null 2>&1 && command -v catsitd >/dev/null 2>&1; } || return

if ! [ -f "${XDG_RUNTIME_DIR}"/catsitd-user-"${USER}".pid ] \
    || ! kill -0 $(cat "${XDG_RUNTIME_DIR}"/catsitd-user-"${USER}".pid); then
    catsitd-user -r 15000
fi

