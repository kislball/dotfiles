vim.pack.add(package_urls)
require("aerial").setup()
require("which-key").setup({ preset = "helix" })

vim.g.vimtex_compiler_method = "tectonic"
vim.g.vimtex_compiler_auto_reload = "async"
vim.g.vimtex_view_method = "general"
vim.g.vimtex_view_general_viewer = "ls"
vim.g.vimtex_view_auto_reload = false
vim.g.vimtex_compiler_callback = 1

local function clean_tex_files()
	local extensions = { "aux", "log", "blg", "synctex.gz" }
	for _, ext in ipairs(extensions) do
		local files = vim.fn.glob("*." .. ext, false, true)
		for _, f in ipairs(files) do
			vim.fn.delete(f)
		end
	end
end

vim.api.nvim_create_autocmd("User", {
	pattern = "VimtexEventCompileSuccess",
	callback = function()
		clean_tex_files()
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.tex",
	command = "VimtexCompile",
})

for _, name in ipairs(minis) do
	require(string.format("mini.%s", name)).setup()
end

require("dressing").setup()
