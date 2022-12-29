vim.opt.termguicolors = true

require("bufferline").setup {
  -- If the highlights don't work, check the tmux term is *256color
  highlights = {
    buffer_selected = {
      fg = '#BE94F9', -- matches dracula lualine
    },
  },
  options = {
    separator_style = 'padded_slant',
  },
}

-- Setup navigation key mappings
local nmap = function(keys, func, desc)
	if desc then
		desc = desc
	end

	vim.keymap.set('n', keys, func, { desc = desc })
end

nmap('<S-h>', ':BufferLineCyclePrev<cr>', 'Move to Prev Buffer')
nmap('<S-l>', ':BufferLineCycleNext<cr>', 'Move to Next Buffer')
-- This is native vim but seems appropriate to group with
-- this plugins mappings.
nmap('<leader>q', ':bd<cr>', 'Close Current Buffer')
