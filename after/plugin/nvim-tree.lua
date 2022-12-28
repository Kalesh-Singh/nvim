-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- Key Mappings
-- Open or close the tree
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)
-- Move the cursor in the tree for the current buffer, opening folders if needed
vim.keymap.set('n', '<leader>fe', vim.cmd.NvimTreeFindFile)
