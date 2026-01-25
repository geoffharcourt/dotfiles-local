-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- set leader/localleader early because leader is used at the moment mappings
-- are defined. Changing the (local)leader after a mapping is defined has no
-- effect on the mapping.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Options
vim.o.history = 10000
vim.o.swapfile = false -- http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
vim.o.ruler = true -- show cursor position all the time
vim.o.showcmd = true -- display incomplete commands
vim.o.incsearch = true -- do incremental searching
vim.o.smarttab = true -- insert tabs on the start of a line according to shiftwidth, not tabstop
vim.o.modeline = false --  inspect top/bottom lines of the file for a modeline
vim.o.shiftround = true -- When at 3 spaces and I hit >>, go to 4, not 5.
vim.o.colorcolumn = "+0" -- Set to the textwidth
vim.o.showmode = false
vim.o.winwidth = 85

-- Don't ask me if I want to load changed files. The answer is always 'Yes'
vim.o.autoread = true

-- https://github.com/thoughtbot/dotfiles/pull/170
-- Automatically :write before commands such as :next or :!
vim.o.autowrite = true

-- When the type of shell script is /bin/sh, assume a POSIX-compatible shell for
-- syntax highlighting purposes.
-- More on why: https://github.com/thoughtbot/dotfiles/pull/471
vim.g.is_posix = 1

-- Persistent undo
vim.o.undofile = true -- Create FILE.un~ files for persistent undo
vim.o.undodir = vim.fn.stdpath "config" .. "/undodir"

-- Delete comment character when joining commented lines
vim.opt.formatoptions:append({ j = true })

-- Let mappings and key codes timeout in 100ms (the default is 1 second)
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100

-- Create backups
vim.o.backup = true
vim.o.writebackup = true
vim.o.backupdir = vim.fn.stdpath "config" .. "/backups"
-- setting backupskip to this to allow for 'crontab -e' using vim.
-- thanks to: http://tim.theenchanter.com/2008/07/crontab-temp-file-must-be-ed
if vim.fn.has "unix" then
  vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
end
vim.opt.listchars = { tab = ">-", trail = "~" }

-- Line numbering
-- With relativenumber and number set, shows relative number but has current
-- number on current line.
vim.o.relativenumber = true
vim.o.number = true
vim.o.numberwidth = 3

vim.opt.backspace = { "indent", "eol", "start" } -- allow backspacing over everything in insert mode
vim.o.autoindent = true
vim.o.copyindent = true -- copy previous indentation on autoindenting
vim.o.showmatch = true -- show matching parenthesis

-- make searches case-sensitive only if they contain upper-case characters
vim.o.ignorecase = true
vim.o.smartcase = true

-- Open below and to the right, the same way you read a page
vim.o.splitbelow = true
vim.o.splitright = true

-- Replace all matches on a line
vim.o.gdefault = true

-- This character is prepended to wrapped lines
vim.o.showbreak = "@"
vim.o.wrap = false

-- Autocomplete with dictionary words when spell check is on
vim.opt.complete:append "kspell"
vim.opt.spellfile = vim.fn.stdpath "config" .. "/vim-spell-en.utf-8.add"

vim.o.grepprg = "rg --hidden --vimgrep --with-filename --max-columns 200 --smart-case"
vim.o.grepformat = "%f:%l:%c:%m"

-- Tabs
-- Softtabs, 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.winborder = "rounded"

-- no ex mode
vim.keymap.set("", "Q", "<Nop>")

-- Automatically reselect text after in- or out-denting in visual mode
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- move vertically by _visual_ line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Paste system clipboard contents
vim.keymap.set("n", "<Leader>p", '"*p')
-- Yank to system clipboard
vim.keymap.set("v", "<Leader>y", '"*y')
-- Yank to end of line, like C, D
vim.keymap.set("n", "Y", "y$")

-- Opens a file with the current working directory already filled in so you have to specify only the filename.
vim.keymap.set("n", "<Leader>e", ":e <C-R>=escape(expand('%:p:h'), ' ') . '/'<CR>")
vim.keymap.set("n", "<Leader>v", ":vnew <C-R>=expand(\"%:p:h\") . '/'<CR>")

vim.keymap.set("n", "<Leader>m", ":w<CR>:Move <C-R>%", {})
vim.keymap.set({"n", "v"}, "U", ":echoe 'Disabled lowercasing'<CR>", {})

vim.keymap.set("n", "<Leader><Leader>", "<C-^>")

