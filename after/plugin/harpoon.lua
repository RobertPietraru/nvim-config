vim.keymap.set({"n", "v"}, "<leader><tab>", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
vim.keymap.set({"n", "v"}, "<leader>w", ":lua require(\"harpoon.mark\").add_file()<CR>")

