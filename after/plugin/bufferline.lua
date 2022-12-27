vim.opt.termguicolors = true

require("bufferline").setup {
  -- The default highlights don't work well with night fox
  highlights = {
    buffer_selected = {
      fg = '#BE94F9', -- at least matches dracula lualine
    },
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
