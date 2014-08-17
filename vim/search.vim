""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch    " highlight search results
set ignorecase  " searches are case-insensitive
set smartcase   " searches are case-sensitive if a capital is in term

" Default to smart-case searching. Can be disabled with -s
let g:agprg="ag -S --column"

" Ctrlp shortcut
let g:ctrlp_map = '<c-p>'

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>
