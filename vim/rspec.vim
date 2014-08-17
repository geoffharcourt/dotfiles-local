" http://robots.thoughtbot.com/post/57444559280/running-specs-from-vim
" http://robots.thoughtbot.com/post/58056673303/use-rspec-vim-with-tmux-and-dispatch
" let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let g:rspec_command = "Dispatch rspec {spec}"

" Use to reset tslime when specs should be sent to a different window
nmap <C-c>r <Plug>SetTmuxVars

function! PromoteToLet()
  :normal! dd
  " :exec '?^\sit\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
endfunction
