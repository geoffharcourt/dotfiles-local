" Run Ag, show results in quickfix
command! -nargs=+ -complete=file -bar StaticAg
      \ silent! grep! <args>|cwindow|redraw!

command QA qa
command Qa qa
command Q q
command Wq wq
command W w
