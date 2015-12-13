function! yank#YankToOSXClipboard()
  call system('pbcopy', @@)
endfunction
