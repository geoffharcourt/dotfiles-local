let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete=1

" Override thoughtbot tab wrapper to move in opposite direction
" <S-Tab> is remapped in mappings.vim
function! InsertTabWrapper()
  if s:check_back_space()
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()

inoremap <expr><BS>
  \ pumvisible() ? deoplete#smart_close_popup() :
  \ "\<BS>"

function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1] !~ '\k'
endfunction
