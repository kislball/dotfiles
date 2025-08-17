minis = {
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
	"pairs",
	"tabline",
	"cursorword",
	"notify",
}

for _, name in ipairs(minis) do
	package_urls[#package_urls + 1] = { src = string.format("https://github.com/echasnovski/mini.%s", name) }
end
