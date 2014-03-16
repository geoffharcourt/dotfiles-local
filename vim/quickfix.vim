""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix list management (modified from Gary Bernhardt)
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"
" If the tests write a tmp/quickfix file, these mappings will navigate through
" it
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list= 1

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! BufferIsOpen(bufname)
  let buflist = GetBufferList()
  for bufnum in map(
        \filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 
        \'str2nr(matchstr(v:val, "\\d\\+"))'
        \)
    if bufwinnr(bufnum) != -1
      return 1
    endif
  endfor
  return 0
endfunction

function! ToggleQuickfixList()
  if BufferIsOpen("Quickfix List")
    cclose
  else
    copen
  endif
endfunction

function! ToggleLocationList()
  if BufferIsOpen("Location List")
    lclose
  else
    lopen
  endif
endfunction

nnoremap <Leader>q :call ToggleQuickfixList()<CR>
nnoremap <Leader>o :call ToggleLocationList()<CR>

