return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim'
	},
	config = function()
		local telescope = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", telescope.find_files)
		vim.keymap.set("n", "<leader>ft", telescope.tags)
		vim.keymap.set("n", "<leader>fg", telescope.live_grep)
		vim.keymap.set("n", "<leader>fm", telescope.marks)
		vim.keymap.set("n", "<leader>fd", telescope.diagnostics)
	end
}
