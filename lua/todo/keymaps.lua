local M = {}

function M.setup()
	local todo = require('todo.todo')
	-- vim.keymap.set('n', '<leader>mp', ':echo "My Plugin Activated"<CR>', { desc = 'Activate My Plugin' })
	vim.keymap.set("n", "<leader>gt", todo.fn.toggle_todo, { desc = "Toggle Todo" })
	vim.keymap.set("n", "<leader>gc", todo.fn.cicle_todo_state, { desc = "Cicle Todo Status" })
	vim.keymap.set("n", "<leader>gn", todo.fn.new_todo, { desc = "New Todo" })

	vim.api.nvim_buf_create_user_command(0, 'TodoToggle', todo.fn.toggle_todo, { desc = "Toggle Todo" })
	vim.api.nvim_buf_create_user_command(0, 'TodoCircleStatus', todo.fn.cicle_todo_state, { desc = "Cicle Todo Status" })
	vim.api.nvim_buf_create_user_command(0, 'TodoNew', todo.fn.new_todo, { desc = "New Todo" })
end

return M
