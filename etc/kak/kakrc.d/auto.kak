# auto - autolint, autoformat

hook -group user-autolint global BufWritePre .* %{
    evaluate-commands %sh{ [ -n "${kak_opt_lintcmd}" ] && echo lint || echo nop }
}

hook -group user-autoformat global BufWritePre .* %{
    evaluate-commands %sh{ [ -n "${kak_opt_formatcmd}" ] && echo format || echo nop }
}

# Perl scripts.
hook global -group user-auto-perl WinSetOption filetype=perl %{
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

# Markup languages.
hook global -group user-auto-proselint WinSetOption filetype=(asciidoc|markdown) %{
    set-option window lintcmd %{
        run() { \
            proselint -j "$1" \
                | jq -r '.data.errors[]
                    | (
                        (.line|@text) + ":" +
                        (.column|@text) + ": " +
                        .severity + ": " +
                        .message +
                        " [" + .check + "]"
                    )
                ' \
                | while read -r line; do \
                    printf '%s:%s\n' "$1" "${line}"; \
                done; \
        } && run \
    }
}

# Shell scripts.
hook global -group user-auto-sh WinSetOption filetype=sh %{
#     set-option window formatcmd "shellfmt"
    set-option window lintcmd "shlint"
}

# PKGBUILDS.
hook global -group user-auto-pkgbuild WinCreate ^PKGBUILD$|.*/PKGBUILD$ %{
    hook window -group user-auto-pkgbuild WinSetOption filetype=sh %{
        # set-option window formatcmd "shellfmt-pkgbuild"
        set-option window lintcmd "shlint-pkgbuild"
    }
}

# roff(7).
hook global -group user-auto-troff WinSetOption filetype=troff %{
    set-option window lintcmd %{ run() { mandoc -T lint -W warning "$1" | cut -d\  -f1-; } && run }
}

# JSON.
hook global -group user-auto-json WinSetOption filetype=json %{
    set-option window formatcmd "jq --indent %opt{tabstop} ."
}

