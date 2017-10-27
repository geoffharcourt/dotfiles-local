set shortmess+=c

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ "\<C-n>"

function! s:check_back_space()
  let line = getline('.')                    " current line
  let substr = strpart(line, -1, col('.')+1) " from the start of the current
  let substr = matchstr(substr, "[^ \t]*$")  " word till cursor
  return strlen(substr) == 0
endfunction
