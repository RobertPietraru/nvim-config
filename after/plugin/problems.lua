-- Lua
vim.keymap.set("n", "<leader>m", ":TroubleToggle<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set("n", "<leader>mw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>md", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>ml", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>mq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)

