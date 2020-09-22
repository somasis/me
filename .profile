#!/bin/sh

for f in "${XDG_CONFIG_HOME:-${HOME}/.config}"/profile/*.sh; do
    [ -f "${f}" ] && . "${f}"
done

if [ "$(tty)" = /dev/tty1 ] && [ -z "${DISPLAY}" ];then
    exec sx
fi

