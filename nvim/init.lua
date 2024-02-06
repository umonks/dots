require("plugins").setup()

require("mason-conf").setup()
require("basics.opts").setup()
require("basics.colors"):setup()

require("completion").setup()
require("lsp.lspconfig").setup()

require("telescope-conf").setup()
vim.defer_fn(require("treesitter").setup, 0)

-- vim: ts=2 sts=2 sw=2 et
