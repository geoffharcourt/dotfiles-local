" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Indentation 
noremap <Leader>i mmgg=G`m<CR>

" Convert single quotes to doubles
nnoremap <Leader>" :normal cs'"<CR>

" don't use Ex mode, use Q for formatting
map Q gq

" Review markdown
command! Marked Dispatch open -a Marked.app %:p

" Spell check in markdown and text files
augroup spellingenabled
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown set complete+=kspell
  autocmd FileType text setlocal spell
  autocmd FileType text set complete+=kspell
augroup END

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800
