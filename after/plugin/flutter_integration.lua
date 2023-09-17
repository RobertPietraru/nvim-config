-- alternatively you can override the default configs
local flutter = require("flutter-tools")

-- flu[t]ter [r]un
vim.keymap.set('n', '<leader>tr', ":FlutterRun<CR>")
-- it's just convenient
vim.keymap.set('n', '<leader>tt', ":FlutterReload<CR>")
vim.keymap.set('n', '<leader>ty', ":FlutterRestart<CR>")
vim.keymap.set('n', '<leader>tq', ":FlutterQuit<CR>")
vim.keymap.set('n', '<leader>td', ":FlutterDevTools<CR>")
vim.keymap.set('n', '<leader>tn', ":FlutterRename<CR>")
vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action)
-- document format
vim.keymap.set('n', '<leader>df', vim.lsp.buf.format)

flutter.setup {
	closing_tags = {
		highlight = "comment",
		prefix = "",
		enabled = true
	},

	debugger = {
		enabled = true,
		run_via_dap = true,
		-- exception_breakpoints = {},
		register_configurations = function(_)
			local dap = require('dap')
			local flutterBin = vim.fn.resolve(vim.fn.exepath('flutter.bat'))
			local flutterSdk = vim.fn.fnamemodify(flutterBin, ":h:h")
			local dartSdk = flutterSdk .. '\\bin\\cache\\dart-sdk'
			--
			-- dap.adapters.dart = {
			-- 	type = 'executable',
			-- 	command = flutterBin,
			-- 	args = { '-v', 'debug-adapter' },
			-- }
			--
			dap.adapters.dart = {
				type = 'executable',
				command = vim.fn.exepath('cmd.exe'),
				args = { '/c', flutterBin, 'debug_adapter' },
				options = {
					detached = false,
				}
			}
			dap.configurations.dart = {
				{
					type = 'dart',
					request = 'launch',
					name = "Launch Flutter",
					dartSdkPath = dartSdk,
					flutterSdkPath = flutterSdk,
					program = "${workspaceFolder}\\lib\\main.dart",
					cwd = '${workspaceFolder}',
					sendLogsToClient = true,
					options = {
						detached = false,
					}
				},
			}
		end,
	},
	dev_log = {
		enabled = true,
		notify_errors = true, -- if there is an error whilst running then notify the user
		open_cmd = "tabedit", -- command to use to open the log buffer
	},
}
