#!/bin/ksh
# mess - Set up `mess` integration.

command -v mess >/dev/null 2>&1 && eval "$(mess -s)"

alias src='mkdir ~/mess/current/src 2>/dev/null; HOME=~/mess/current/src CDPATH=${HOME} cd'

set -A complete_src_1 -- $(cd ~/mess/current/src && echo */)
