-- =======================
-- === set map leaders ===
-- =======================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- =========================
-- === Install Lazy.nvim ===
-- =========================
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- =======================
-- === install plugins ===
-- =======================
require('lazy').setup(require("packages"), {})

-- =======================
-- === set vim options ===
-- =======================
vim.o.background = "dark"
vim.cmd.colorscheme 'gruvbox'

-- Set highlight on search
vim.o.hlsearch = false

-- Make relative line numbers default
vim.wo.nu = true
vim.wo.rnu = true

-- enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

vim.o.tabstop = 4

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: Not all terminals support this
vim.o.termguicolors = true

-- Basic keymaps
require("keymaps").setup()

-- =============================
-- === enable yank highlight ===
-- =============================
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require("illuminate").configure({
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },

  delay = 1000,
})

-- ===========================
-- === configure telescope ===
-- ===========================
require("conf.telescope").setup()
-- ============================
-- === configure treesitter ===
-- ============================
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
require("conf.treesitter").setup()

-- =====================
-- === configure LSP ===
-- =====================
--  This function gets run when an LSP connects to a particular buffer.
require("conf.mason").setup()

-- document existing key chains
require('which-key').register({
  ['c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['h'] = { name = 'More git', _ = 'which_key_ignore' },
  ['r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['t'] = { name = '[T]elescope', _ = 'which_key_ignore' },
  ['w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  ['d'] = { name = '[D]iagnostics', _ = 'which_key_ignore' },
}, {
  prefix = "<leader>",
  noremap = true,
})

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    border = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<C-y>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
}
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- vim: ts=2 sts=2 sw=2 et
