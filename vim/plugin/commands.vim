" Run Ag, show results in quickfix
command! -nargs=+ -complete=file -bar StaticAg
      \ silent! grep! <args>|cwindow|redraw!
