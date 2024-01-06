declare-user-mode window

map -docstring 'Enter window control mode' global normal <c-w> ":enter-user-mode window<ret>"
map -docstring 'Enter window control mode' global user w ":enter-user-mode window<ret>"

map -docstring 'Activate to the left'  global window h ":zellij-action 'move-focus' 'left'<ret>"
map -docstring 'Activate to the down'  global window j ":zellij-action 'move-focus' 'down'<ret>"
map -docstring 'Activate to the up'    global window k ":zellij-action 'move-focus' 'up'<ret>"
map -docstring 'Activate to the right' global window l ":zellij-action 'move-focus' 'right'<ret>"
map -docstring 'Activate to the left'  global user h ":zellij-action 'move-focus' 'left'<ret>"
map -docstring 'Activate to the down'  global user j ":zellij-action 'move-focus' 'down'<ret>"
map -docstring 'Activate to the up'    global user k ":zellij-action 'move-focus' 'up'<ret>"
map -docstring 'Activate to the right' global user l ":zellij-action 'move-focus' 'right'<ret>"
map -docstring 'Activate next'         global window w ":zellij-action 'focus-next-pane'<ret>"

map -docstring 'Move to the left'  global window H ":zellij-action 'move-pane' 'left'<ret>"
map -docstring 'Move to the down'  global window J ":zellij-action 'move-pane' 'down'<ret>"
map -docstring 'Move to the up'    global window K ":zellij-action 'move-pane' 'up'<ret>"
map -docstring 'Move to the right' global window L ":zellij-action 'move-pane' 'right'<ret>"

map -docstring 'Close current window' global window q ":quit<ret>"
map -docstring 'Create vertical split' global window v ":vsplit<ret>"
map -docstring 'Create horizontal split' global window s ":split<ret>"
map -docstring 'Previous tab' global user t ":zellij-action 'go-to-previous-tab'<ret>"
map -docstring 'Next tab' global user T ":zellij-action 'go-to-next-tab'<ret>"

# commands
define-command -hidden -params 2.. zellij-split %{ nop %sh{
    zellij_run_options=$1
    shift
    zellij --session "$kak_client_env_ZELLIJ_SESSION_NAME" run "--close-on-exit" $zellij_run_options -- "$@"
}}
define-command -hidden -params 1.. zellij-newtab %{ nop %sh{
    "${kak_config}/kaj" "__kaj_newtab" "$kak_client_env_ZELLIJ_SESSION_NAME" "$@"
}}

define-command -docstring "vsplit <filename>: open file in vertical zellij split" \
vsplit -params 0.. -file-completion %{
    zellij-split "--direction right" kak -c %val{session} %arg{@}
}
define-command -docstring "split <filename>: open file in horizontal zellij split" \
split -params 0.. -file-completion %{
    zellij-split "--direction down" kak -c %val{session} %arg{@}
}
define-command -docstring "tabe <filename>: open file in horizontal zellij split" \
tabe -params 0.. -file-completion %{
    zellij-newtab -c %val{session} %arg{@}
}

alias global vs vsplit
alias global vsp vsplit
alias global spl split
