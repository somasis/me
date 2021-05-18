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

hook -group user-autolint global BufWritePre .* %{
    evaluate-commands %sh{ [ -n "${kak_opt_lintcmd}" ] && echo lint }
}

hook -group user-autoformat global BufWritePre .* %{
    evaluate-commands %sh{ [ -n "${kak_opt_formatcmd}" ] && echo format }
}

# Lightly enforce the 50/72 rule for git commit summaries.
hook global -group user-git-commit WinSetOption filetype=git-commit %{
    set-option buffer autowrap_column 72

    # <https://github.com/kakoune-editor/kakoune-extra-filetypes/blob/master/rc/git-commit-overflow.kak>
    # Commit title; everything over 50 is yellow.
    add-highlighter window/ regex \A\n*[^#\n]{50}([^\n]+) 1:black,yellow+f

    # Line following the title should be empty
    add-highlighter window/ regex \A[^\n]*\n([^#\n]+) 1:white,red+b
}

# scdoc(1).
hook global -group user-scd BufCreate .*\.scd %{
    set-option buffer filetype markdown
    set-option buffer autowrap_column 80
}

# man(7) and mdoc(7).
hook global -group user-troff WinSetOption filetype=troff %{
    set-option buffer autowrap_column 72

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

# Perl scripts.
hook global -group user-write-perl WinSetOption filetype=perl %{
    set-option window formatcmd "perltidy -pro=.../.perltidyrc -st -se"
    set-option window lintcmd %{ \
        run() { \
            profile=; \
            profile=$(upward .perlcriticrc); \
            perlcritic --quiet --profile "$(upward .perlcriticrc)" \
                --verbose '%f:%l:%c: severity %s: %m [%p]\n' "$1" \
                | sed \
                    -e '/: severity 5:/ s/: severity 5:/: error:/' \
                    -e '/: severity [0-4]:/ s/: severity [0-4]:/: warning:/'; \
        } && run \
    }
}

# Shell scripts.
hook global -group user-write-sh WinSetOption filetype=sh %{
    set-option window formatcmd "shfmt"
    set-option window lintcmd "shlint"

    # PKGBUILDS.
    hook global -group user-write-pkgbuilds WinCreate ^(?:.*/)?PKGBUILD$ %{
        set-option window formatcmd "shfmt"
        set-option window lintcmd "shellcheck-pkgbuild"
    }

}

# roff(7).
hook global -group user-write-troff WinSetOption filetype=troff %{
    set-option window lintcmd %{ run() { mandoc -T lint -W warning "$1" | cut -d' ' -f1-; } && run }
}

# JSON.
hook global -group user-write-json WinSetOption filetype=json %{
    set-option window formatcmd "jq --indent %opt{tabstop} ."
}

# aerc(1).
hook global -group user-aerc WinSetOption filetype=mail %{
    set-option buffer autowrap_column 72
    set-option buffer autoreload no
}

# Update autowrap column highlighter when it changes.
hook global -group user-autowrap-highlight BufSetOption autowrap_column=.* %{
    add-highlighter -override global/wrap column %opt{autowrap_column} default,black
}
