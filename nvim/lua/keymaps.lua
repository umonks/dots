local keymaps = {}

function keymaps.setup()
  -- Keymaps for better default experience
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  -- Remap for dealing with word wrap
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

  -- Buffers
  vim.keymap.set('n', '<leader>bd', function() vim.api.nvim_buf_delete(0, {}) end, { desc = 'Delete current buffer' })
  vim.keymap.set('n', '<leader>sv', function()
      vim.cmd('vsplit')
      local win = vim.api.nvim_get_current_win()
      local buf = vim.api.nvim_create_buf(true, true)
      vim.api.nvim_win_set_buf(win, buf)
    end,
    { desc = 'split current buffer' }
  )


  -- Misc
  vim.keymap.set('n', '<leader>ee', "oif err != nil {<cr>}<esc>O", { desc = "Check error in go" })

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

return keymaps
