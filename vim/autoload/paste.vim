" Don't lose the contents of the p register when pasting over a visual selection
function! paste#ReplaceVisualSelectionWithYankRegister()
  let s:restore_reg = @"
  return "p@=paste#RestoreRegister()\<CR>"
endfunction

function! paste#RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
