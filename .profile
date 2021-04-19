#!/bin/sh

# XDG_{BIN,LIB}_HOME are extensions.
# ~/.local/bin is used by other programs like `pip`, however.

export XDG_BIN_HOME=~/bin
export XDG_CACHE_HOME=~/var/cache
export XDG_CONFIG_HOME=~/etc
export XDG_DATA_HOME=~/share
export XDG_LIB_HOME=~/lib

[ -d "/run/user/$(id -u)" ] && export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

# No use in following this include while linting.
# shellcheck disable=SC1090
[ -f "${XDG_CONFIG_HOME}/user-dirs.dirs" ] && . "${XDG_CONFIG_HOME}/user-dirs.dirs"

# path - Set PATH variables.

case "${PATH}" in
    "${XDG_BIN_HOME}":|*:"${XDG_BIN_HOME}"|*:"${XDG_BIN_HOME}":*) : ;;
    *)
        export PATH="${XDG_BIN_HOME}":"${PATH}"
        ;;
esac

for f in "${XDG_CONFIG_HOME}"/profile/*.sh; do
    [ -f "${f}" ] && . "${f}"
done

_sh="${0##*/}"
_sh="${_sh#-}"

[ -f "${XDG_CONFIG_HOME}/${_sh}/rc" ] && export ENV="${XDG_CONFIG_HOME}/${_sh}/rc"
[ -f "${HOME}/.${_sh}rc" ] && export ENV="${HOME}/.${_sh}rc"

unset _sh

if [ "$(tty)" = /dev/tty1 ] && [ -z "${DISPLAY}" ];then
    eval $(dbus-launch --sh-syntax)
    exec sx
fi

