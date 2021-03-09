set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set inccommand=split

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

lua << END
  local nvim_lsp = require('lspconfig')

  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.solargraph.setup{
    on_attach = require'completion'.on_attach;
    useBundler = true;
  }
END

" lua <<EOF
"   require'nvim-treesitter.configs'.setup {
"     highlight = {
"       enable = true,
"       custom_captures = {
"         -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
"         ["foo.bar"] = "Identifier",
"       },
"     },
"   }
" EOF

autocmd BufEnter * lua require'completion'.on_attach()
