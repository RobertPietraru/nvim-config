require('Comment').setup()
local comments = require('Comment.api')


-- vim.fn.visualmode()
vim.keymap.set("n", "<leader>/", function () comments.toggle.linewise() end)




