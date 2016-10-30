" Override thoughtbot tab wrapper to move in opposite direction
" <S-Tab> is remapped in mappings.vim
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction
