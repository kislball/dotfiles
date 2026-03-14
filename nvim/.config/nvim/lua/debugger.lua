local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
	name = "lldb",
}

dap.adapters.ocaml = {
	type = "executable",
	command = "ocamldebug",
	args = { "-i", "IP", "-p", "PORT" },
}

local last_program = nil
local last_args = nil

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			local default = last_program or (vim.fn.getcwd() .. "/")
			local input = vim.fn.input("Path to executable: ", default, "file")
			last_program = input
			return input
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function()
			local default = last_args or ""
			local input = vim.fn.input("Arguments: ", default)
			last_args = input
			return vim.split(input, " ", { trimempty = true })
		end,
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.configurations.ocaml = {
	{
		name = "Debug",
		type = "ocaml",
		request = "launch",
		program = function()
			local default = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			return default
		end,
		cwd = "${workspaceFolder}",
	},
}

require("dap-view").setup({
	auto_toggle = true,
	winbar = {
		sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
	},
})
