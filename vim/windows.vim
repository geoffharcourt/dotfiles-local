""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set winwidth=84
set winheight=10
set winminheight=10
set winheight=999

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
