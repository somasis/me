#!/bin/sh
# catsitd-user - see catsitd(8).

if ! [ -f "${XDG_RUNTIME_DIR}"/catsitd-user-"${USER}".pid ] \
    || ! kill -0 $(cat "${XDG_RUNTIME_DIR}"/catsitd-user-"${USER}".pid); then
    catsitd-user -r 0
fi

