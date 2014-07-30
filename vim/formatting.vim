" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Indentation 
noremap <Leader>i mmgg=G`m<CR>

" Review markdown
command! Marked MarkedOpen!

" Spell check in markdown and text files
augroup spellingenabled
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown set complete+=kspell
  autocmd FileType text setlocal spell
  autocmd FileType text set complete+=kspell
augroup END

" Don't try to highlight lines longer than 200 characters.
set synmaxcol=200

autocmd FileType snippets setlocal noexpandtab
