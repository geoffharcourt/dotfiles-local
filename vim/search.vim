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
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

let g:ctrlp_extensions = ['tag']
let g:ctrlp_tjump_only_silent = 1
nnoremap <C-]> :CtrlPtjump<CR>
vnoremap <C-]> :CtrlPtjumpVisual<CR>
