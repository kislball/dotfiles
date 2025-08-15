vim.pack.add(package_urls)
require("aerial").setup()
require("which-key").setup({ preset = "helix" })

for _, name in ipairs(minis) do
	require(string.format("mini.%s", name)).setup()
end
