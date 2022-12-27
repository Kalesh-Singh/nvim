local todo = require('todo-comments')

todo.setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
}

-- Mappings
vim.keymap.set("n", "]t", function()
  todo.jump_next({keywords = { 'TODO', 'BUG', 'FIX', 'ERROR', 'WARNING', 'NOTE' }})
end, { desc = 'Next todo/bug/fix/error/warning/note comment' })
vim.keymap.set("n", "[t", function()
  todo.jump_prev({keywords = { 'TODO', 'BUG', 'FIX', 'ERROR', 'WARNING', 'NOTE' }})
end, { desc = 'Previous todo/bug/fix/error/warning/note comment' })

-- Useful Commands
-- :TodoTelescope keywords=TODO,FIX -- Can specify which keywords
-- :TodoTelescope -- Search through all project todo etc comments
