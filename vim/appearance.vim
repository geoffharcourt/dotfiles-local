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
set nowrap

" Suppress some messages
set shortmess=atI
set visualbell

" Toggle background
noremap <Leader>B
  \ :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

let g:netrw_liststyle= 4
let g:airline_powerline_fonts = 1
let airline#extensions#tmuxline#color_template = 'visual'
let g:airline#extensions#default#section_truncate_width = {
    \ 'a': 25,
    \ 'b': 120,
    \ 'c': 25,
    \ 'x': 120,
    \ 'y': 120,
    \ 'z': 25,
    \ }

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '#h:#(ifconfig | grep "inet " | cut -d " " -f2 | tail -1 )',
      \'z'    : 'ruby #(cd $PWD && rbenv version-name)',
      \'options' : {'status-justify' : 'left'} }

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
