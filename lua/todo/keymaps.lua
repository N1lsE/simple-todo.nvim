local M = {}

local function new_o()
	local todo = require("todo.todo")

	if todo.fn.is_line_todo() then
		vim.cmd('normal! o')
		todo.fn.toggle_todo()

	else
		vim.cmd('normal! o')
	end
	vim.api.nvim_feedkeys('A', 'n', false)
end

local function new_O()
	local todo = require("todo.todo")

	if todo.fn.is_line_todo() then
		vim.cmd('normal! O')
		todo.fn.toggle_todo()
	else
		vim.cmd('normal! O')
	end
	vim.api.nvim_feedkeys('A', 'n', false)
end


function M.setup()
	local todo = require("todo.todo")
	local config = require("todo.config")

	if config.options.default_keymaps then
		-- vim.keymap.set('n', '<leader>mp', ':echo "My Plugin Activated"<CR>', { desc = 'Activate My Plugin' })
		vim.keymap.set("n", "<leader>gt", todo.fn.toggle_todo, { desc = "Toggle Todo" })
		vim.keymap.set("n", "<C-b>", todo.fn.toggle_todo, { desc = "Toggle Todo" })

		vim.keymap.set("n", "<leader>gc", todo.fn.cycle_todo_state, { desc = "Cycle Todo Status" })
		vim.keymap.set("n", "<C-m>", todo.fn.cycle_todo_state, { desc = "Cycle Todo Status" })

		vim.keymap.set("n", "<leader>gn", todo.fn.new_todo, { desc = "New Todo" })
		vim.keymap.set("n", "<C-n>", todo.fn.new_todo, { desc = "New Todo" })
	end

	if config.options.auto_continue_list then
		vim.keymap.set("n", "o", new_o, {})
		vim.keymap.set("n", "O", new_O, {})
	end

	vim.api.nvim_buf_create_user_command(0, "TodoToggle", todo.fn.toggle_todo, { desc = "Toggle Todo" })
	vim.api.nvim_buf_create_user_command(0, "TodoCircleState", todo.fn.cycle_todo_state, { desc = "Cycle Todo Status" })
	vim.api.nvim_buf_create_user_command(0, "TodoNew", todo.fn.new_todo, { desc = "New Todo" })
end

return M
