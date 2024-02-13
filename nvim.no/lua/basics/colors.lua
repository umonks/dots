local m = {
	color = ""
}

function m.gruvbox()
	vim.o.background = "dark"
	-- Default options:
	require("gruvbox").setup({
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "soft", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = true,
	})
	vim.cmd("colorscheme gruvbox")
end

function m.tokyo()
	require("tokyonight").setup({
		transparent = true,
	})
	vim.cmd("colorscheme tokyonight-moon")
end

function m:setup()
	vim.keymap.set("n", "<leader>col", function()
		if (m.color == "gruvbox") then
			m.tokyo()
			m.color = "tokyo"
		else
			m.gruvbox()
			m.color = "gruvbox"
		end
	end)
	m.gruvbox()
end

return m
