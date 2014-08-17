set nojoinspaces

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Spell check in markdown and text files
augroup spellingenabled
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown set complete+=kspell
  autocmd FileType text setlocal spell
  autocmd FileType text set complete+=kspell
augroup END

autocmd FileType snippets setlocal noexpandtab
