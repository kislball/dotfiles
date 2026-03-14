vim.keymap.del("n", "grr")

vim.keymap.set("n", "<leader><leader>", MiniFiles.open, {
	desc = "Open file picker",
})

vim.keymap.set("n", "H", ":bprev<CR>", {
	desc = "Previous tab",
})

vim.keymap.set("n", "L", ":bnext<CR>", {
	desc = "Next tab",
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
	desc = "Show diagnostics under the cursor",
})

vim.keymap.set("n", "<leader>q", ":bdelete<CR>", {
	desc = "Close current buffer",
})

vim.keymap.set("n", "<leader>t", ":terminal<CR>", {
	desc = "Open terminal",
})

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", {
	desc = "Open terminal",
})

vim.keymap.set("n", "<leader>td", ":colorscheme kanagawa<CR>", { desc = "Kanagawa" })

vim.keymap.set("n", "<leader>tw", ":colorscheme kanagawa-lotus<CR>", { desc = "Kanagawa Wave" })

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

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader>f", require("conform").format, {
	desc = "Format current file",
})

vim.keymap.set("n", "<leader>s", "<cmd>AerialToggle!<CR>", {
	desc = "Open lsp symbols",
})

vim.keymap.set("n", "<leader>g", "<cmd>Pick grep live<CR><CR>", {
	desc = "Open Grep",
})

vim.keymap.set("n", "<leader>b", "<cmd>Pick buffers<CR>", {
	desc = "Open buffers picker",
})

vim.keymap.set("n", "<leader>od", "<cmd>DapToggleBreakpoint<CR>", {
	desc = "Toggle breakpoint",
})

vim.keymap.set("n", "<leader>oc", "<cmd>DapContinue<CR>", {
	desc = "Start / continue",
})

vim.keymap.set("n", "<leader>ox", "<cmd>DapTerminate<CR>", {
	desc = "Terminate session",
})

vim.keymap.set("n", "<leader>oj", "<cmd>DapStepOver<CR>", {
	desc = "Step over",
})

vim.keymap.set("n", "<leader>ol", "<cmd>DapStepInto<CR>", {
	desc = "Step into",
})

vim.keymap.set("n", "<leader>ok", "<cmd>DapStepOut<CR>", {
	desc = "Step out",
})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {
	desc = "Leave terminal mode",
})

vim.keymap.set({ "n", "x" }, "<leader>za", function()
	require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode…" })
vim.keymap.set({ "n", "x" }, "<leader>zr", function()
	require("opencode").select()
end, { desc = "Execute opencode action…" })
vim.keymap.set({ "n", "t" }, "<leader>zt", function()
	require("opencode").toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "<leader>zc", function()
	return require("opencode").operator("@this ")
end, { desc = "Add range to opencode", expr = true })
vim.keymap.set("n", "<leader>zl", function()
	return require("opencode").operator("@this ") .. "_"
end, { desc = "Add line to opencode", expr = true })
