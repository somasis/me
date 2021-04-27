#!/bin/sh
# 00-defaults - Default application variables

# Defaults for if lunch isn't on the system.
export EDITOR=vi PAGER=less
command -v kak >/dev/null 2>&1 && export EDITOR=kak

# Expand PAGER when taking in lunch(1) variables,
# to fix stuff like mandoc doing special things for less(1).
command -v lunch >/dev/null 2>&1 \
    && eval "$(lunch -s)" \
    && export PAGER="$(lunch -g pager | cut -d' ' -f1)"
