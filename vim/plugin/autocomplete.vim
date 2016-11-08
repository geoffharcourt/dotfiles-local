" Avoid deoplete
if has("nvim")
  let g:deoplete#disable_auto_complete=1
  let g:deoplete#enable_at_startup = 1
end

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ autocomplete#EngageAutocomplete()

inoremap <expr><BS>
  \ pumvisible() ? autocomplete#SmartClosePopup() :
  \ "\<BS>"

function! s:check_back_space()
  let col = col('.') - 1
  return !col "|| getline('.')[col - 1] !~ '\k'
endfunction
