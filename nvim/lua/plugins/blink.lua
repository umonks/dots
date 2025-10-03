return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		sources = {
			-- add lazydev to your completion providers
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
		signature = { enabled = true },
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
			},
			menu = {
				border = "rounded",
				draw = { gap = 2 },
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},
		},
	},

	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},

		{ "rafamadriz/friendly-snippets" }
	}
}
