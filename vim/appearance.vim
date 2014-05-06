""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme solarized
set background=dark

" Numbering
set number relativenumber
" set colorcolumn=80
set scrolloff=5
set nofoldenable
set noshowmode
set wrap

" Suppress some messages
set shortmess=atI
set visualbell

nnoremap <Leader>G :Goyo<CR>

" Toggle background
nnoremap <Leader>B
  \ :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

let g:netrw_liststyle= 4
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#ctrlp#color_tempate = 'normal'
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_z = "%4l%#__restore__#:%3c"
let g:airline#extensions#default#layout = [
      \ [ 'a', 'c'],
      \ [ 'x', 'z'],
      \ ]
let g:airline#extensions#default#section_truncate_width = {
    \ 'a': 25,
    \ 'b': 120,
    \ 'c': 25,
    \ 'x': 120,
    \ 'y': 150,
    \ 'z': 25,
    \ }

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
