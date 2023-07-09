local builtin = require('telescope.builtin')
require("telescope").load_extension "flutter"
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
-- project search
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
--



