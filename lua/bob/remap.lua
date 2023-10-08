vim.g.mapleader = " "

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set({ "n", "v" }, "<leader>e", ":E<CR>")

vim.keymap.set({ "v", "n" }, "<C-c>", "\"+y <CR>")
vim.keymap.set({ "v", "n" }, "<leader>c", "\"+y <CR>")

-- git
vim.keymap.set({ "v", "n" }, "<leader>`", ":Neogit <CR>")
vim.keymap.set({ "v", "n" }, "<leader>~", function() require('neogit').close(); end)
vim.keymap.set({ "v", "n" }, "<leader>b", function() vim.lsp.buf.format(); end)
