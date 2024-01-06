colorscheme tomorrow-night

# remove autocompletion popup in insert mode. Keeps it in commandline mode, but I don't like it
set-option global autocomplete prompt
# don't set terminal title
set-option global ui_options terminal_set_title=no terminal_assistant=none

# show line numbers
add-highlighter global/ number-lines -relative
# highlight matching parens
add-highlighter global/match_brackets show-matching
# show tab character
add-highlighter global/ show-whitespaces -lf ' ' -tab '▷' -spc ' ' -tabpad ' '


map -docstring 'Exit insert mode' global insert <c-[> <esc>
map -docstring 'Delete until line start' global insert <c-u> '<esc>hGhc'
map -docstring 'Delete word' global insert <c-w> '<esc>bc'
map -docstring 'Delete symbol' global insert <c-h> <backspace>

# autoload other config files, presented as small plugins
evaluate-commands %sh{
    autoload_directory() {
        find -L "$1" -type f -name '*\.kak' \
            | sed 's/.*/try %{ source "&" } catch %{ echo -debug Autoload: could not load "&" }/'
    }
    autoload_directory ${kak_config}/sourced
}


source %sh{echo ${kak_config}/plugin/langmap/langmap.kak}
require-module langmap
set-option global langmap %opt{langmap_ru_jcuken}
map -docstring "toggle layout" global normal '<c-space>' ':toggle-langmap<ret>'
map -docstring "toggle layout" global insert '<c-space>' '<a-;>:toggle-langmap<ret>'
