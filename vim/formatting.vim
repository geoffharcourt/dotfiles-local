" Rehighlight after moving text in visual mode
vnoremap < <gv
vnoremap > >gv

set gdefault

set formatoptions-=r
set formatoptions-=t

command! -nargs=* Wrap set wrap linebreak nolist

" paste current timestamp in insert mode, great for updating asset fingerprints
inoremap <C-t> <C-r>=strftime("%Y%m%d%H%M%S")<C-m>

let g:splitjoin_ruby_trailing_comma=0
