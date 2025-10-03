-- leader
vim.keymap.set("n", "<space>", "<Ignore>", { silent = true, remap = true })
-- vim.keymap.set("n", "<space>", "<space>", { silent = true, remap = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clipboard
vim.o.clipboard = "unnamedplus"

-- colours
vim.o.background = "dark"
vim.o.termguicolors = true

-- search higlighting
vim.o.hlsearch = false

-- line numbers
vim.wo.nu = true
vim.wo.rnu = true

-- mouse integration
vim.o.mouse = 'a'

-- tab behaviour
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- newline wrap indenting
vim.o.breakindent = true

-- undo history
vim.o.undofile = true

-- search casing
vim.o.ignorecase = true
vim.o.smartcase = true

-- signcolumn
vim.wo.signcolumn = "number"

-- completeopt
vim.o.completeopt = "menuone,noinsert,preview"

vim.o.winborder = "rounded"

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = { import = "plugins" },
	install = { colorscheme = { "gruvbox" } },
	checker = { enabled = true },
	ui = {
		border = "rounded",
	},
})

require("keymaps")
require("fold")
