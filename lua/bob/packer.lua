return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'

	-- navigation
	use 'ThePrimeagen/harpoon'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- utilities
	use 'folke/trouble.nvim'


	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup {}
		end,
	})

	-- git
	use({
		"NeogitOrg/neogit",
		requires = {
			{ "nvim-lua/plenary.nvim",         opt = false }, -- required
			{ "nvim-telescope/telescope.nvim", opt = true }, -- optional
			{ "sindrets/diffview.nvim",        opt = true }, -- optional
		},
		config = true
	})

	-- theme
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'navarasu/onedark.nvim'
	use 'nvim-lualine/lualine.nvim'

	-- lsp
	use { 'nvim-telescope/telescope-ui-select.nvim' }
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			-- {'williamboman/mason.nvim'},
			-- {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	}
	use {
		'numToStr/Comment.nvim',

	}

	-- flutter
	use { 'RobertPietraru/bloc.nvim',
		requires = {
			{ 'jose-elias-alvarez/null-ls.nvim' },
		}
	}
end)
-- this might be useful in the future, when I decide to add the explorer tree, so yk, keep that in mind mate
--use 'nvim-tree/nvim-web-devicons'
--
--
