""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme jellybeans
let g:netrw_liststyle= 4

set background=light
" Don't redraw the screen during macros
set lazyredraw
set nofoldenable
set number relativenumber
set scrolloff=5
" Suppress some messages
set shortmess=atI
set showmode
" Don't try to highlight lines longer than 200 characters.
set synmaxcol=200
set visualbell
set wrap

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
