#!/bin/sh

for f in "${XDG_CONFIG_HOME:-${HOME}/.config}"/profile/*.sh; do
    [ -f "${f}" ] && . "${f}"
done

if [ "$(tty)" = /dev/tty1 ] && [ -z "${DISPLAY}" ];then
    exec xinit "${XINITRC}" -- vt1 >"${XDG_CACHE_HOME:-${HOME}/.cache}"/X11/xinit.log 2>&1
fi

