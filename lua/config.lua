local M = {}

M.defaults = {
	ft = 'todo',
	-- option2 = 'default_value',
}

function M.setup(opts)
	M.options = vim.tbl_extend("force", M.defaults, opts or {})
end

return M
