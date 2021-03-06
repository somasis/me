#!/bin/sh
# prompt - Set variables such as $PS1. See sh(1).

PS1='\[\e[0m\]${CHROOT:+\[\e[1;31m\]${CHROOT} }'

case "$(id -un)" in
    somasis)
        PS1="${PS1}"'\[\e[34m\]\u'
        ;;
esac

# Set terminal title.
PS1="${PS1}"'\[$(printf %b "\e]0;${SSH_CONNECTION:+ssh [${USER}@${HOSTNAME}]: }${PWD}\a")\]'

# Show hostname only over ssh(1) connections or chroots.
[ -n "${SSH_CONNECTION}${CHROOT}" ] && PS1="${PS1}"'@\[\e[0;35m\]\h\[\e[0m\]'

PS1="${PS1}"' \[\e[1;39m\]\w\[\e[0m\]'

# git(1) prompt.
PS1="${PS1}"' \[\e[1;33m\]$(_git_prompt)\[\e[0m\]'

# Show exit status of last ran command.
PS1="${PS1}"'\[$([ "$?" -eq 0 ] && printf %b "\e[32m" || printf %b "\e[31m")\]∴\[\e[0m\] '

# Change the cursor to an I-beam in xterm(1).
# It would be nice if xterm(1) had a resource for this.
#case "${TERM}" in xterm|xterm-*) PS1="${PS1}\[$(printf %b "\e[6 q")\]"; ;; esac
