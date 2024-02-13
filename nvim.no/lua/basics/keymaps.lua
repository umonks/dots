local m = {}

function m.setup()
	vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>	return nil, err<CR>}<ESC>")
end

return m
