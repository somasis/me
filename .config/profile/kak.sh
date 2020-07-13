#!/bin/sh
# kak - See kak(1).

# Workaround kakoune's plugin issues when using pdksh derivatives.
# See OpenBSD instructions in <https://github.com/mawww/kakoune#22-installing>
# and a few bugs:
#     - https://github.com/mawww/kakoune/pull/2955
#     - https://gitlab.com/andreyorst/plug.kak/issues/75
export KAKOUNE_POSIX_SHELL='/bin/ash'
