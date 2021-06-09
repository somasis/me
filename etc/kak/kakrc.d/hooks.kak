# Ensure that the default scratch buffer is entirely empty. Clearing the text is annoying.
hook -group user-empty-scratch global BufCreate \*scratch\* %{
    execute-keys <esc>%d
}

hook -group user-bufcreate global BufCreate .* %{
    modeline-parse
    evaluate-commands %sh{ git rev-parse >/dev/null 2>&1 && echo git show-diff }
}

hook -group user-bufwritepre global BufWritePre .* %{
    # Make directory for buffer prior to writing it.
    nop %sh{ mkdir -p "$(dirname "${kak_hook_param}")" }
}

hook -group user-bufwritepost global BufWritePost .* %{
    git show-diff
}

# Lightly enforce the 50/72 rule for git commit summaries.
hook global -group user-git-commit WinSetOption filetype=git-commit %{
    set-option window autowrap_column 72

    # <https://github.com/kakoune-editor/kakoune-extra-filetypes/blob/master/rc/git-commit-overflow.kak>
    # Commit title; everything over 50 is yellow.
    add-highlighter window/ regex \A\n*[^#\n]{50}([^\n]+) 1:black,yellow+f

    # Line following the title should be empty.
    add-highlighter window/ regex \A[^\n]*\n([^#\n]+) 1:white,red+b
}

# scdoc(1).
hook global -group user-scd BufCreate .*\.scd %{
    set-option buffer filetype markdown
    set-option window autowrap_column 80
}

# man(7) and mdoc(7).
hook global -group user-troff WinSetOption filetype=troff %{
    set-option window autowrap_column 72

    # Update all .Dd dates before saving the buffer.
    hook buffer -group user-troff-update-date BufWritePre .* %{
        execute-keys -draft \
            <esc>% \
            s^\.Dd<ret> \
            x \
            |date<space>+".Dd<space>%B<space>%d,<space>%Y"<ret><esc>
    }
}

# pass(1) temporary files.
hook global -group user-password-store BufCreate /dev/shm/pass\..* %{
    set-option buffer filetype yaml
    autowrap-disable
}

# aerc(1).
hook global -group user-aerc WinSetOption filetype=mail %{
    set-option window autowrap_column 72
    set-option buffer autoreload no
}

# Set autowrap highlighters, and update autowrap highlighters when the option changes.
hook global -group user-highlight-autowrap-update WinSetOption autowrap_column=.* %{
    # Column highlighter.
    add-highlighter -override window/user-highlight-autowrap-column \
        column %opt{autowrap_column} +r

    add-highlighter -override window/user-highlight-autowrap wrap -word

    hook window -group user-highlight-autowrap-readonly WinSetOption readonly=true %{
        # Always wrap readonly buffers to the autowrap width, for nicer reading.
        add-highlighter -override window/user-highlight-autowrap \
            wrap -word -width %opt{autowrap_column}
    }
}
