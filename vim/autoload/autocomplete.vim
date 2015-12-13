function! autocomplete#CancelAutoCompleteOrInsertMode()
  if pumvisible()
    return "\<C-y>"
  else
    return "\<Esc>"
  endif
endfunction

function! autocomplete#SelectAutoCompleteOrCarriageReturn()
   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
