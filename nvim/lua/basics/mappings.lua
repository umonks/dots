local m = {}
function m.setup()
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	vim.o.hlsearch = false

	vim.wo.nu = true
	vim.wo.rnu = true

	vim.o.mouse = "a"

	vim.o.clipboard = "unnamedplus"

	vim.o.undofile = true

	vim.o.ignorecase = true
	vim.o.smartcase = true

	vim.o.updatetime = 250
	vim.o.timeoutlen = 300

	vim.o.completeopt = "menuone,noselect"

	vim.o.termguicolors = true
end

return m
