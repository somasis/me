#!/bin/sh
# 00 - things that absolutely must be ran first. See xdg(7) and profile(7) for details.
#
# XDG_{BINARY,LIBRARY}_HOME are extensions.
# ~/.local/bin is used by other programs like `pip`, however.
#

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

if [ -d "/run/user/$(id -u)" ]; then
    export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
else
    export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-${TMPDIR:-/tmp}}"
fi

export XDG_BINARY_HOME="${XDG_BINARY_HOME:-$HOME/.local/bin}"
export XDG_LIBRARY_HOME="${XDG_LIBRARY_HOME:-$HOME/.local/lib}"

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

# man(1) says:
# > If MANPATH begins with a colon, it is appended to the default
# > list; if it ends with a colon, it is prepended to the default
# > list; or if it contains two adjacent colons, the standard
# > search path is inserted between the colons.  If none of these
# > conditions are met, it overrides the standard search path.
export MANPATH="${XDG_DATA_HOME}/man:"

