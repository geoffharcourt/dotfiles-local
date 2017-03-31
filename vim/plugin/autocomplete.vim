" Avoid deoplete
if has("nvim")
  let g:deoplete#disable_auto_complete=1
  let g:deoplete#enable_at_startup = 1
end

let g:completor_auto_trigger = 0

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ autocomplete#EngageAutocomplete()

inoremap <expr><BS>
  \ pumvisible() ? autocomplete#SmartClosePopup() :
  \ "\<BS>"

function! s:check_back_space()
  let line = getline('.')                    " current line
  let substr = strpart(line, -1, col('.')+1) " from the start of the current
  let substr = matchstr(substr, "[^ \t]*$")  " word till cursor
  return strlen(substr) == 0
endfunction
