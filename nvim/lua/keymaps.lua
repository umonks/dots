local function nnoremap(binding, cmd, opts)
	vim.keymap.set('n', binding, cmd, opts)
end

nnoremap("<leader>d", ":bd<CR>")
nnoremap("-", ":Ex<CR>")
