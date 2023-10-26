require('onedark').setup {
	colors = {
		-- bright_orange = "#ff8800",    -- define a new color
		cyan = '$light_grey', -- redefine an existing color
		custom_grey = "abb2bf"
	},
	highlights = {
		["@field"] = { fg = '$purple', },
		["@symbol"] = { fg = '$purple', },
		["@string"] = { fg = '$green', },
		["@attribute"] = { fg = '$purple', },
		["@property"] = { fg = '$custom_grey', },
		["@variable.builtin"] = { fg = '$custom_grey', },
		["@lsp.type.parameter"] = { fg = '$custom_grey', },
		["@parameter"] = { fg = '$custom_grey', },
	}
}

require('onedark').load()


vim.wo.number = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
-- the bar at the bottom
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'onedark',
		component_separators = { left = '|', right = '|' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = {
			{
				'filename',
				path = 1,
			}
		},
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
--
vim.cmd [[ sign define DiagnosticSignError text=🤬 linehl= texthl=DiagnosticSignError numhl=
sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl=
sign define DiagnosticSignInfo text=  linehl= texthl=DiagnosticSignInfo numhl=
sign define DiagnosticSignHint text=💡  linehl= texthl=DiagnosticSignHint numhl=
]]
