" Rehighlight after moving text in visual mode
vnoremap < <gv
vnoremap > >gv

set gdefault

set formatoptions-=r
set formatoptions-=t

command! -nargs=* Wrap set wrap linebreak nolist

let g:splitjoin_ruby_trailing_comma=0
inoremap <C-t> <C-r>=substitute(system("date +%Y%m%d%H%M%S"), '\n$', '', '')<cr>
