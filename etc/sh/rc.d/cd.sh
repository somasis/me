#!/bin/sh
# cd - Tweaks for cd(1) usage.

CDPATH=.:~:~/study:~/src:~/mnt

alias back='cd "${OLDPWD}"'
alias ..='cd ..'
