local m = {}

local function mappings_callback(ev)
	-- enable completion
	vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

	-- Buffer mappings
	local opts = { buffer = ev.buf }

	local nnoremap = function(mapping, callback)
		vim.keymap.set("n", mapping, callback, opts)
	end

	local builtin = require("telescope.builtin")
	---
	-- Navigation
	nnoremap("gd", builtin.lsp_definitions)
	nnoremap("gi", builtin.lsp_implementations)

	---
	-- Info
	nnoremap("<leader>fs", builtin.lsp_document_symbols)
	nnoremap("K", vim.lsp.buf.hover)
	nnoremap("<C-k>", vim.lsp.buf.signature_help)

	---
	-- Refactoring
	nnoremap("<leader>rn", vim.lsp.buf.rename)
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

	vim.api.nvim_buf_create_user_command(ev.buf, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			vim.lsp.buf.format()
		end
	})
end

local function setup_mappings()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = mappings_callback
	})
end

function m.setup()
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local lspconfig = require("lspconfig")

	require("neodev").setup({})
	mason.setup()

	mason_lspconfig.setup({
		ensure_installed = { "lua_ls" }
	})

	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	mason_lspconfig.setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities
			})
		end,
	})

	setup_mappings()
end

return m
