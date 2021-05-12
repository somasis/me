#!/bin/ksh
# aliases - See ksh(1).

# LC_COLLATE=C sorts uppercase before lowercase.
alias ls='LC_COLLATE=C ls -AFlh'

alias vi='$EDITOR'

alias gitolite='ssh git@rosa'
alias laminar='ssh rosa laminarc'

alias mutiny='doas chroot /mnt/mutiny su -l somasis'
alias exherbo='doas chroot /mnt/exherbo su -l somasis'

# Quick aliases for posting to my site.
if [ -d ~/src/www/somas.is ]; then
    alias note='kak $(make -C ~/src/www/somas.is -s note-new)'
    alias rhizome='kak $(make -C ~/src/www/somas.is -s rhizome-new)'
fi

if [ -d ~/diary ]; then
    alias diary='kak ~/diary/$(date +%Y/%m/%d.txt)'
fi

# Spawn a new terminal, detached from the current one, inheriting environment and working directory.
newt() (
    nohup terminal "$@" >/dev/null 2>&1 &
)

news() {
    ${SHELL:-/bin/sh -i} "$@"
}

alias beet="sshchain fort beet"

alias bc='bc -q'

alias ascii.town='ssh play@ascii.town'
alias 2048='ssh -t play@ascii.town 2048'
alias snake='ssh -t play@ascii.town snake'

command -v yay >/dev/null 2>&1 && alias yaync='yay --noconfirm'

alias g='find ./ -type f \! -path "*/.*/*" -print0 | xe -0 -N0 grep'

if command -v colordiff >/dev/null 2>&1; then
    alias diff='colordiff'
    command -v dwdiff >/dev/null 2>&1 && wdiff() { command dwdiff "$@" | colordiff --difftype=wdiff; }
fi
