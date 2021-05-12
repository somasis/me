plug "https://github.com/matthias-margush/tug.git"              # File management commands.
plug "https://github.com/occivink/kakoune-find.git"             # Find and replace across buffers.
plug "https://github.com/caksoylar/kakoune-smooth-scroll.git" config %{
    hook global -group user-smooth-scroll WinCreate .* %{
        hook -once window -group user-smooth-scroll WinDisplay .* smooth-scroll-enable
    }
}

# Functionality
plug "https://github.com/occivink/kakoune-sudo-write.git"       # Allow for writing with sudo.
plug "https://gitlab.com/Screwtapello/kakoune-state-save.git"   # Save buffer state across sessions.

# Filetypes
plug "https://github.com/gspia/csv.kak.git"                     # Highlight columns of CSV files.

# Change cursor color on inactive window.
plug "https://github.com/greenfork/active-window.kak.git" config %{
}

# Integrate yank with Xorg clipboard.
plug "https://github.com/lePerdu/kakboard.git" config %{
    hook global -group user-kakboard WinCreate .* %{ kakboard-enable }
}

# Easier indentation style management.
plug "https://github.com/andreyorst/smarttab.kak.git" defer smarttab %{
    set-option global softtabstop 4
} config %{
    # Use spaces for everything.
    hook global -group user-smarttab BufOpenFile .* %{ expandtab }
    hook global -group user-smarttab BufNewFile  .* %{ expandtab }

    # With exceptions.
    hook global -group user-smarttab BufOpenFile .*\.scd noexpandtab
    hook global -group user-smarttab WinSetOption filetype=(makefile) smarttab
    hook global -group user-smarttab WinSetOption filetype=(c|cpp) smarttab
    hook global -group user-smarttab BufOpenFile .*/git/config %{ smarttab }
    hook global -group user-smarttab BufOpenFile .*\.git/config %{ smarttab }
}
