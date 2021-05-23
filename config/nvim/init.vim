set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set inccommand=split

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

lua << END
  local nvim_lsp = require('lspconfig')

  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.solargraph.setup{
    useBundler = true;
  }
  require'lspconfig'.cssls.setup{}
  require'lspconfig'.diagnosticls.setup{
    filetypes = {
      'ruby',
      'typescript',
      'typescriptreact',
      'javascript',
      'sh',
      'css',
      'scss'
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
          sourceName = 'eslint',
          parseJson = {
            errorsRoot = '[0].messages',
            line = 'line',
            column = 'column',
            endLine = 'endLine',
            endColumn = 'endColumn',
            message = '[eslint] ${message} [${ruleId}]',
            security = 'severity'
          },
          securities = {
            [2] = 'error',
            [1] = 'warning'
          }
        },
        rubocop = {
          command = 'rubocop',
          rootPatterns = { ".git" },
          sourceName = 'rubocop',
          debounce = 100,
          args = {
            '--format',
            'json',
            '--force-exclusion',
            '--stdin',
            '%filepath'
          },
          parseJson = {
            errorsRoot = 'files[0].offenses',
            line = 'location.start_line',
            endLine = 'location.last_line',
            column = 'location.start_column',
            endColumn = 'location.end_column',
            message = '[${cop_name}] ${message}',
            security = 'severity'
          },
          securities = {
            fatal = 'error',
            error = 'error',
            warning = 'warning',
            convention = 'info',
            refactor = 'info',
            info = 'info'
          }
        },
        stylelint = {
          command = 'stylelint',
          rootPatterns = {
            '.git'
          },
          debounce = 100,
          args = {
            '--formatter',
            'json',
            '--stdin-filename',
            '%filepath'
          },
          sourceName = 'stylelint',
          parseJson = {
            errorsRoot = '[0].warnings',
            line = 'line',
            column = 'column',
            message = '${text}',
            security = 'severity'
          },
          securities = {
            error = 'error',
            warning = 'warning'
          }
        },
        shellcheck = {
          command = 'shellcheck',
          debounce = 100,
          args = {
            '--format',
            'json',
            '-'
          },
          sourceName = 'shellcheck',
          parseJson = {
            line = 'line',
            column = 'column',
            endLine = 'endLine',
            endColumn = 'endColumn',
            message = '${message} [${code}]',
            security = 'level'
          },
          securities = {
            error = 'error',
            warning = 'warning',
            info = 'info',
            style = 'hint'
          }
        }
      },
      filetypes = {
        javascript = 'eslint',
        typescript = 'eslint',
        typescriptreact = 'eslint',
        ruby = 'rubocop',
        sh = 'shellcheck',
        css = 'stylelint',
        scss = 'stylelint'
      },
      formatters = {
        prettierEslint = {
          command = 'prettier-eslint',
          args = { '--stdin' },
          rootPatterns = { '.git' },
        },
        prettier = {
          command = 'prettier',
          args = { '--stdin-filepath', '%filename' }
        }
      },
      formatFiletypes = {
        css = 'prettier',
        javascript = 'prettierEslint',
        javascriptreact = 'prettierEslint',
        json = 'prettier',
        scss = 'prettier',
        typescript = 'prettierEslint',
        typescriptreact = 'prettierEslint'
      }
    }
  }
END

nnoremap <silent><Leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

lua << EOF
  local saga = require 'lspsaga'
  saga.init_lsp_saga()
EOF

sign define LspDiagnosticsSignError text=E texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=W texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=I texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=H texthl=LspDiagnosticsSignHint linehl= numhl=

augroup UPDATE_DIAGNOSTICS_LOCLIST
	autocmd!
	autocmd InsertLeave * lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
	autocmd User LspDiagnosticsChanged lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
augroup END

" === nvim-compe ===
lua << EOF
  vim.o.completeopt = "menuone,noselect"
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      nvim_lua = true;
    };
  }
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      return true
    else
      return false
    end
  end
  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end

  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    else
      return t "<S-Tab>"
    end
  end
  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR> compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })
set completeopt-=i,t,preview
set shortmess+=c
