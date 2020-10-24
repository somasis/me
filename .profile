#!/bin/sh

# XDG_{BINARY,LIBRARY}_HOME are extensions.
# ~/.local/bin is used by other programs like `pip`, however.
#

export XDG_BINARY_HOME=~/bin
export XDG_CACHE_HOME=~/var/cache
export XDG_CONFIG_HOME=~/etc
export XDG_DATA_HOME=~/share
export XDG_LIBRARY_HOME=~/lib

if [ -d "/run/user/$(id -u)" ]; then
    export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
else
    export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-${TMPDIR:-/tmp}}"
fi

# No use in following this include while linting.
# shellcheck disable=SC1090
[ -f "${XDG_CONFIG_HOME}/user-dirs.dirs" ] && . "${XDG_CONFIG_HOME}/user-dirs.dirs"

# path - Set PATH variables.

case "${PATH}" in
    "${XDG_BINARY_HOME}":|*:"${XDG_BINARY_HOME}"|*:"${XDG_BINARY_HOME}":*) : ;;
    *)
        export PATH="${XDG_BINARY_HOME}":"${PATH}"
        ;;
esac

for f in "${XDG_CONFIG_HOME:-${HOME}/.config}"/profile/*.sh; do
    [ -f "${f}" ] && . "${f}"
done

case "${0##*/}" in
    ksh|-ksh|oksh|-oksh|loksh|-loksh)
        [ -f "${XDG_CONFIG_HOME}"/ksh/rc ] && export ENV="${XDG_CONFIG_HOME}"/ksh/rc
        [ -f "${HOME}/.kshrc" ] && export ENV="${HOME}"/.kshrc
        ;;
esac

if [ "$(tty)" = /dev/tty1 ] && [ -z "${DISPLAY}" ];then
    eval $(dbus-launch --sh-syntax)
    exec sx
fi

