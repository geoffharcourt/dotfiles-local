""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spellcheck in git commits.
autocmd BufRead,BufNewFile */.git/COMMIT_EDITMSG wincmd _
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit normal gg
