#!/bin/ksh
# aliases - See ksh(1).

alias ls='ls -Flh --color'
alias vi='$EDITOR'

alias gitolite='ssh git@rosa'
alias laminar='ssh rosa laminarc'

alias mutiny='doas chroot /mnt/mutiny su -l somasis'
alias exherbo='doas chroot /mnt/exherbo su -l somasis'

alias 2048='TERM=xterm ssh play@ascii.town'
