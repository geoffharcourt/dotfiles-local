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

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Reselect text that was just pasted
noremap gV `[v`]

let g:gist_clip_command = 'pbcopy'
