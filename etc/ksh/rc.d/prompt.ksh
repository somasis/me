#!/bin/ksh
# prompt - Set variables such as $PS1. See ksh(1).

PS1='\[${text_reset}\]'

case "$(id -un)" in
    somasis)
        PS1="${PS1}"'\[${text_fg_blue}\]\u'
        ;;
esac

# Set terminal title.
PS1="${PS1}"'\[$(echo -e "\033]0;${SSH_CONNECTION:+ssh [${USER}@${HOSTNAME}]: }${PWD}\007")\]'

# Show hostname only over ssh(1) connections.
[ -n "${SSH_CONNECTION}" ] && PS1="${PS1}"'@\[${text_reset}\]\[${text_fg_magenta}\]\h\[${text_reset}\]'

PS1="${PS1}"' \[${text_bold}${text_fg_white}\]\w\[${text_reset}\] '

# Show exit status of last ran command.
PS1="${PS1}"'\[${text_reset}\]\[$([ "$?" -eq 0 ] && printf "${text_fg_green}" || printf "${text_fg_red}")\]●\[${text_reset}\] '
