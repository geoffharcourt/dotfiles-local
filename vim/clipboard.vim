" Copy & Paste
"------------------------

function! ClipboardYank()
  call system('pbcopy', @@)
endfunction

function! s:ReplaceVisualSelectionWithYankRegister()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" vp doesn't replace paste buffer
vmap <silent> <expr> p <sid>ReplaceVisualSelectionWithYankRegister()
