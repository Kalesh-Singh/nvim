vim.opt.termguicolors = true

require("bufferline").setup {
  -- The default highlights don't work well with night fox
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36',
    },
    buffer_selected = {
      fg = '#051418',
      bg = '#002b36',
      underline = true,
    },
    fill = {
      bg = '#073642'
    }
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
