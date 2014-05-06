""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch    " highlight search results
set incsearch   " highlight result as search term is typed
set ignorecase  " searches are case-insensitive
set smartcase   " searches are case-sensitive if a capital is in term

" toggle search highlighting
nnoremap <CR> :nohlsearch<CR>

" Ctrlp shortcut
let g:ctrlp_map = '<c-p>'

" http://robots.thoughtbot.com/faster-grepping-in-vim
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

nmap <silent> <leader>d <Plug>DashGlobalSearch
nnoremap <leader>D :DashGlobalSearch<space>
