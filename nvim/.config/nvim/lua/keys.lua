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
vim.keymap.set("n", "<leader>s", "<cmd>AerialToggle!<CR>", {
	desc = "Open lsp symbols",
})
vim.keymap.set("n", "<leader>g", "<cmd>Pick grep live<CR><CR>", {
	desc = "Open Grep",
})
