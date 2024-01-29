local m = {}

local function mappings_callback(ev)
	-- enable completion
	vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

	-- Buffer mappings
	local opts = { buffer = ev.buf }

	local nnoremap = function(mapping, callback)
		vim.keymap.set("n", mapping, callback, opts)
	end

	---
	-- Navigation
	nnoremap("gd", vim.lsp.buf.definition)
	nnoremap("gi", vim.lsp.buf.implementation)

	---
	-- Info
	nnoremap("K", vim.lsp.buf.hover)
	nnoremap("<C-k>", vim.lsp.buf.signature_help)

	---
	-- Refactoring
	nnoremap("<leader>rn", vim.lsp.buf.rename)
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
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
		ensure_installed = {"lua_ls"}
	})

	mason_lspconfig.setup_handlers({
       		function (server_name) -- default handler (optional)
       		    lspconfig[server_name].setup {}
       		end,
	})

	setup_mappings()
end

return m
