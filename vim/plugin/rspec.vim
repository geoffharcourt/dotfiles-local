" http://robots.thoughtbot.com/post/57444559280/running-specs-from-vim
" http://robots.thoughtbot.com/post/58056673303/use-rspec-vim-with-tmux-and-dispatch

let g:rspec_command = "Dispatch rspec {spec}"
let test#strategy = "dispatch"
