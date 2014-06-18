#!/bin/bash
# common.sh -- common functions used in my scripts
# (c) 2014 Somasis <somasissounds@gmail.com> - MIT License

if [[ -z "$XDG_CONFIG_HOME" ]];then
    XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -z "$use_color" ]];then
    use_color="true"
fi

if [[ "$use_color" == "true" ]];then
    COLOR_BLACK=$'\033[0;30m'
    COLOR_RED=$'\033[0;31m'
    COLOR_GREEN=$'\033[0;32m'
    COLOR_YELLOW=$'\033[0;33m'
    COLOR_BLUE=$'\033[0;34m'
    COLOR_PINK=$'\033[0;35m'
    COLOR_CYAN=$'\033[0;36m'
    COLOR_WHITE=$'\033[0;37m'
    
    COLOR_BOLD_BLACK=$'\033[1;30m'
    COLOR_BOLD_RED=$'\033[1;31m'
    COLOR_BOLD_GREEN=$'\033[1;32m'
    COLOR_BOLD_YELLOW=$'\033[1;33m'
    COLOR_BOLD_BLUE=$'\033[1;34m'
    COLOR_BOLD_PINK=$'\033[1;35m'
    COLOR_BOLD_CYAN=$'\033[1;36m'
    COLOR_BOLD_WHITE=$'\033[1;37m'
    
    COLOR_BG_BLACK=$'\033[40m'
    COLOR_BG_RED=$'\033[41m'
    COLOR_BG_GREEN=$'\033[42m'
    COLOR_BG_YELLOW=$'\033[43m'
    COLOR_BG_BLUE=$'\033[44m'
    COLOR_BG_PINK=$'\033[45m'
    COLOR_BG_CYAN=$'\033[46m'
    COLOR_BG_WHITE=$'\033[47m'
    COLOR_RESET=$'\033[0m'
    
    COLOR_RANDOM=$(eval echo "\$COLOR_$(for _rand_color in BLACK RED GREEN YELLOW BLUE PINK CYAN WHITE;do echo "$_rand_color";done | shuf -n1)")
    COLOR_BOLD_RANDOM=$(eval echo "\$COLOR_BOLD_$(for _rand_color in BLACK RED GREEN YELLOW BLUE PINK CYAN WHITE;do echo "$_rand_color";done | shuf -n1)")
    COLOR_BG_RANDOM=$(eval echo "\$COLOR_BOLD_$(for _rand_color in BLACK RED GREEN YELLOW BLUE PINK CYAN WHITE;do echo "$_rand_color";done | shuf -n1)")
fi

show_help() { # show_help [exit code] [error message]
    if [[ "$1" == [0-9]* ]];then
        script_exit_code="$1"
        shift
    fi
    script_error="$@"
    if [[ ! -z "$script_error" ]];then
        echo -e "Error: $script_error"
        echo
    fi
    echo -e "$COLOR_BOLD_RANDOM${script_name:-${0##*/}}$COLOR_RESET $script_arguments"
    if [[ ! -z "$script_version" ]];then
        echo -e "${script_name:-${0##*/}} $script_version"
    fi
    if [[ ! -z "$script_description" ]];then
        echo -e "$script_description"
    fi
    if [[ ! -z  "$script_credit" ]];then
        echo
        echo -e "$script_credit"
    fi
    echo
    if [[ ! -z "$script_exit_code" ]];then
        exit "$script_exit_code"
    fi
}

retrieve() { # retrieve <url>
    if [[ -z "$retrieve_preference" ]] || command -v "$retrieve_preference" 2>&1 >/dev/null;then
        preference=wget
    fi
    url="$@"
    if [[ "$retrieve_preference" == "wget" ]] && command -v wget 2>&1 >/dev/null;then
        args="-qO -"
        if [[ ! -z "$user_agent" ]];then
            args="-U \"$user_agent\" $args"
        fi
        if [[ ! -z "$post_data" ]];then
            args="--post-data=\"$post_data\" $args"
        fi
        if [[ ! -z "$header_data" ]];then
            args="--header=\"$header_data\" $args"
        fi
        eval "wget $args -- $url"
    elif [[ "$retrieve_preference" == "curl" ]] && command -v curl 2>&1 >/dev/null;then
        args="-s"
        if [[ ! -z "$user_agent" ]];then
            args="-A \"$user_agent\" $args"
        fi
        if [[ ! -z "$post_data" ]];then
            args="-d \"$post_data\" $args"
        fi
        if [[ ! -z "$header_data" ]];then
            args="-H \"$header_data\" $args"
        fi
        eval "curl $args -- $url"
    else
        echo "I don't know how to retrieve the url; install \`curl\` or \`wget\`"
        exit 4
    fi
    url=
    post_data=
    header_data=
}