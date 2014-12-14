" Rehighlight after moving text in visual mode
vnoremap < <gv
vnoremap > >gv

set formatoptions-=r
set formatoptions-=t

command! -nargs=* Wrap set wrap linebreak nolist

let g:splitjoin_ruby_trailing_comma=0
