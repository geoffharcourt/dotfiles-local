function! paste#ReplaceVisualSelectionWithYankRegister()
  let s:restore_reg = @"
  return "p@=paste#RestoreRegister()\<cr>"
endfunction

function! paste#RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
