""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix list management (modified from Gary Bernhardt's dotfiles)
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! quickfix#GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! quickfix#BufferIsOpen(bufname)
  let buflist = quickfix#GetBufferList()
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

function! quickfix#ToggleQuickfixList()
  if quickfix#BufferIsOpen("Quickfix List")
    cclose
  else
    copen
  endif
endfunction

function! quickfix#ToggleLocationList()
  if quickfix#BufferIsOpen("Location List")
    lclose
  elseif !empty(getloclist(0))
    lopen
  else
    echo "no location list"
  endif
endfunction
