-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- Paste and don't lose it by cutting other
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without cut" })

-- Copying to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to clipboard" })

-- Don't cut when removing with 'd'
vim.keymap.set({ "v", "n" }, "<leader>d", [["_d]], { desc = "Delete without cut" })

vim.keymap.set("n", "<leader>cb", "<cmd>bd<CR>", { desc = "Close actual buffer" })
