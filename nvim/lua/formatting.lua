vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

require("conform").setup({
	formatters = {
		prettierd = {
			command = "prettierd",
			filetypes = { "javascript", "typescript", "html" },
			args = { "$FILENAME" }, -- Essential for parser inference
			cwd = require("conform.util").root_file({ ".prettierrc", ".editorconfig" }),
			stdin = true,  -- Required for daemon operation
		}
	},
	formatters_by_ft = {
		javascript = { "prettierd" },
		html = { "prettierd" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	async = true,
	lsp_format = "fallback",
})
