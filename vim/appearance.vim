""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme jellybeans
let g:netrw_liststyle= 4

" Don't redraw the screen during macros
set foldmethod=syntax
set lazyredraw
set nofoldenable
set nowrap
set number relativenumber
set scrolloff=5

" Don't try to highlight lines longer than 200 characters.
set synmaxcol=100

au VimEnter * RainbowParenthesesToggle
au BufEnter * RainbowParenthesesLoadRound
au BufEnter * RainbowParenthesesLoadSquare
au BufEnter * RainbowParenthesesLoadBraces
