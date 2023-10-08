local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim' 

	-- navigation
	use 'ThePrimeagen/harpoon'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- utilities
	use({
		"Pocco81/auto-save.nvim",
		config = function()
			 require("auto-save").setup { }
		end,
	})

	use({
  "NeogitOrg/neogit",
  requires = {
	{"nvim-lua/plenary.nvim", opt=false},         -- required
	{"nvim-telescope/telescope.nvim", opt=true}, -- optional
	{"sindrets/diffview.nvim", opt=true},        -- optional
  },
  config = true
})

	-- git

	-- theme 
	use 'navarasu/onedark.nvim'
	use 'nvim-lualine/lualine.nvim'
end)
-- this might be useful in the future, when I decide to add the explorer tree, so yk, keep that in mind mate
--use 'nvim-tree/nvim-web-devicons'
--
--
