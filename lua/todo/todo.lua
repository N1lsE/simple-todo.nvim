local M = {}
M.fn = {}

function M.setup(opts)
	opts = opts or {}
	require("todo.config").setup(opts)
	require("todo.keymaps").setup()

	local config = require("todo.config")

	-- setup todo filetype
	vim.filetype.add({
		extension = {
			todo = config.options.filetype,
		},
	})

	-- Use treesitter markdow syntax highlighting
	vim.api.nvim_create_autocmd("FileType", {
		pattern = config.options.filetype,
		callback = function()
			vim.treesitter.start(0, "markdown")
		end,
	})
end

---@param line string
---@return boolean
local function is_str_todo(line)
	return line:match("^- %[.%] ") ~= nil
end

---@return boolean
function M.fn.is_line_todo()
	local line_content = vim.api.nvim_get_current_line()
	return is_str_todo(line_content)
end

---@param current_state string -- len 1 (a char)
---@return string -- len 1 (the next state char)
local function next_todo_state(current_state)
	local config = require("todo.config")
	local todo_states = config.options.todo_states
	local len = #todo_states

	for i = 1, len do
		if todo_states:sub(i, i) == current_state then
			return todo_states:sub((i % len) + 1, (i % len) + 1)
		end
	end

	return " " -- Default return
end

---@return nil
function M.fn.new_todo()
	local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, cursor_line, cursor_line, false, { "- [ ] New TODO" })
	vim.api.nvim_win_set_cursor(0, { cursor_line + 1, 6 })
	vim.cmd("normal! v$h")
end

---@return nil
function M.fn.toggle_todo()
	local line_content = vim.api.nvim_get_current_line()
	local cursor_line = vim.api.nvim_win_get_cursor(0)[1]

	local new_line = ""
	if is_str_todo(line_content) then
		new_line = string.sub(line_content, 7, string.len(line_content))
	else
		new_line = "- [ ] " .. line_content
	end

	vim.api.nvim_buf_set_lines(0, cursor_line - 1, cursor_line, false, { new_line })
end

---@return nil
function M.fn.cycle_todo_state()
	local line_content = vim.api.nvim_get_current_line()
	if not is_str_todo(line_content) then
		return
	end

	local cursor_line = vim.api.nvim_win_get_cursor(0)[1]

	local current_state_char = string.sub(line_content, 4, 4)
	local next_state_char = next_todo_state(current_state_char)

	local new_line = "- [" .. next_state_char .. "] " .. string.sub(line_content, 7, string.len(line_content))

	vim.api.nvim_buf_set_lines(0, cursor_line - 1, cursor_line, false, { new_line })
end

return M
