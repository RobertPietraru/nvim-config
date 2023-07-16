local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return require('packer').startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'nvim-tree/nvim-web-devicons'
	use 'navarasu/onedark.nvim'
	use('nvim-treesitter/nvim-treesitter', {run = ":TSUpdate"})
	use 'ThePrimeagen/harpoon'
	use 'mbbill/undotree'
	use 'folke/trouble.nvim'
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	use 'mfussenegger/nvim-dap'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-lualine/lualine.nvim'
	use  'numToStr/Comment.nvim'
	use 'RobertPietraru/bloc.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup {
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_buf_create_user_command(bufnr, "LspFormatting", function()
                -- or vim.lsp.buf.formatting(bufnr) on 0.8
                vim.lsp.buf.formatting_sync()
            end, {})

            -- you can leave this out if your on_attach is unique to null-ls,
            -- but if you share it with multiple servers, you'll want to keep it
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                command = "undojoin | LspFormatting",
            })
        end
    end,
			}
		end,
	})

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
		}
	}


	use {
		'TimUntersberger/neogit',
		requires = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim'
		}
	}

	use {
		'akinsho/flutter-tools.nvim',
		requires = {
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
	}
end)

