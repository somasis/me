#!/bin/ksh
# aliases - See ksh(1).

# LC_COLLATE=C sorts uppercase before lowercase.
alias ls='LC_COLLATE=C ls -AFlh --color'

alias vi='$EDITOR'

alias gitolite='ssh git@rosa'
alias laminar='ssh rosa laminarc'

alias mutiny='doas chroot /mnt/mutiny su -l somasis'
alias exherbo='doas chroot /mnt/exherbo su -l somasis'

alias 2048='TERM=xterm ssh play@ascii.town'

alias scratch='kak *scratch*'

new() (
    nohup terminal "$@" >/dev/null 2>&1 &
)

