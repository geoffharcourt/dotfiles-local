""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab key bullshit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete config
set complete=.,b,u,]
set wildmenu
set wildmode=longest:full,full

" Autocomplete with spelling suggestions when spellcheck is on
set complete+=kspell

" Override thoughtbot tab wrapper to move through autocomplete list
" in opposite direction
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-n>"
  endif
endfunction

inoremap <S-Tab> <C-p>

function! SelectAutoCompleteOrCarriageReturn()
  if pumvisible()
    return "\<c-y>"
  else
    return "\<CR>"
  endif
endfunction

function! CancelAutoCompleteOrInsertMode()
  if pumvisible()
    return "\<c-e>"
  else
    return "\<Esc>"
  endif
endfunction

" Use escape to kill autocomplete without completion and stay in insert mode
" inoremap <silent> <Esc> <C-r>=CancelAutoCompleteOrInsertMode()<CR>

" Enter selects the winner if autocompletion popup is open
" inoremap <silent> <CR> <C-r>=SelectAutoCompleteOrCarriageReturn()<CR>

" YouCompleteMe configuration
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_extra_conf_globlist = ['~/cortex-projects/*','!~/*']
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_cache_omnifunc=0

" include tmux pane completions in YouCompleteMe
let g:tmuxcomplete#trigger = 'omnifunc'
