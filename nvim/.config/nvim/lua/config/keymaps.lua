-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local mcr = require("nvim-macros")

vim.keymap.set("n", "<leader>mjfa", "0ciwconstf(i = $i=> ", {
  desc = "Convert function to arrow function",
})

vim.keymap.set("n", "<leader>ms", ":MacroSave<Cr>", {
  desc = "Save macro",
})

vim.keymap.set("n", "<leader>mz", ":MacroSelect<Cr>", {
  desc = "Select macro",
})

vim.keymap.set("n", "<leader>mx", ":MacroDelete<Cr>", {
  desc = "Delete macro",
})

vim.keymap.set("n", "<leader>my", ":MacroYank<Cr>", {
  desc = "Yank macro",
})

vim.keymap.set("n", "<C-j>", "ddp", {
  desc = "Move line up",
})

vim.keymap.set("n", "<C-k>", "dd2kp", {
  desc = "Move line up",
})
