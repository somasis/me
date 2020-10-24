#!/bin/ksh
# completion - Completion arrays for ksh(1).

set -A complete_passage_1 -- init list convert generate edit help show
set -A complete_passage -- $(passage show)

set -A complete_mount -- \
    $({
        sed -E '/^#/d; s/\s+/ /; /^$/d; s/^\S+ //; s/ .*//' /etc/fstab
        mount | cut -d' ' -f3
    } | sort -ud)

set -A complete_umount -- \
    $(mount | cut -d' ' -f3 | sort -ud)
