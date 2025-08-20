local function nnoremap(binding, cmd, opts)
	vim.keymap.set('n', binding, cmd, opts)
end

nnoremap("gd", vim.lsp.buf.definition)
nnoremap("gD", vim.lsp.buf.declaration)
nnoremap("gca", vim.lsp.buf.code_action)

nnoremap("<leader>d", ":bd<CR>")

nnoremap("-", ":Ex<CR>")

local telescope = require("telescope.builtin")

nnoremap("<leader>ff", telescope.find_files)
nnoremap("<leader>ft", telescope.tags)
nnoremap("<leader>fg", telescope.live_grep)
nnoremap("<leader>fm", telescope.marks)
nnoremap("<leader>fw", telescope.lsp_dynamic_workspace_symbols)
nnoremap("<leader>fd", telescope.diagnostics)
nnoremap("gr", telescope.lsp_references)
nnoremap("<leader>rn", vim.lsp.buf.rename)
