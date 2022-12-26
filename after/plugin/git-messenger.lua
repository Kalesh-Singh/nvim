vim.g.git_messenger_include_diff = 'none'
vim.g.git_messenger_always_into_popup = true

-- NOTE: Please note that typing d/D or r/R in popup window toggle
-- showing diff hunks even if this value is set to "none"
vim.keymap.set('n', 'gm', vim.cmd.GitMessenger)
