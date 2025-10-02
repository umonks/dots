return {
	"rcarriga/nvim-notify",
	opts = {
		stages = "slide",
		background_colour = "#000000",
	},
	init = function()
		vim.notify = require("notify")
	end
}
