#!/bin/ksh
# aliases - See ksh(1).

alias ls='ls -Flh --color'
alias vi='$EDITOR'
alias todo='todo.sh'

alias gitolite='ssh git@rosa'
alias laminar='ssh rosa laminarc'
alias mutiny='doas croot -m /mnt/mutiny >/dev/null 2>&1; doas croot -n somasis@/mnt/mutiny'

alias 2048='TERM=xterm ssh play@ascii.town'
