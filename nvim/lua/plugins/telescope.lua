--------------------------------------------------------------------------------
--                 Telescope (nvim-telescope/telescope.nvim)                  --
--------------------------------------------------------------------------------

-- Enable native fuzzy finding (ripgrep)
pcall(require('telescope').load_extension, 'fzf')

-- Enable harpoon support
require('telescope').load_extension('harpoon')

local map = vim.keymap.set
map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

map('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>fr', require('telescope.builtin').live_grep, { desc = '[S]earch by [R]g' })
map('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

