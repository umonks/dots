return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "lua_ls", "gopls", "pyright" }
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
				dependencies = { "stevearc/dressing.nvim" },
		},

		"neovim/nvim-lspconfig",

		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
}
