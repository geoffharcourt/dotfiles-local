function! tags#EchoTagFiles()
  echo join(split(&tags, ","), "\n")
endfunction
