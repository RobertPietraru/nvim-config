require('Comment').setup()
local comments = require('Comment.api')


-- vim.fn.visualmode()
vim.keymap.set("n", "<leader>/", function () comments.toggle.linewise() end)
vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")




