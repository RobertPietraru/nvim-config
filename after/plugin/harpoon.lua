local function filesAreOpen()
	local open_buffers = vim.fn.getbufinfo({ buflisted = 1 })

	-- Define a list of buffer names that you want to exclude (e.g., NERD_tree_1, NetrwTree)
	local excluded_buffers = { "NERD_tree_1", "NetrwTree" }

	local count = 0
	for _, buf in ipairs(open_buffers) do
		local is_excluded = false
		for _, excluded_buf in ipairs(excluded_buffers) do
			if buf.name == excluded_buf then
				is_excluded = true
				break
			end
		end
		if not is_excluded then
			count = count + 1
		end
	end

	return count > 0
end

vim.keymap.set({ "n", "v" }, "<leader><tab>", function()
		vim.api.nvim_input( ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>" )

end)



vim.keymap.set({ "n", "v" }, "<leader>w", ":lua require(\"harpoon.mark\").add_file()<CR>")
