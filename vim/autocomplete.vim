""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab key bullshit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete config
set complete=.,w,b,u,t,k,i
set completeopt=menuone,preview
set infercase
set wildignore+=coverage
set wildmenu
set wildmode=longest:full,full

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

" Use escape to kill autocomplete without completion and stay in insert mode
inoremap <silent> <CR> <C-r>=SelectAutoCompleteOrCarriageReturn()<CR>
