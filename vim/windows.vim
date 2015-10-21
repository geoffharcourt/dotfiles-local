""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent set winwidth=84
silent set winheight=10
silent set winminheight=10
silent set winheight=999

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

autocmd VimResized * :wincmd =

nnoremap gv `[v`]
