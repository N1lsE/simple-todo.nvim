local M = {}

function M.setup(opts)
	opts = opts or {}
	require("todo.config").setup(opts)
	require("todo.keymaps").setup()

	local config = require("todo.config")

	-- setup todo filetype
	vim.filetype.add({
		extension = {
			todo = config.options.ft,
		},
	})
end

return M
