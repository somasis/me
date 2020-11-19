#!/bin/ksh
# completion - Completion arrays for ksh(1).

if command -v passage >/dev/null 2>&1; then
    set -A complete_passage_1 -- init list convert generate edit help show
    set -A complete_passage -- $(passage show)
fi

set -A complete_mount -- \
    $({
        sed -E '/^#/d; s/\s+/ /; /^$/d; s/^\S+ //; s/ .*//' /etc/fstab
        mount | cut -d' ' -f3
    } | sort -ud)

set -A complete_umount -- \
    $(mount | cut -d' ' -f3 | sort -ud)
