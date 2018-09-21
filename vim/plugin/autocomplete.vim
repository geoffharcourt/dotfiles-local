set shortmess+=c
set completeopt=noinsert,menuone,noselect

autocmd BufEnter * call ncm2#enable_for_buffer()

autocmd TextChangedI * call ncm2#auto_trigger()
" Override thoughtbot tab wrapper to move in opposite direction
" <S-Tab> is remapped in mappings.vim
function! InsertTabWrapper()
  if s:check_back_space()
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction

function! CancelAutoCompleteOrInsertMode()
  " if pumvisible()
  "   return "\<C-y>"
  " else
    return "\<Esc>"
  " endif
endfunction

function! CarriageReturnOrClearAndCarriageReturn()
  if pumvisible()
    return "\<C-y>\<CR>"
  else
    return "\<CR>"
  endif
endfunction

function! s:check_back_space()
  let line = getline('.')                    " current line
  let substr = strpart(line, -1, col('.')+1) " from the start of the current
  let substr = matchstr(substr, "[^ \t]*$")  " word till cursor
  return strlen(substr) == 0
endfunction

vmap <c-j> <Plug>snipMateNextOrTrigger
vmap <c-k> <Plug>snipMateBack

imap <expr> <c-k> pumvisible() ? "\<c-y>\<Plug>snipMateBack" : "\<Plug>snipMateBack"
imap <expr> <c-j> pumvisible() ? "\<c-y>\<Plug>snipMateNextOrTrigger" : "\<Plug>snipMateNextOrTrigger"

inoremap <Esc> <c-r>=CancelAutoCompleteOrInsertMode()<CR><Space><r>
inoremap <CR> <c-r>=CarriageReturnOrClearAndCarriageReturn()<CR>

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ "\<C-n>"
