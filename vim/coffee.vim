autocmd BufRead,BufNewFile *.cjsx.erb setlocal filetype=coffee

augroup coffeescript
  autocmd!
  autocmd Filetype coffee setlocal tags=/Users/geoff/cortex/.git/coffeetags
augroup END
