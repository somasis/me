#!/usr/bin/env bash
# common.sh -- common functions used in my scripts
# Copyright 2014-2015 Kylie McClain <somasis@exherbo.org>
# Distributed under the terms of the ISC License

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

sleepuntil() { # sleepuntil - borrowed with some modifications from http://stackoverflow.com/a/19067658 
    local slp tzoff now
    local hms=(${1//:/ })
    printf -v now '%(%s)T' -1
    printf -v tzoff '%(%z)T\n' $now
    tzoff=$((0${tzoff:0:1}(3600*${tzoff:1:2}+60*${tzoff:3:2})))
    slp=$(((86400+(now-now%86400)+10#$hms*3600+10#${hms[1]}*60+${hms[2]}-tzoff-now)%86400))
    sleep $slp
}
