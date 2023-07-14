vim.g.mapleader = " "

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set({"v", "n"}, "<C-c>", "\"+y <CR>")
vim.keymap.set({"v", "n"}, "<leader>c", "\"+y <CR>")

-- vim.keymap.set("n", "<leader>ll", "ebv%d")
