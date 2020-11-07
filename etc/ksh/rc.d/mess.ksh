#!/bin/ksh
# mess - Set up function to change into `mess` directory.

command -v mess >/dev/null 2>&1 && eval "$(mess -s)"

alias src='mkdir ~/mess/current/src >/dev/null 2>&1; cd ~/mess/current/src'
