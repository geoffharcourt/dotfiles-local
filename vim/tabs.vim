""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Run commands in an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Turn two horizontal splits into a vertical split
nnoremap <Leader>sv <C-W>t<C-W>H
nnoremap <Leader>sh <C-W>t<C-W>K

" split size settings
set winwidth=84
set winheight=10
set winminheight=10
set winheight=999

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Tabs, as in windows
nnoremap <Leader>w :tabnext<CR>
nnoremap <Leader>W :tabprevious<CR>
nnoremap <Leader>TO <C-w>T
nnoremap <Leader>TM :call MergeTabs()<CR>
nnoremap <Leader>z :tab split<CR>

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

nnoremap <Leader><Tab> :Scratch<CR>
