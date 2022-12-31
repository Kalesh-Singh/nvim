local builtin = require('telescope.builtin')

-- <C-o> is used for jump list navigation along with <C-i>
vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[S]earch [O]pened files' })
vim.keymap.set('n', '<C-b>', builtin.buffers, { desc = 'Search [B]uffers' })
-- <C-f> is used for symbol search from LSP
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Search [P]aths / Files' })
-- <C-h> is for pane navigation
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search [H]elp' })
vim.keymap.set('n', '<C-w>', builtin.grep_string, { desc = 'Search current [W]ord' })
vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = 'Search by [G]rep' })
vim.keymap.set('n', '<C-e>', builtin.diagnostics, { desc = 'Search [E]rrors / Diagnostics' })

-- Search Linux Kernel Documentation
-- <C-l> is for pane navigation, use <C-m> similar to man
vim.keymap.set('n', '<C-m>',
  ":Telescope live_grep search_dirs={'Documentation/'} prompt_title=\\ Linux\\ Kernel\\ Documentation\\ <cr>",
  { desc = 'Search [L]inux Documentation / [M]anual' })

-- TODO: Doesn't work. Maybe it needs FZF?
-- Anyway's it's a nice to have. Can get by with /
-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer]' })
