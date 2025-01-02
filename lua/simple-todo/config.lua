local M = {}

M.defaults = {
	filetype = 'todo',
	todo_states = ' x-D',
	default_keymaps = true,
	auto_continue_list = true,
}

function M.setup(opts)
	M.options = vim.tbl_extend("force", M.defaults, opts or {})
end

return M
