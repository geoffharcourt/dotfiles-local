function! autocomplete#CancelAutoCompleteOrInsertMode()
  if pumvisible()
    return "\<C-y>"
  else
    return "\<Esc>"
  endif
endfunction

function! autocomplete#EngageAutocomplete()
  if has("nvim") && g:loaded_deoplete
    return deoplete#mappings#manual_complete()
  else
    return "\<C-n>"
  end
endfunction

function! autocomplete#SelectAutoCompleteOrCarriageReturn()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

function! autocomplete#SmartClosePopup()
  if has("nvim") && g:loaded_deoplete
    return deoplete#smart_close_popup()
  else
    return "\<C-y>"
  end
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
