local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
	local opts = { buffer = bufnr, remap = false }
	lsp_zero.default_keymaps({
		buffer = bufnr,
		omit = { 'K' },
	})
	vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
end)

require('lspconfig').dartls.setup({})
-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  }
})


local cmp = require('cmp')
cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<s-tab>'] = cmp.mapping.select_prev_item(),
    	['<tab>'] = cmp.mapping.select_next_item(),
	}
})
