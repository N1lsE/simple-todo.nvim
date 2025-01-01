local M = {}

function M.setup(opts)
	opts = opts or {}
	require("config").setup(opts)
	require("keymaps").setup()

	-- setup todo filetype
	vim.filetype.add({
		extension = {
			todo = opts.filetype,
		},
	})
end

print("loaded plugin todo.nvim")

return M
