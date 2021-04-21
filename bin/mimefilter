#!/bin/sh

set -eu

usage() {
    cat >&2 <<EOF
usage: ${0##*/} [-0] MIME FILES...
EOF
    exit 69
}

true() { return 0; }
false() { return 1; }

not=false
printf='%s\n'
while getopts ':0!' arg >/dev/null 2>&1; do
    case "${arg}" in
        0)
            printf='%s\0'
            ;;
        '!')
            not=true
            ;;
        ?)
            usage
            ;;
    esac
done
shift $(( OPTIND - 1 ))

[ $# -ge 2 ] || usage

mime="$1"; shift

ls -- "$@" >/dev/null 2>&1 || exit 1
for f; do
    case "$(file -iL "${f}" | sed -E 's|.*: ([^/]+/[^/]+); [^=]+=[^=]+$|\1|')" in
        ${mime}) ! "${not}" && printf "${printf}" "${f}" ;;
        *) "${not}" && printf "${printf}" "${f}" || : ;;
    esac
done
