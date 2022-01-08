
-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dracula"
lvim.lsp.automatic_servers_installation = true
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
-- lualine config
lvim.builtin.lualine.style = "default" -- default or "none" Or lvim (default lunarvim line)
-- lvim.builtin.lualine.options.theme = "dracula"

-- lvim.builtin.lualine.sections.lualine_c = { "diff" }
local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_x = {
  components.lsp,
  components.diff,
  components.python_env,
  components.filetype,
  components.treesitter,
}

lvim.builtin.lualine.sections.lualine_c = {
  components.filename,
  -- components.spaces,
}

lvim.builtin.lualine.options.component_separators = { left = '|', right = '|' }
lvim.builtin.lualine.options.section_separators = { left = '|', right = '|'}
-- lvim.builtin.lualine.options.section_separators = { right = '', left = ''}

-- custum_lualine Lunarvim
local colors = {
  color2 = "#1d3b53",
  color3 = "#7fdbca",
  color4 = "#e6e1cf",
  color5 = "#14191f",
  color13 = "#b8cc52",
  color10 = "#073642",
  color8 = "#c792ea",
  black = "#011627",
  magneta = "#fc514e",
}

lvim.builtin.lualine.options.theme = {
  normal = {
    a = { fg = colors.color10, bg = colors.magneta, gui = "bold" },
    b = { fg = colors.color4, bg = colors.black },
    c = { fg = colors.color4, bg = colors.color2 },
    -- x = { fg = colors.color3, bg = colors.color10 },
    -- z = { fg = colors.color4, bg = colors.color5 },
  },
  insert = {
    a = { fg = colors.color10, bg = colors.color8, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  visual = {
    a = { fg = colors.color2, bg = colors.color3, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  replace = {
    a = { fg = colors.color2, bg = colors.color8, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  inactive = {
    c = { fg = colors.color4, bg = colors.color2 },
    a = { fg = colors.color4, bg = colors.color5, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
}

lvim.transparent_window = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "php",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Prettier configuration
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "json",
      "markdown",
    },
  },
}

-- ESLint
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint",
        filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
    },
  },
}

-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"},
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
    "prettier/vim-prettier"
   },
   {
    "mg979/vim-visual-multi"
   },
   {
    'overcache/NeoSolarized'
   },
  {'EdenEast/nightfox.nvim'},
  {'bluz71/vim-nightfly-guicolors'},
  {'Mofiqul/dracula.nvim'},
  {
    'jacoborus/tender.vim'
  },
  {
   "lukas-reineke/indent-blankline.nvim",
   event = "BufRead",
   setup = function()
     vim.g.indentLine_enabled = 1
     vim.g.indent_blankline_char = "▏"
     vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
     vim.g.indent_blankline_buftype_exclude = {"terminal"}
     vim.g.indent_blankline_show_trailing_blankline_indent = true
     vim.g.indent_blankline_show_first_indent_level = true
   end
   },
  {
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  },
}

local luasnip = require("luasnip")

-- html snippets in javascript and javascriptreact
luasnip.snippets = {
  html = {}
}

luasnip.snippets.javascript = luasnip.snippets.html
luasnip.snippets.javascriptreact = luasnip.snippets.html
luasnip.snippets.typescriptreact = luasnip.snippets.html

require("luasnip/loaders/from_vscode").load({include = {"html"}})
require("luasnip/loaders/from_vscode").lazy_load()


-- Untuk tanpilkan kursor garis vertikal
vim.cmd("set cursorcolumn")

-- keymapping untuk move line <Alt+j> untuk move ke bawah, <Alt+k> untuk move ke atas
vim.cmd([[
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv
]])

vim.cmd('set foldmethod=indent')
-- vim.cmd('set wrap linebreak')
require('lspconfig').tailwindcss.setup{}
