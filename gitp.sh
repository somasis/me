#!/bin/sh
# gitp.sh - a git prompt generator
#
# Copyright 2017-2018 Kylie McClain <kylie@somas.is>
# Distributed under the terms of the 0BSD license

__gitp() {
    if ! git rev-parse >/dev/null 2>&1;then
        printf ' '
        return 127 # not a git repository
    fi

    __gitp_status=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    printf ' (%s) ' "${__gitp_status}"
    unset __gitp_status
}

