local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-o>', builtin.oldfiles, { desc = 'Search [O]pened files' })
vim.keymap.set('n', '<C-b>', builtin.buffers, { desc = 'Search [B]uffers' })
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Search [P]aths / Files' })
vim.keymap.set('n', '<C-h>', builtin.help_tags, { desc = 'Search [H]elp' })
vim.keymap.set('n', '<C-w>', builtin.grep_string, { desc = 'Search current [W]ord' })
vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = 'Search by [G]rep' })
vim.keymap.set('n', '<C-e>', builtin.diagnostics, { desc = 'Search [E]rrors / Diagnostics' })

-- Search Linux Kernel Documentation
vim.keymap.set('n', '<C-l>',
  ":Telescope live_grep search_dirs={'Documentation/'} prompt_title=\\ Linux\\ Kernel\\ Documentation\\ <cr>",
  { desc = 'Search [L]inux Documentation' })

-- TODO: Doesn't work. Maybe it needs FZF?
-- Anyway's it's a nice to have. Can get by with /
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
