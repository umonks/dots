local m = {}

function m.setup()
  local tele = require("telescope")

  tele.setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          -- even more opts
        }
      }
    }
  })

  tele.load_extension("ui-select")


  local builtin = require("telescope.builtin")

  vim.keymap.set('n', '<leader> ', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

return m
