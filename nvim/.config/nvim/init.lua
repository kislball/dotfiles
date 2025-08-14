vim.o.relativenumber = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.o.number = true
vim.o.autoindent = true
vim.o.autowrite = true
vim.o.wrap = false
vim.g.mapleader = " "

local minis = {
	"pick",
	"comment",
	"surround",
	"ai",
	"operators",
	"files",
	"bracketed",
	-- "git",
	"statusline",
	"icons",
}

local package_urls = {
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/tpope/vim-repeat" },
	{ src = "https://github.com/ms-jpq/coq_nvim" },
	{ src = "https://github.com/ms-jpq/coq.artifacts" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/stevearc/aerial.nvim" },
	-- { src = "https://github.com/shaunsingh/nord.nvim" },
}

for _, name in ipairs(minis) do
	package_urls[#package_urls + 1] = { src = string.format("https://github.com/echasnovski/mini.%s", name) }
end

vim.pack.add(package_urls)

for _, name in ipairs(minis) do
	require(string.format("mini.%s", name)).setup()
end

require("mason").setup()
require("which-key").setup({ preset = "helix" })
local coq = require("coq")
require("aerial").setup()

vim.g.coq_settings = {
	auto_start = true,
}

local servers = {
	"ansiblels",
	"docker_compose_language_service",
	"docker_language_server",
	"dockerls",
	"gopls",
	"jsonls",
	"pylsp",
	"rust_analyzer",
	"sqlls",
	"tailwindcss",
	"svelte",
	"texlab",
	"eslint",
	"zls",
	"gdscript",
	"luals",
}

for _, server in ipairs(servers) do
	vim.lsp.config(server, coq.lsp_ensure_capabilities())
end

vim.lsp.enable(servers)

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		svelte = { "prettierd" },
		vue = { "prettierd" },
		go = { "gofmt" },
		gdscript = { "gdformat" },
	},
})

vim.keymap.set("n", "<leader><leader>", MiniFiles.open, {
	desc = "Open file picker",
})
vim.keymap.set("n", "H", ":tabprev<CR>", {
	desc = "Previous tab",
})
vim.keymap.set("n", "L", ":tabnext<CR>", {
	desc = "Next tab",
})
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
	desc = "Show diagnostics under the cursor",
})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
	desc = "Go to definition",
})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {
	desc = "Go to references",
})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
	desc = "Go to references",
})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {
	desc = "Code action",
})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
	desc = "Rename",
})
vim.keymap.set("n", "<leader>f", require("conform").format, {
	desc = "Format current file",
})
vim.keymap.set("n", "<leader>ss", "<cmd>AerialToggle!<CR>", {
	desc = "Open lsp symbols",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.cmd("COQnow")
