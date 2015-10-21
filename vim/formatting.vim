" Rehighlight after moving text in visual mode
set gdefault
set formatoptions-=r
set formatoptions-=t

let g:splitjoin_ruby_trailing_comma=0

command! -nargs=* Wrap set wrap linebreak nolist

vnoremap < <gv
vnoremap > >gv
