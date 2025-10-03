vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.o.foldlevelstart = 5
vim.o.foldcolumn = "0"
vim.o.fillchars = "fold: "

local function trim(s)
	return s:match("^%s*(.-)%s*$")
end

function _G.CustomFoldText()
	local indent = string.rep(" ", (vim.v.foldlevel - 1) * vim.o.tabstop)
	return indent .. trim(vim.fn.getline(vim.v.foldstart)) .. ' ... ' .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "") .. "    " .. (vim.v.foldend - vim.v.foldstart) .. " lines"
end

vim.o.foldtext = "v:lua.CustomFoldText()"

