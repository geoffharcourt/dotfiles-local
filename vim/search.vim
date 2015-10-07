""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch    " highlight search results
set incsearch   " highlight search incrementally
set ignorecase  " searches are case-insensitive
set smartcase   " searches are case-sensitive if a capital is in term

let g:eregex_default_enable = 0
let g:indexed_search_mappings = 0
let g:oblique#incsearch_highlight_all = 1

function! GoBackThroughSearch()
  execute "silent normal \<Plug>(Oblique-N)"
  ShowSearchIndex
endfunction

function! AdvanceThroughSearch()
  execute "silent normal \<Plug>(Oblique-n)"
  ShowSearchIndex
endfunction

"""
" See ~/.vim/after/plugins/zzzmappings.vim for post-plugin mappings
"""

" Default to smart-case searching. Can be disabled with -s
let g:agprg="ag -S --column"

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
" nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>
" Bind K to grep word under cursor
nnoremap K :set nois<CR> :Ag! "\b<C-R><C-W>\b"<CR> :set incsearch<CR>

let g:ctrlp_extensions = ['tag', 'undo']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_tjump_only_silent = 1

" nnoremap <C-]> :CtrlPtjump<CR>
" vnoremap <C-]> :CtrlPtjumpVisual<CR>

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction
