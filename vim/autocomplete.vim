""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab key bullshit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete config
set complete=.,b,u,],kspell
set wildmenu
set wildmode=longest:full,full

" Neocomplete configuration
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
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

" include tmux pane completions in YouCompleteMe
let g:tmuxcomplete#trigger = 'omnifunc'

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

function! ToggleAutoComplete()
  if g:neocomplete#disable_auto_complete == 0
    let g:neocomplete#disable_auto_complete = 1
  else
    let g:neocomplete#disable_auto_complete = 0
  endif
endfunction

function! TagFromTagDefinition(tag_definition)
  echo a:tag_definition
  return matchstr(a:tag_definition, '\S\+')
endfunction

inoremap <expr> <c-x><c-s> fzf#complete({
  \ 'source':  'cat .git/tags',
  \ 'reducer': function('TagFromTagDefinition'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'left':    20})

inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')
" inoremap <S-Tab> <C-p>

" Use escape to kill autocomplete without completion and stay in insert mode
inoremap <silent> <Esc> <C-r>=CancelAutoCompleteOrInsertMode()<CR>

" Enter selects the winner if autocompletion popup is open
" inoremap <silent> <CR> <C-r>=SelectAutoCompleteOrCarriageReturn()<CR>
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <S-TAB>  <C-p>
inoremap <C-[>\[Z <C-p>

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
	       \ <SID>check_back_space() ? "\<TAB>" :
	       \ neocomplete#start_manual_complete()

function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! BackwardsInList()
  return "\<C-p>"
endfunction
