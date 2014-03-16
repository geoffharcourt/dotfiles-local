" Copy & Paste
"------------------------
"
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

vnoremap <Leader>cp :<c-u>call g:CopyVisualText()<cr>
nnoremap <Leader>cw mmviw:<c-u>call g:CopyVisualText()<cr><esc>`m
nnoremap <Leader>p :r!pbpaste<cr>
nnoremap <Leader>ca :call CopyEntireFile()<cr>

vnoremap <Leader>x "+x
vnoremap <Leader>y "+y

" Don't have YankRing conflict with Ctrlp. Too much muscle memory to give up
" here, and I want Ctrlp to work normally for pairing.
let g:yankring_replace_n_pkey = "<C-y>"
let g:yankring_replace_n_nkey = "<C-t>"
nnoremap ~ :YRShow<CR>
