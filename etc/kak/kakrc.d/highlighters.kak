# Number lines, show whitespaces.
add-highlighter global/user-highlight-nl number-lines -separator " ▏" -hlcursor -min-digits 4
add-highlighter global/user-highlight-whitespace show-whitespaces -spc " " -tab "→"
add-highlighter global/user-highlight-matching show-matching
add-highlighter global/user-highlight-wrap wrap -word

# Highlight issues, nasty code, and notes, in descending order of goodness.
add-highlighter global/user-highlight-fixme regex \b(BUG|FIXME)\b 1:red+bf
add-highlighter global/user-highlight-hack  regex \b(NOTE|HACK|XXX)\b 1:yellow+bf
add-highlighter global/user-highlight-todo  regex \b(TODO)\b|\b(todo): 1:green+bf 2:green+bf

# Highlight trailing spaces.
add-highlighter global/user-highlight-trailing-whitespace regex \h+$ 0:default,red+f

# Highlight the wrap column, highlight any characters past that column.
hook global -group user-highlight-autowrap BufCreate .* %{
    hook window -group user-highlight-autowrap-column WinSetOption autowrap_column=.* %{
        add-highlighter -override buffer/user-highlight-autowrap-column \
            column %opt{autowrap_column} default,UserCurrent
    }

    hook window -group user-highlight-autowrap-long InsertIdle .* %{
        add-highlighter -override window/user-highlight-long-lines \
            dynregex "^[^\n]{%opt{autowrap_column}}([^\n]+)$" 1:red+bf
    }
}

# Highlight the current line and column the cursor is on.
set-face global UserCurrent default,default+b

hook global -group user-highlight-cursor BufCreate .* %{
    add-highlighter -override buffer/user-highlight-cursor-line \
        line %val{cursor_line} UserCurrent
    add-highlighter -override buffer/user-highlight-cursor-column \
        column %val{cursor_display_column} UserCurrent
    hook buffer -group user-highlight-cursor RawKey .* %{
        add-highlighter -override buffer/user-highlight-cursor-line \
            line %val{cursor_line} UserCurrent
        add-highlighter -override buffer/user-highlight-cursor-column \
            column %val{cursor_display_column} UserCurrent
    }
}

# Highlight the current word the cursor is on.
declare-option -hidden regex user_cursor_word
set-face global UserCursorWord +bu

hook global -group user-highlight-cursor-word NormalIdle .* %{
    evaluate-commands -draft %{
        try %{
            execute-keys <space><a-i>w <a-k>\A\S+\z<ret>
            set-option buffer user_cursor_word "\b\Q%val{selection}\E\b"
        } catch %{
            set-option buffer user_cursor_word ''
        }
    }
}

add-highlighter global/user-highlight-cursor-word dynregex '%opt{user_cursor_word}' 0:UserCursorWord
