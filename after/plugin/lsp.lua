require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require('lsp-zero').preset('recommended')


lsp.on_attach(function(_, bufnr)
	local opts = {buffer = bufnr, remap = false}
	lsp.default_keymaps({buffer = bufnr,
	omit = {'K'},
	})
	vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
end)





lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'rust_analyzer',
  'lua_ls',
})


--local lsp_config = require('lspconfig');
--lsp_config.dartls.setup({
--	cmd = { "dart", "language-server", "--protocol=lsp" },
--})

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
      ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})
