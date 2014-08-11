" Copy & Paste
"------------------------

function! ClipboardYank()
  call system('pbcopy', @@)
endfunction

nnoremap <Leader>p :r!pbpaste<cr>
vnoremap <Leader>x x:call ClipboardYank()<cr>
vnoremap <Leader>y y:call ClipboardYank()<cr>

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]
