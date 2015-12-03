""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab key bullshit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete config
set complete=.,b,u,]
set wildmenu
set wildmode=longest:full,full

function! SelectAutoCompleteOrCarriageReturn()
   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

function! CancelAutoCompleteOrInsertMode()
  if pumvisible()
    return "\<c-y>"
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

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <S-Tab> <C-p>

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 499 --min 5')
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

" Use escape to kill autocomplete without completion and stay in insert mode
inoremap <silent> <Esc> <C-r>=CancelAutoCompleteOrInsertMode()<CR>

" Enter selects the winner if autocompletion popup is open
inoremap <silent> <CR> <C-r>=SelectAutoCompleteOrCarriageReturn()<CR>
