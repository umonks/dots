local function nnoremap(binding, cmd, opts)
	vim.keymap.set('n', binding, cmd, opts)
end

nnoremap("gd", vim.lsp.buf.definition, { desc = "Go to definition" })
nnoremap("gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
nnoremap("gca", vim.lsp.buf.code_action, { desc = "Get code actions" })

nnoremap("<leader>d", ":bd<CR>")

nnoremap("-", ":Ex<CR>")

nnoremap("<leader>rn", vim.lsp.buf.rename)
