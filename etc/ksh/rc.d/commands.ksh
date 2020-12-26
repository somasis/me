#!/bin/ksh
# aliases - See ksh(1).

# LC_COLLATE=C sorts uppercase before lowercase.
alias ls='LC_COLLATE=C ls -AFlh'

alias vi='$EDITOR'

alias gitolite='ssh git@rosa'
alias laminar='ssh rosa laminarc'

alias mutiny='doas chroot /mnt/mutiny su -l somasis'
alias exherbo='doas chroot /mnt/exherbo su -l somasis'

alias 2048='TERM=xterm ssh play@ascii.town'

alias scratch='kak *scratch*'

# Quick aliases for posting to my site.
if [ -d ~/src/www/somas.is ]; then
    alias note='kak $(make -C ~/src/www/somas.is -s note)'
    alias rhizome='kak $(make -C ~/src/www/somas.is -s rhizome)'
fi

# Spawn a new terminal, detached from the current one, inheriting environment and working directory.
new() (
    nohup terminal "$@" >/dev/null 2>&1 &
)

