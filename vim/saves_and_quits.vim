""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File operations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! W w " Bind :W to w
command! Q q " Bind :Q to q
command! Wq wq
command! Qa qa

" requires disabling flow control
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
