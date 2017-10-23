function! autocomplete#CancelAutoCompleteOrInsertMode()
  if pumvisible()
    return "\<C-y>"
  else
    return "\<Esc>"
  endif
endfunction

function! autocomplete#EngageAutocomplete()
  return "\<C-n>"
endfunction

function! autocomplete#SelectAutoCompleteOrCarriageReturn()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

" Override thoughtbot tab wrapper to move in opposite direction
" <S-Tab> is remapped in mappings.vim
function! InsertTabWrapper()
  if s:check_back_space()
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction
