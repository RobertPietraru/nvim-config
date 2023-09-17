require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require('lsp-zero').preset('recommended')


lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	lsp.default_keymaps({
		buffer = bufnr,
		omit = { 'K' },
	})
	vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
end)





lsp.ensure_installed({
	-- Replace these with whatever servers you want to install
	'rust_analyzer',
	'lua_ls',
	'volar'
})


local lsp_config = require('lspconfig');

lsp_config.lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
		},
	},
}
lsp_config.volar.setup {
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	}
})
