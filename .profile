#!/bin/sh

for f in "${XDG_CONFIG_HOME}"/profile/*.sh; do
    [ -f "${f}" ] && . "${f}"
done

if [ "$(tty)" = /dev/tty1 ];then
    exec xinit "${XINITRC}" -- vt1 >"${XDG_CACHE_HOME}"/X11/xinit.log 2>&1
fi

