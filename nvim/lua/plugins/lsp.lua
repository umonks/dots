return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("ls-attach", { clear = true }),
			callback = function()
				vim.api.nvim_create_autocmd({ "BufWritePost" }, {
					callback = function()
						vim.lsp.buf.format()
					end
				})
				local function nnoremap(binding, cmd, opts)
					vim.keymap.set('n', binding, cmd, opts)
				end

				local telescope = require("telescope.builtin")

				nnoremap("<leader>fw", telescope.lsp_dynamic_workspace_symbols)
				nnoremap("gr", telescope.lsp_references)
				nnoremap("gI", telescope.lsp_implementations)
				nnoremap("gd", vim.lsp.buf.definition, { desc = "Go to definition" })
				nnoremap("gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
				nnoremap("gca", vim.lsp.buf.code_action, { desc = "Get code actions" })
				nnoremap("<leader>rn", vim.lsp.buf.rename)
			end
		})
	end,
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					border = "rounded",
				},
			},
			dependencies = { "stevearc/dressing.nvim" },
		},

		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = { "lua_ls", "gopls", "pyright" }
			},
		},

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
