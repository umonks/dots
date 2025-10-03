return {
	"ellisonleao/gruvbox.nvim",
	init = function()
		local p = require("gruvbox").palette
		require("gruvbox").setup({
			transparent_mode = true,
			overrides = {
				Folded = {
					bg = "none",
					fg = p.bright_aqua,
				},
			},
		})

		vim.cmd.colorscheme("gruvbox")
	end
}
