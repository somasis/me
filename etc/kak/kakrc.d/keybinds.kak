# Buffer controls
map global normal <a-a> ': buffer-previous<ret>'
map global normal <a-A> ': buffer-next<ret>'
map global normal <c-w> ': delete-buffer<ret>'
map global normal <a-d> ': buffer *debug*<ret>'

# Window controls
map global normal <c-n> ': new<ret>'

# Selections
map global normal <c-a> '%'

# Commenting
map global normal <a-c> ': comment-line<ret>'

# Completion
# Use tab/shift-tab for completion.
hook global -group user-completion InsertCompletionShow .* %{
    map window insert <tab> <c-n>
    map window insert <s-tab> <c-p>
}

hook global -group user-completion InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}

