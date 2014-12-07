""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File operations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto-load when files change on disk
set autoread
au FocusLost * :wa

command! W w " Bind :W to w
command! Q q " Bind :Q to q
command! Wq wq
command! Qa qa
