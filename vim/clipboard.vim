" Copy & Paste
"------------------------

" For some reason Vim no longer wants to talk to the OS X pasteboard through *
function! g:CopyVisualText()
  let cur_register_contents = @c
  normal! gv
  normal! "cy
  normal! gv
  silent call system('pbcopy', @c)
endfunction

function! CopyEntireFile()
  exe "normal mmggVG\<Leader>cp`m"
  echohl String | echon "Buffer contents copied!" | echohl None
endfunction

nnoremap <Leader>ca :call CopyEntireFile()<cr>
vnoremap <Leader>cp :<c-u>call g:CopyVisualText()<cr>
nnoremap <Leader>cv mmviw:<c-u>call g:CopyVisualText()<cr><esc>`m
nnoremap <Leader>p :r!pbpaste<cr>

vnoremap <Leader>x "+x
vnoremap <Leader>y "+y

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]
