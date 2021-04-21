#!/bin/sh

set -eu

usage() {
    cat >&2 <<EOF
usage: ${0##*/} [-0!M] TYPE FILES...
EOF
    exit 69
}

true() { return 0; }
false() { return 1; }

not=false
printf='%s\n'
while getopts ':0!M' arg >/dev/null 2>&1; do
    case "${arg}" in
        0)
            printf='%s\0'
            ;;
        '!')
            not=true
            ;;
        M) exclude=soft ;;
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
    case "$(file ${exclude:+-e $exclude} -Lb --mime-type "${f}")" in
        ${mime}) ! "${not}" && printf "${printf}" "${f}" ;;
        *) "${not}" && printf "${printf}" "${f}" || : ;;
    esac
done
