local m = {}

function m.setup()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })
end

return m
