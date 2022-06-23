set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set inccommand=split

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

nnoremap <silent><Leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarning linehl= numhl=
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInformation linehl= numhl=
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=

" Key bindings can be changed, see below
call wilder#setup({'modes': [':']})
call wilder#set_option('use_python_remote_plugin', 0)

call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': [
      \   wilder#lua_pcre2_highlighter(),
      \   wilder#lua_fzy_highlighter(),
      \ ],
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ 'left': [
      \   ' ',
      \   wilder#popupmenu_devicons(),
      \ ],
      \ }))

lua << END
  require("hlslens").setup({
    calm_down = true,
    nearest_only = true,
  })
  require("lualine").setup({
    options = { theme = 'onedark' }
  })
  require("trouble").setup{}

  require("lspconfig").tsserver.setup{}
  require("lspconfig").solargraph.setup{
    useBundler = true;
  }
  require("lspconfig").cssls.setup{}
  require("lspconfig").diagnosticls.setup{
    filetypes = {
      "ruby",
      "typescript",
      "typescriptreact",
      "javascript",
      "sh",
      "css",
      "scss"
    },
    init_options = {
      linters = {
        eslint = {
          command = "eslint_d",
          rootPatterns = { ".git" },
          debounce = 100,
          args = {
            "--cache",
            "--stdin",
            "--stdin-filename",
            "%filepath",
            "--format",
            "json"
          },
          sourceName = "eslint",
          parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "[eslint] ${message} [${ruleId}]",
            security = "severity"
          },
          securities = {
            [2] = "error",
            [1] = "warning"
          }
        },
        rubocop = {
          command = "rubocop",
          rootPatterns = { ".git" },
          sourceName = "rubocop",
          debounce = 100,
          args = {
            "--format",
            "json",
            "--force-exclusion",
            "--stdin",
            "%filepath"
          },
          parseJson = {
            errorsRoot = "files[0].offenses",
            line = "location.start_line",
            endLine = "location.last_line",
            column = "location.start_column",
            endColumn = "location.end_column",
            message = "[${cop_name}] ${message}",
            security = "severity"
          },
          securities = {
            fatal = "error",
            error = "error",
            warning = "warning",
            convention = "info",
            refactor = "info",
            info = "info"
          }
        },
        stylelint = {
          command = "stylelint",
          rootPatterns = {
            ".git"
          },
          debounce = 100,
          args = {
            "--formatter",
            "json",
            "--stdin-filename",
            "%filepath"
          },
          sourceName = "stylelint",
          parseJson = {
            errorsRoot = "[0].warnings",
            line = "line",
            column = "column",
            message = "${text}",
            security = "severity"
          },
          securities = {
            error = "error",
            warning = "warning"
          }
        },
        shellcheck = {
          command = "shellcheck",
          debounce = 100,
          args = {
            "--format",
            "json",
            "-"
          },
          sourceName = "shellcheck",
          parseJson = {
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${code}]",
            security = "level"
          },
          securities = {
            error = "error",
            warning = "warning",
            info = "info",
            style = "hint"
          }
        }
      },
      filetypes = {
        javascript = "eslint",
        typescript = "eslint",
        typescriptreact = "eslint",
        ruby = "rubocop",
        sh = "shellcheck",
        css = "stylelint",
        scss = "stylelint"
      },
      formatters = {
        prettierEslint = {
          command = "prettier-eslint",
          args = { "--stdin" },
          rootPatterns = { ".git" },
        },
        prettier = {
          command = "prettier",
          args = { "--stdin-filepath", '%filename' }
        }
      },
      formatFiletypes = {
        css = "prettier",
        javascript = "prettierEslint",
        javascriptreact = "prettierEslint",
        json = "prettier",
        scss = "prettier",
        typescript = "prettierEslint",
        typescriptreact = "prettierEslint"
      }
    }
  }

  require("lspconfig").jsonls.setup{}
  require("lspconfig").vimls.setup{}
  require("lspconfig").sqls.setup{}

  require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
  })

  -- Setup nvim-cmp.
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end

  local cmp = require("cmp")
  local lspkind = require("lspkind")

  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        menu = ({
         buffer = "[Buffer]",
         nvim_lsp = "[LSP]",
         nvim_lua = "[Lua]",
         tmux = "[tmux]",
         path = "[path]",
       })
      })
    },
    mapping = {
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = function(fallback)
        if not cmp.select_next_item() then
          if vim.bo.buftype ~= "prompt" and has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if not cmp.select_prev_item() then
          if vim.bo.buftype ~= "prompt" and has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end
      end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
    }, {
      { name = "buffer" },
      { name = "tmux" },
      { name = "path" }
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline("/", {
    -- sources = {
      -- { name = "buffer" }
    -- }
  -- })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline(":", {
    -- sources = cmp.config.sources({
      -- { name = "path" }
    -- }, {
      -- { name = "cmdline" }
    -- })
  -- })
END

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

""
" nvim-cmp autocomplete colors
""
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
