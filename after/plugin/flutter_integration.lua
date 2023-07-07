-- alternatively you can override the default configs
local flutter = require("flutter-tools")

-- flu[t]ter [r]un
vim.keymap.set('n', '<leader>tr', ":FlutterRun<CR>")
-- it's just convenient
vim.keymap.set('n', '<leader>tt', ":FlutterReload<CR>")
vim.keymap.set('n', '<leader>tq', ":FlutterQuit<CR>")
vim.keymap.set('n', '<leader>td', ":FlutterDevTools<CR>")
vim.keymap.set('n', '<leader>tn', ":FlutterRename<CR>")
flutter.setup {}
