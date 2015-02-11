""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set winwidth=84
set winheight=10
set winminheight=10
set winheight=999

autocmd VimResized * :wincmd =
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

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

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>WY :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>WP :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>WW :call WindowSwap#EasyWindowSwap()<CR>
