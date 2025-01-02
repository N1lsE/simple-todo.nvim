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

local function setup_keymaps()
	local todo = require("todo.todo")
		vim.keymap.set("n", "<leader>gt", todo.fn.toggle_todo, { desc = "Toggle Todo", buffer = true })
		vim.keymap.set("n", "<C-b>", todo.fn.toggle_todo, { desc = "Toggle Todo", buffer = true })

		vim.keymap.set("n", "<leader>gc", todo.fn.cycle_todo_state, { desc = "Cycle Todo Status", buffer = true })
		vim.keymap.set("n", "<C-m>", todo.fn.cycle_todo_state, { desc = "Cycle Todo Status", buffer = true })

		vim.keymap.set("n", "<leader>gn", todo.fn.new_todo, { desc = "New Todo", buffer = true })
		vim.keymap.set("n", "<C-n>", todo.fn.new_todo, { desc = "New Todo", buffer = true })
end

local function setup_auto_continue()
		vim.keymap.set("n", "o", new_o, {buffer = true})
		vim.keymap.set("n", "O", new_O, {buffer = true})
end

local function setup_commands()
	local todo = require("todo.todo")
	vim.api.nvim_buf_create_user_command(0, "TodoToggle", todo.fn.toggle_todo, { desc = "Toggle Todo" })
	vim.api.nvim_buf_create_user_command(0, "TodoCircleState", todo.fn.cycle_todo_state, { desc = "Cycle Todo Status" })
	vim.api.nvim_buf_create_user_command(0, "TodoNew", todo.fn.new_todo, { desc = "New Todo" })
end

function M.setup()
	local config = require("todo.config")

	vim.api.nvim_create_autocmd("FileType", {
		pattern = config.options.filetype,
		callback = function ()
			if config.options.default_keymaps then
				setup_keymaps()
			end
			if config.options.auto_continue_list then
				setup_auto_continue()
			end
			setup_commands()
		end
	})
end

return M
