#!/bin/sh
# cd - Tweaks for cd(1) usage.

CDPATH=.:~:~/mess:~/mess/$(date +%Y):~/study:~/mnt

alias back='cd "${OLDPWD}"'
alias ..='cd ..'
