#!/bin/sh
# path - Set PATH related variables.

# man(1) says:
# > If MANPATH begins with a colon, it is appended to the default
# > list; if it ends with a colon, it is prepended to the default
# > list; or if it contains two adjacent colons, the standard
# > search path is inserted between the colons.  If none of these
# > conditions are met, it overrides the standard search path.
export MANPATH="${XDG_DATA_HOME}/man:"

