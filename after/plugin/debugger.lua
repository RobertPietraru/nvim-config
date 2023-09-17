local dapui = require("dapui")
dapui.setup(
{
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = { {
        elements = { {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          } },
        position = "left",
        size = 10 
      }, {
        elements = {
		{
            id = "repl",
            size =0.7 
          },  },
        position = "bottom",
        size =10
      } },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  })

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
-- vim.keymap.set('n', '<Leader>df', function()
-- 	local widgets = require('dap.ui.widgets')
-- 	widgets.centered_float(widgets.frames)
-- end)
vim.keymap.set('n', '<Leader>\'', '<cmd>  DapToggleRepl <CR>')

vim.fn.sign_define('DapBreakpoint', { text='🛑', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
--
vim.fn.sign_define('DapBreakpointCondition', { text='?', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapStopped', { text='',
-- texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' 
})
--
vim.keymap.set('n', '<leader>dt', function() require('dapui').toggle() end)


