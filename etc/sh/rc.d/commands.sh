#!/bin/sh
# aliases - See sh(1).

# LC_COLLATE=C sorts uppercase before lowercase.
alias ls='LC_COLLATE=C ls -AFlh'

alias vi='$EDITOR'

alias gitolite='ssh git@rosa'
alias laminar='ssh rosa laminarc'

# Quick aliases for posting to my site.
if [ -d ~/src/www/somas.is ]; then
    alias note='kak $(make -C ~/src/www/somas.is -s note-new)'
    alias rhizome='kak $(make -C ~/src/www/somas.is -s rhizome-new)'
fi

[ -d ~/diary ] && alias diary='kak ~/diary/$(date +%Y/%m/%d.txt)'

# For quick testing of different coreutils abilities.
[ -d /opt/sbase ] && alias sbase='PATH=/opt/sbase/bin:"${PATH}" MANPATH=/opt/sbase/man:'

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

alias rubydoc='\ri'

command -v yay >/dev/null 2>&1 && alias yaync='yay --noconfirm'

alias g='find ./ -type f \! -path "*/.*/*" -print0 | xe -0 -N0 grep'

if command -v colordiff >/dev/null 2>&1; then
    alias diff='colordiff'
    command -v dwdiff >/dev/null 2>&1 && wdiff() { command dwdiff "$@" | colordiff --difftype=wdiff; }
fi

alias xz='xz -T0 -9 -e'
alias zstd='zstd -T0 -19'
alias gzip='gzip -9'
command -v pigz >/dev/null 2>&1 && alias gzip='pigz -p $(( $(nproc) / 2 )) -9'
