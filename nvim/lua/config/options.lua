-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clipboard
vim.o.clipboard = "unnamedplus"

-- colours
vim.o.background = "dark"
vim.o.termguicolors = true
vim.cmd.colorscheme "gruvbox"

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

-- update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- completeopt
vim.o.completeopt = "menuone,noinsert,preview"
