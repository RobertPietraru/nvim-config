local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
-- project search
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
--



