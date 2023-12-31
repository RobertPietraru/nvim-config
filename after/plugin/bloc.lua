local tree_api = require('nvim-tree.api')
local bloc = require('bloc')

--- for widget wrapping
bloc.setup()

--- the cubit will be the child of the folder or the sibling of the file
vim.keymap.set("n", "<leader>q", function()
	local input = vim.fn.input("cubit name (snake_case): ")
	if (input == "") then
		print("Aborted cubit creation")
		return;
	end

	local clipboard_before = vim.fn.getreg("*");
	tree_api.fs.copy.relative_path()
	local clipboard_after = vim.fn.getreg("*");
	vim.fn.setreg("*", clipboard_before)
	bloc.create_cubit(input, clipboard_after)
end)

vim.keymap.set("n", "<leader>Q", function()
	local input = vim.fn.input("bloc name (snake_case): ")
	if (input == "") then
		print("Aborted bloc creation")
		return;
	end
	local clipboard_before = vim.fn.getreg("*");
	tree_api.fs.copy.relative_path()
	local clipboard_after = vim.fn.getreg("*");
	vim.fn.setreg("*", clipboard_before)
	bloc.create_bloc(input, clipboard_after)
end)
