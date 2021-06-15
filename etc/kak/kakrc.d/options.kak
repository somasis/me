set-option global grepcmd 'kakgrep'
set-option global makecmd 'make -j12'

# NOTE This has to be conditional since termcmd is only declared
# conditionally in rc/windowing/x11.kak.
try %{ set-option global termcmd 'terminal' }

# Set default interface options
set-option global ui_options \
    ncurses_assistant=cat \
    ncurses_change_colors=false \
    ncurses_set_title=true \
    ncurses_status_on_top=true

# Disable startup changelog unless development version.
set-option global startup_info_version -1

# Set default text-editing options
set-option global tabstop 4
set-option global indentwidth 4

# Set options for default plugins
set-option global autowrap_column 100
