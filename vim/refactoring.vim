" Refactoring configurations
"------------------------

let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop'

" Borrowed from Gary Bernhardt's vimrc
function! ExtractVariable()
  echohl String | let name = input("Variable name: ") | echohl None
  if name == '' | return | endif

  " Enter visual mode (input() takes us out of it)
  normal! gv

  " Replace selected text with the variable name
  exec "normal c" . name
  " Define the variable on the line above
  if &ft == "vim"
    exec "normal! Olet " . name . " = "
  elseif &ft == 'javascript'
    exec "normal! Ovar " . name . " = "
  else
    exec "normal! O" . name . " = "
  endif
  " Paste the original selected text to be the variable value
  normal! $p
  if &ft == 'javascript'
    normal! A;
  endif
endfunction

function! InlineVariable()
  if &filetype == 'javascript'
    s/\v^(\s+)var (.*);$/\1\2/
    nohl
  elseif &filetype == 'vim'
    s/\v^(\s+)let (.*)$/\1\2/
    nohl
  endif
  normal! ^*Ndf=x"vd$ddnviw"vp
endfunction

" vim:ft=vim
