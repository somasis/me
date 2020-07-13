#!/bin/sh
# 00-defaults - Default application variables

if command -v kak >/dev/null 2>&1; then
    export EDITOR=kak
else
    export EDITOR='busybox vi'
fi

export PAGER=less
export TERMINAL=terminal
export BROWSER=open
