" Copy & Paste
"------------------------

function! ClipboardYank()
  call system('pbcopy', @@)
endfunction

" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:ReplaceVisualSelectionWithYankRegister()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

vmap <silent> <expr> p <sid>ReplaceVisualSelectionWithYankRegister()

inoremap <C-v> <C-o>:r!pbpaste<CR>
