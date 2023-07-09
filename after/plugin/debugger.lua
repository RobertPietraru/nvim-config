local dapui = require("dapui")
dapui.setup()

vim.keymap.set('n', '<leader>]', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>[', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>{', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>}', function() require('dap').step_out() end)

vim.keymap.set('n', ';', function() require('dap').toggle_breakpoint() end)
--vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
--vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
--vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
--vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
	require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
	require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='red', linehl='', numhl=''})

vim.keymap.set('n', '<leader>dt', function() require('dapui').toggle() end)
