""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""
" See ~/.vim/after/plugins/zzzmappings.vim for post-plugin mappings
"""

set hlsearch    " highlight search results
set incsearch   " highlight search incrementally
set ignorecase  " searches are case-insensitive
set smartcase   " searches are case-sensitive if a capital is in term

" Default to smart-case searching. Can be disabled with -s
let g:FerretHlsearch = 1
let g:FerretMap = 0
let g:ag_prg="ag -S --column"
nnoremap <C-p> :silent call fzf#vim#gitfiles({'down': '~50%'})<CR>

nnoremap <C-s> :call PickFile()<CR>
let g:fzf_layout = { 'down': '40%' }
let g:ctrlp_map = '<c-t>'

let g:ctrlp_extensions = ['tag', 'undo']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_tjump_only_silent = 1
let g:eregex_default_enable = 0
let g:indexed_search_mappings = 0
let g:oblique#incsearch_highlight_all = 1

function! AdvanceThroughSearch()
  execute "silent normal \<Plug>(Oblique-n)"
  ShowSearchIndex
endfunction

function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

function! GoBackThroughSearch()
  execute "silent normal \<Plug>(Oblique-N)"
  ShowSearchIndex
endfunction

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
command! TagFiles :call EchoTags()

nnoremap \ :Ag<SPACE>
" Bind K to grep word under cursor
nnoremap K :set nois<CR> :Ag <C-R><C-W><CR> :set incsearch<CR>
