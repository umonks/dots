local m = {}

function m.setup()
  local ts = require("nvim-treesitter.configs")
  local langs = { "c", "lua", "go", "html", "rust", "javascript", "typescript" }

  ts.setup({
    ensure_installed = langs,
    auto_install = true,
    ignore_install = {},
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return m