-- Plugins
require("lazy").setup({
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "nord" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  spec = {
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      ---@type snacks.Config
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = {
          enabled = true,
          animate = {
            enabled = false, -- vim.fn.has("nvim-0.10") == 1
            style = "out",
            easing = "linear",
            duration = {
              step = 20, -- ms per step
              total = 500, -- maximum duration
            },
          },
        },
        input = { enabled = true },
        picker = { enabled = false },
        lazygit = { enabled = true },
        notifier = { enabled = false },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = false },
        words = { enabled = false },
      },
    },
    { "nordtheme/vim" },
    { "lewis6991/fileline.nvim" },
    { "lewis6991/gitsigns.nvim", event = "VeryLazy" },
    { "lewis6991/spaceless.nvim", event = "VeryLazy" },
    {
      "christoomey/vim-tmux-navigator",
      event = "VeryLazy",
      init = function()
        vim.g["tmux_navigator_no_mappings"] = 1
        vim.g["tmux_navigator_save_on_switch"] = 2
      end,
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatorProcessList",
      },
      keys = {
        { "<C-h>", "<cmd>TmuxNavigateLeft<CR>" },
        { "<C-j>", "<cmd>TmuxNavigateDown<CR>" },
        { "<C-k>", "<cmd>TmuxNavigateUp<CR>" },
        { "<C-l>", "<cmd>TmuxNavigateRight<CR>" },
      },
    },
    {
      "christoomey/vim-run-interactive",
      event = "VeryLazy",
      keys = {
        {
          "<Leader>r",
          ":RunInInteractiveShell<Space>",
          desc = "Prompt for interactive shell",
        }
      },
    },
    { "grafana/vim-alloy" },
    { "tpope/vim-abolish" },
    {
      "tpope/vim-rails",
      init = function()
        vim.g.rails_projections = {
          ["Gemfile"] = { command = "gemfile"},
          ["config/routes.rb"] = { command = "routes" },
          ["app/admin/*.rb"] = {
            command = "admin",
            alternate = "spec/controllers/admin/{singular}_controller_spec.rb",
          },
          ["spec/factories/*.rb"] = {
            command = "factory",
            related = "app/models/{singular}.rb",
          },
          ["spec/requests/*_spec.rb"] = {
            command = "request",
            related = "app/controllers/{basename}_controller.rb",
          },
          ["app/queries/*.rb"] = {
            command = "query",
            related = "spec/queries/{}_spec.rb",
          },
          ["app/serializers/*.rb"] = {
            command = "serializer",
            related = "spec/serializers/{}_spec.rb",
          },
          ["config/locales/*.json"] = {
            command = "locale",
            template = "{\n\"{}\": {\n\n}",
          },
          ["app/services/*.rb"] = {
            command = "service",
            alternate = "spec/services/{}_spec.rb",
          },
          ["app/integration_clients/*.rb"] = {
            command = "integration_client",
            alternate = "spec/integration_clients/{}_spec.rb",
          },
          ["app/workers/*.rb"] = {
            command = "worker",
            template = "class {camelcase|capitalize|colons}\n  include Sidekiq::Worker\n\n  def perform\n  end\nend",
            alternate = { "spec/workers/{}_spec.rb" },
          },
          ["spec/*.rb"] = {
            command = "spec",
            alternate = "app/{}_spec.rb",
          },
          ["app/javascript/*.tsx"] = {
            command = "spec",
            alternate = "app/javascript/{}.test.tsx",
          },
          ["app/javascript/*.ts"] = {
            command = "spec",
            alternate = "app/javascript/{}.test.ts",
          }
        }
      end,
    },
    { "pangloss/vim-javascript" },
    { "peitalin/vim-jsx-typescript" },
    {
      "prettier/vim-prettier",
      ft = { "css", "javascript", "typescript", "typescriptreact" },
      init = function()
        vim.g["prettier#autoformat"] = 1
        vim.g["prettier#autoformat_require_pragma"] = 0
        vim.g["prettier#config#config_precedence"] = 'prefer-file'
      end,
      build = "yarn install --frozen-lockfile --production"
    },
    -- Telescope is absolutely magic.
    {
      "nvim-telescope/telescope.nvim",
      branch = "master",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope-live-grep-args.nvim" ,
      },
      config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local open_with_trouble = require("trouble.sources.telescope").open
        local lga_actions = require("telescope-live-grep-args.actions")
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
        telescope.load_extension("advanced_git_search")
        telescope.load_extension("live_grep_args")

        telescope.setup({
          defaults = {
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-t>"] = open_with_trouble,
                ["<C-space>"] = lga_actions.to_fuzzy_refine,
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
                ["<C-]>"] = actions.send_selected_to_qflist,
              },
              n = { ["<C-t>"] = open_with_trouble },
            }
          }
        })
      end,
      keys = {
        -- This is like "<C-R>" in your terminal.
        { "\\", function() require("telescope.builtin").live_grep() end },
        { "K", function() require("telescope-live-grep-args.shortcuts").grep_word_under_cursor() end },
        { "K", function() require("telescope-live-grep-args.shortcuts").grep_visual_selection() end, mode = "v" },
        { "<Leader>b", function() require("telescope.builtin").git_branches() end },
        { "<Leader>g", function() require("telescope.builtin").git_bcommits() end },
        { "<Leader>g", function() require("telescope.builtin").git_bcommits_range() end, mode = "v", },
        { "<Leader>G", function() require("telescope.builtin").git_commits() end },
        { "<C-p>", function() require("telescope.builtin").find_files() end },
        { "<C-r>", function() require("telescope.builtin").commands() end, mode = "c" },
      }
    },
    {
      "aaronhallaert/advanced-git-search.nvim",
      cmd = { "AdvancedGitSearch" },
      dependencies = {
        "nvim-telescope/telescope.nvim",
        -- to show diff splits and open commits in browser
        "tpope/vim-fugitive",
        -- to open commits in browser with fugitive
        "tpope/vim-rhubarb",
        -- optional: to replace the diff from fugitive with diffview.nvim
        -- (fugitive is still needed to open in browser)
        "sindrets/diffview.nvim",
      }
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    -- Use (ported version of) FZF for better performance and to support FZF syntax
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
    {
      "axkirillov/easypick.nvim",
      event = "VeryLazy",
      dependencies = { "nvim-telescope/telescope.nvim" },
      config = function()
        local easypick = require("easypick")
        local get_default_branch = "git symbolic-ref --short refs/remotes/origin/HEAD"
        local base_branch = vim.fn.system(get_default_branch) or "main"

        easypick.setup({
          pickers = {
            -- diff current branch with base_branch and show files that changed with respective diffs in preview
            {
              name = "changed_files",
              command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
              previewer = easypick.previewers.branch_diff({base_branch = base_branch})
            },
            -- list files that have conflicts with diffs in preview
            {
              name = "conflicts",
              command = "git diff --name-only --diff-filter=U --relative",
              previewer = easypick.previewers.file_diff()
            },
          },
        })
      end
    },
    {
      "folke/trouble.nvim",
      event = "VeryLazy",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<Leader>d",
          "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<Leader>D",
          "<cmd>Trouble diagnostics toggle<CR>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<Leader>cs",
          "<cmd>Trouble symbols toggle focus=false<CR>",
          desc = "Symbols (Trouble)",
        },
        {
          "<Leader>o",
          "<cmd>Trouble loclist toggle<CR>",
          desc = "Location List (Trouble)",
        },
        {
          "<Leader>q",
          "<cmd>Trouble qflist toggle<CR>",
          desc = "Quickfix List (Trouble)",
        },
        {
          "[r",
          "<cmd>Trouble prev<CR> <cmd>Trouble jump<CR>",
          desc = "Previous Trouble item",
        },
        {
          "]r",
          "<cmd>Trouble next<CR> <cmd>Trouble jump<CR>",
          desc = "Next Trouble item",
        },
      },
    },
    {
      "AckslD/nvim-neoclip.lua",
      event = "VeryLazy",
      dependencies = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("neoclip").setup()
      end,
      keys = {
        { '"', ":Telescope neoclip<CR>" },
        { "<C-x>", "<Esc>:Telescope neoclip<CR>", mode = "i" },
      },
    },
    {
      "janko-m/vim-test",
      init = function()
        vim.g["test#ruby#minitest#executable"] = "bundle exec rake test"
        vim.g["test#runner_commands"] = { "RSpec" }
        vim.g["test#strategy"] = "dispatch"
        vim.g["test#ruby#rspec#options"] = {
          nearest = "--format documentation",
          file = "--format documentation",
        }
      end,
      keys = {
        { "<Leader>a", ":w<CR>:TestAll<CR>" },
        { "<Leader>l", ":w<CR>:TestLast --only-failures<CR>" },
        { "<Leader>s", ":w<CR>:TestNearest<CR>" },
        { "<Leader>t", ":w<CR>:TestFile<CR>" },
      },
      event = "VeryLazy",
    },
    { "tpope/vim-dispatch", event = "VeryLazy"  },
    { "tpope/vim-repeat", event = "VeryLazy"  },
    { "tpope/vim-surround", event = "VeryLazy" },
    { "tpope/vim-vinegar" },
    { "tpope/vim-eunuch", event = "VeryLazy" },
    { "tpope/vim-bundler", event = "VeryLazy" },
    { "nelstrom/vim-textobj-rubyblock", dependencies = { "kana/vim-textobj-user" } },
    { "tpope/vim-rake" },
    { "tpope/vim-projectionist" },
    { "vim-ruby/vim-ruby" },
    { "pbrisbin/vim-mkdir" },
    { "tpope/vim-unimpaired" },
    { "junegunn/rainbow_parentheses.vim" },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function() require("lualine").setup() end
    },
    {
      "AndrewRadev/splitjoin.vim",
      config = function()
        vim.g["splitjoin_trailing_comma"] = 1
        vim.g["splitjoin_curly_brace_padding"] = 1
        vim.g["splitjoin_ruby_options_as_arguments"] = 1
        vim.g["splitjoin_ruby_hanging_args"] = 0
        vim.g["splitjoin_ruby_curly_braces"] = 0
      end,
    },
    -- LSP stuff
    { "pmizio/typescript-tools.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
    -- { "luals/lua-language-server" },
    { "neovim/nvim-lspconfig" },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        -- nvim-cmp source for words in the buffer
        "hrsh7th/cmp-buffer",
        -- Autocomplete filesystem paths as you type them. Neat!
        "hrsh7th/cmp-path",
        "andersevenrud/cmp-tmux",
        "onsails/lspkind-nvim",
      },
      config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        -- `has_words_before` and the functions that use it are copied from
        -- the nvim-cmp README.
        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
        end

        cmp.setup({
          mapping = cmp.mapping.preset.insert({
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
          }),

          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path" },
            {
              name = "buffer",
              option = {
                get_bufnrs = function()
                  -- return vim.api.nvim_list_bufs()
                  -- Complete from open buffers
                  local bufs = {}
                  for _, win in ipairs(vim.api.nvim_list_wins()) do
                    bufs[vim.api.nvim_win_get_buf(win)] = true
                  end
                  return vim.tbl_keys(bufs)
                end,
              },
            },
            { name = "tmux" },
          }),

          sorting = {
            comparators = {
              function(...)
                -- Prefer words that are closer
                return require("cmp_buffer"):compare_locality(...)
              end,
            },
          },

          formatting = {
            format = lspkind.cmp_format({
              mode = "symbol", -- show only symbol annotations
              maxwidth = {
                -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                -- can also be a function to dynamically calculate max width such as
                -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                menu = 30, -- leading text (labelDetails)
                abbr = 30, -- actual suggestion item
              },
              ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
              show_labelDetails = true, -- show labelDetails in menu. Disabled by default

              -- The function below will be called before any actual modifications from lspkind
              -- so that you can provide more controls on popup customization. arguments are (entry, vim_item)
              -- (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
              before = function (_, vim_item)
                -- ...
                return vim_item
              end
            })
          },
        })
      end,
    },
  },
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function() vim.cmd(":RainbowParentheses") end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    -- Helper function for mapping keybindings
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method "textDocument/formatting" then
      local augroup = vim.api.nvim_create_augroup("autoformat", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.py", "*.rb" },
        group = augroup,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end

    local t = require("telescope.builtin")

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map("<C-]>", t.lsp_definitions, "[G]oto [D]efinition")
    map("gd", t.lsp_definitions, "[G]oto [D]efinition")

    -- Find references for the word under your cursor.
    map("gr", t.lsp_references, "[G]oto [R]eferences")

    -- Rename the variable under your cursor.
    map("gR", vim.lsp.buf.rename, "[R]ename")

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map("<Leader>D", t.lsp_type_definitions, "Type [D]efinition")

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map("<Leader>ds", t.lsp_document_symbols, "[D]ocument [S]ymbols")

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    map("<Leader>ws", t.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map("<Leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
  end,
})

-- comment line or selection, can't get these to work with vim.keymap.set
vim.cmd[[
  nmap <C-\> gcc
  vmap <C-\> gcc
]]

vim.diagnostic.config({
  virtual_text = { current_line = true }
})

require("typescript-tools").setup({})
vim.lsp.config("ruby_lsp", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  cmd = { vim.fn.expand "~/.asdf/shims/ruby-lsp" },
  init_options = {
    formatter = "auto",
    linters = { "auto" },
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
})
vim.lsp.enable("ruby_lsp")
vim.lsp.config("lua_ls", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    Lua = {
      diagnostics = {
        -- Tell the language server to recognize the `vim` global
        globals = {
          "vim",
        },
      },
    },
  },
})
vim.lsp.enable("lua_ls")

-- vim-plug loads all the filetype, syntax and colorscheme files, so turn them on
-- _after_ loading plugins.
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1

vim.cmd [[
  runtime macros/matchit.vim
  filetype plugin indent on
  syntax enable
  colorscheme nord
]]

vim.api.nvim_create_user_command("Bundle", "Dispatch bundle install", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Q", "q", {})

-- experiments
--
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
