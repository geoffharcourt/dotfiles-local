""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab key bullshit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete config
set complete=.,b,u,],kspell
set wildmenu
set wildmode=longest:full,full

" Neocomplete configuration
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#disable_auto_complete = 1

" YouCompleteMe configuration
" let g:ycm_add_preview_to_completeopt=1
" let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_collect_identifiers_from_comments_and_strings=1
" let g:ycm_collect_identifiers_from_tags_files=0
" let g:ycm_extra_conf_globlist = ['~/cortex-projects/*','!~/*']
" let g:ycm_min_num_of_chars_for_completion = 4
" let g:ycm_seed_identifiers_with_syntax=1
" let g:ycm_cache_omnifunc=0
" " include tmux pane completions in YouCompleteMe
" let g:tmuxcomplete#trigger = 'omnifunc'

function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! SelectAutoCompleteOrCarriageReturn()
   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

function! CancelAutoCompleteOrInsertMode()
  if pumvisible()
    return "\<c-e>"
  else
    return "\<Esc>"
  endif
endfunction

function! ToggleAutoComplete()
  if g:neocomplete#disable_auto_complete == 0
    let g:neocomplete#disable_auto_complete = 1
  else
    let g:neocomplete#disable_auto_complete = 0
  endif
endfunction


" <TAB>: completion.
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
inoremap <S-TAB> <C-p>
" This is required because in some term setups Vim can't interpret the `^]]Z`
" sequence as `<S-Tab>`
" inoremap <C-[>\[Z <C-p>

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 499 --min 5')
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

" Use escape to kill autocomplete without completion and stay in insert mode
inoremap <silent> <Esc> <C-r>=CancelAutoCompleteOrInsertMode()<CR>

" Enter selects the winner if autocompletion popup is open
inoremap <silent> <CR> <C-r>=SelectAutoCompleteOrCarriageReturn()<CR>

" Snippet Completion
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)
