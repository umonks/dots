local m = {}

function m.setup()
  local tele = require("telescope")
  local builtin = require("telescope.builtin")

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

  -- Telescope live_grep in git root
  -- Function to find the git root directory based on the current buffer's path
  local function find_git_root()
    -- Use the current buffer's path as the starting point for the git search
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    -- If the buffer is not associated with a file, return nil
    if current_file == "" then
      current_dir = cwd
    else
      -- Extract the directory from the current file's path
      current_dir = vim.fn.fnamemodify(current_file, ":h")
    end

    -- Find the Git root directory from the current file's path
    local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
      print("Not a git repository. Searching on current working directory")
      return cwd
    end
    return git_root
  end

  -- Custom live_grep function to search in git root
  local function live_grep_git_root()
    local git_root = find_git_root()
    if git_root then
      builtin.live_grep({
        search_dirs = { git_root },
      })
    end
  end

  -- See `:help telescope.builtin`
  vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
  vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 0,
      previewer = true,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
  vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope [F]iles' })
  vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[T]elescope [H]elp' })
  vim.keymap.set('n', '<leader>tw', builtin.grep_string, { desc = '[T]elescope current [W]ord' })
  vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = '[T]elescope by [G]rep' })
  vim.keymap.set('n', '<leader>tG', live_grep_git_root, { desc = '[T]elescope by [G]rep on Git Root' })
  vim.keymap.set('n', '<leader>tD', builtin.diagnostics, { desc = '[T]elescope [D]iagnostics' })
  vim.keymap.set('n', '<leader>tr', builtin.resume, { desc = '[T]elescope [R]esume' })
end

return m
