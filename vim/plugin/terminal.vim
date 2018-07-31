" === Neovim terminal mappings from @devinrm ===
if has('nvim')
  augroup TerminalNumbers
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END

  augroup TerminalExitStatus
    autocmd!
    autocmd TermClose * call feedkeys("\<CR>")
  augroup END

  augroup TerminalInsert
    autocmd!
    autocmd BufEnter * if &buftype == 'terminal' |:startinsert| endif
  augroup END
endif
