""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch    " highlight search results
set incsearch   " highlight result as search term is typed
set ignorecase  " searches are case-insensitive
set smartcase   " searches are case-sensitive if a capital is in term

" toggle search highlighting
nnoremap <leader>h :nohlsearch<CR>

" Ctrlp shortcut
let g:ctrlp_map = '<c-p>'


" Default to smart-case searching. Can be disabled with -s
let g:agprg="ag -S --column"

" http://robots.thoughtbot.com/faster-grepping-in-vim
" changed from the blog post to use ag.vim
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

nmap <silent> <leader>d <Plug>DashGlobalSearch
nnoremap <leader>D :DashGlobalSearch<space>
