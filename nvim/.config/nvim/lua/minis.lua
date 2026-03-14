minis = {
	"ai",
	"basics",
	"bracketed",
	"comment",
	"completion",
	"cursorword",
	"diff",
	"files",
	"git",
	"icons",
	"jump",
	"jump2d",
	"move",
	"notify",
	"operators",
	"pairs",
	"pick",
	"snippets",
	"statusline",
	"surround",
	"tabline",
}

for _, name in ipairs(minis) do
	if name == "git" then
		package_urls[#package_urls + 1] = { src = string.format("https://github.com/echasnovski/mini-%s", name) }
	else
		package_urls[#package_urls + 1] = { src = string.format("https://github.com/echasnovski/mini.%s", name) }
	end
end
