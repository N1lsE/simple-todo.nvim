# **simple-todo.nvim**

A lightweight Neovim plugin to manage and organize your TODOs.

## Looking for More?

Maby this is too simple for your needs. You might also look into:
- [niuiic/todo.nvim](https://neovimcraft.com/plugin/niuiic/todo.nvim/)

## **Features**

- adds a todo filetype `.todo`
- markdown highlighting
- toggle / add new / cycle state - of TODOs
- continue TODO list with o/O

## Installation

### **With `lazy.nvim`**
```lua
{
    "N1lsE/simple-todo.nvim",
    config = function()
        require('simple-todo.todo').setup()
    end
}
```

## Configuration

You can customize the plugin in your Neovim config:

```lua
require('todo').setup({
    -- these are the default values
	filetype = 'todo',
	todo_states = ' x-D',
	default_keymaps = true,
	auto_continue_list = true,
})
```

See the `config.lua` file (on github or in the repo) to see all default values. (Maby i'll forget to update this.)

## Usage

Create a file `*.todo`

- Add new Todo: `:TodoAdd` or `<leader>gn` or  `CTRL + n`
- Toggle Todo: `:TodoToggle` or `<leader>gt` or  `CTRL + b`
- Cycle Todo State: `:TodoCircleState` or `<leader>gc` or  `CTRL + m`

## Contributing

Contributions are welcome! Feel free to submit an issue or pull request on GitHub.
I am new to this, be gentel with me.
