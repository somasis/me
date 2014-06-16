#!/bin/bash
# common.sh -- common functions used in my scripts
# (c) 2014 Somasis <somasissounds@gmail.com> - MIT License

if [[ -z "$XDG_CONFIG_HOME" ]];then
    XDG_CONFIG_HOME="$HOME/.config"
fi

retrieve() {
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
        echo "I don't know how to retrieve the web page; install \`curl\` or \`wget\`"
        exit 4
    fi
    url=
    post_data=
    header_data=
}