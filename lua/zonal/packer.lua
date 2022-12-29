-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope Generic Fuzzy Finding
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Nordfox Colorscheme
	use 'EdenEast/nightfox.nvim'

	-- Tree Sitter for Syntax Highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' },
	}

	-- Nvim Tree File Explorer
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}

	-- Add auto completion engines
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	-- Also add a snippet engine and auto complete from snippets
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	-- Add also a community contributed repo of snippets
	use 'rafamadriz/friendly-snippets'

	-- Add LSP configuration and Lang Server Installer
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- Add null ls for code actions
	use 'jose-elias-alvarez/null-ls.nvim'

	-- Add illuminate word under cursor
	use 'RRethy/vim-illuminate'

	-- Extended CCLS functionality
	-- use 'ranjithshegde/ccls.nvim'
	-- TODO: The lua CCLS plugin above is significantly slower than
	-- the vim script coutner part below. Maybe this will change in
	-- the future. For now stick with what works.
	use 'm-pilia/vim-ccls'

    -- Add LSP Progress Bar
    use 'j-hui/fidget.nvim'

    -- Use treesitter textobjects
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    -- Indent blankline
    use 'lukas-reineke/indent-blankline.nvim'

    -- Add colorizer for RBG and HEX highlights
    use 'norcalli/nvim-colorizer.lua'

    -- Add lualine status line setup
    use 'nvim-lualine/lualine.nvim'

    -- Add comment support from treesitter
    use 'numToStr/Comment.nvim'

    -- Guess indentation automatically
    use 'NMAC427/guess-indent.nvim'

	-- Detect trailing whitespaces
	use 'johnfrankmorgan/whitespace.nvim'

	-- Add Git support
	use 'lewis6991/gitsigns.nvim'
	use 'rhysd/git-messenger.vim'

	-- Project management (replacement for vim rooter)
	use 'ahmedkhalf/project.nvim'

	-- Buffer management
	use {
		'akinsho/bufferline.nvim',
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons'
	}

	-- Todo, Bug, Fixes Mangement
	use {
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
	}

	-- Tmux navigation integration
	use 'christoomey/vim-tmux-navigator'
end)
