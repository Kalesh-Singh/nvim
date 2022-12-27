require("project_nvim").setup {
    -- or leave it empty to use the default settings
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
}


-- Use :Telescope projects
--      To view recently opened proejcts
require('telescope').load_extension('projects')

-- Telescope Default Mappings
-- | Normal mode |Insert mode| Action                   |
-- | ----------- | --------- | ------------------------ |
-- | f           | <c-f>     | find_project_files       |
-- | b           | <c-b>     | browse_project_files     |
-- | d           | <c-d>     | delete_project           |
-- | s           | <c-s>     | search_in_project_files  |
-- | r           | <c-r>     | recent_project_files     |
-- | w           | <c-w>     | change_working_directory |
