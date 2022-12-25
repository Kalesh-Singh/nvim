vim.opt.termguicolors = true

-- Default line color
vim.cmd [[highlight IndentBlanklineChar guifg=#98C379 gui=nocombine]]

-- Current context line color
vim.cmd [[highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
    show_current_context = true,
    show_end_of_line = true,
}
