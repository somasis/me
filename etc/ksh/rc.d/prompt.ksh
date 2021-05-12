#!/bin/ksh
# prompt - Set variables such as $PS1. See ksh(1).

PS1='\[\e[0m\]'

case "$(id -un)" in
    somasis)
        PS1="${PS1}"'\[\e[34m\]\u'
        ;;
esac

# Set terminal title.
PS1="${PS1}"'\[$(echo -e "\033]0;${SSH_CONNECTION:+ssh [${USER}@${HOSTNAME}]: }${PWD}\007")\]'

# Show hostname only over ssh(1) connections.
[ -n "${SSH_CONNECTION}" ] && PS1="${PS1}"'@\[\e[0m\]\[\e[[35m\]\h\[\e[0m\]'

PS1="${PS1}"' \[\e[1m\e[37m\]\w\[\e[0m\] '

# Show exit status of last ran command.
PS1="${PS1}"'\[\e[0m\]\[$([ "$?" -eq 0 ] && printf "\e[32m" || printf "\e[31m")\]●\[\e[0m\] '

# Change the cursor to an I-beam in xterm(1).
# It would be nice if xterm(1) had a resource for this.
#case "${TERM}" in xterm|xterm-*) PS1="${PS1}""\[$(echo "[6 q")\]"; ;; esac
