vim.opt.termguicolors = true

-- Default line color
vim.cmd [[highlight IndentBlanklineChar guifg=#69717A gui=nocombine]]

-- Current context line color
vim.cmd [[highlight IndentBlanklineContextChar guifg=#69717A gui=nocombine]]

require("indent_blankline").setup {
    show_current_context = true,
    show_end_of_line = true,
}
