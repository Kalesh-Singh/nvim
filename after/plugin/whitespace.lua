require('whitespace-nvim').setup({
    -- configuration options and their defaults

    -- `highlight` configures which highlight is used to display
    -- trailing whitespace
    highlight = 'DiffDelete',

    -- `ignored_filetypes` configures which filetypes to ignore when
    -- displaying trailing whitespace
    ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },
})

-- remove trailing whitespace with a keybinding
vim.keymap.set('n', '<Leader>tw', require('whitespace-nvim').trim)
