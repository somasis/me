#!/bin/sh
# less - See less(1) for details.

# Colors for man pages
export LESS_TERMCAP_us=$(printf "\e[3;32m") # italicized in asciidoctor
export LESS_TERMCAP_mb=$(printf "\e[3m")
export LESS_TERMCAP_md=$(printf "\e[1;33m") # sections, and bolded in asciidoctor
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[0m")
export LESS_TERMCAP_ue=$(printf "\e[0m")

# -s - combine multiple blank lines
# -R - "Like -r, but only ANSI "color" escape sequences are output in "raw" form."
# --mouse - support mouse scrolling
# --wheel-lines - only scroll 2 lines for each tick of the wheel
export LESS='-sR --mouse --wheel-lines=2'

# XDG compliance
export LESSHISTFILE="${XDG_CACHE_HOME}"/less/history
export LESSKEY="${XDG_CONFIG_HOME}"/less/lesskey
[ -d "${XDG_CACHE_HOME}"/less ] || mkdir -p "${XDG_CACHE_HOME}"/less

