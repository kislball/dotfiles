require("mason").setup()
local coq = require("coq")

vim.g.coq_settings = {
	auto_start = "shut-up",
	completion = {
		skip_after = { "[", "]", "{", "}", " " },
	},
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
	"emmet_ls",
	"stylelint_lsp",
	"vue_ls",
	"vtsls",
	"clangd",
}

for _, server in ipairs(servers) do
	vim.lsp.config(server, coq.lsp_ensure_capabilities())
end

local vue_language_server_path = vim.fn.expand("$MASON/packages")
	.. "/vue-language-server"
	.. "/node_modules/@vue/language-server"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}
vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
local ts_ls_config = {
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	filetypes = tsserver_filetypes,
}
vim.lsp.config("ts_ls", ts_ls_config)
vim.lsp.config("vue_ls", vue_plugin)
vim.lsp.enable(servers)

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff" },
		cpp = { "clang-format" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		svelte = { "prettierd" },
		vue = { "prettierd" },
		go = { "gofmt" },
		gdscript = { "gdformat" },
	},
})
