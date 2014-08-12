""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>gs :Gstatus<CR>
" Git blame!
vnoremap <Leader>gb :Gblame<CR>

" Use spellcheck in git commits.
autocmd FileType gitcommit,markdown setlocal nosmartindent | setlocal spell
