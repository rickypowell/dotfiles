-- Keymaps
--
-- author: Ricky Powell
--

-- File explorer keymaps

vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open file explorer" })

-- Move cursor to other windows
vim.keymap.set("n", "<leader>j", "<C-w>j<cr>", { desc = "Move cursor to window below" })
vim.keymap.set("n", "<leader>k", "<C-w>k<cr>", { desc = "Move cursor to window above" })
vim.keymap.set("n", "<leader>h", "<C-w>h<cr>", { desc = "Move cursor to window left" })
vim.keymap.set("n", "<leader>l", "<C-w>l<cr>", { desc = "Move cursor to window right" })

-- Window resizing
local INT_RESIZE = 2
vim.keymap.set("n", "<C-k>", "<cmd>resize -" .. INT_RESIZE .. "<cr>", { desc = "Decrease current window height" })
vim.keymap.set("n", "<C-j>", "<cmd>resize +" .. INT_RESIZE .. "<cr>", { desc = "Increase current window height" })
vim.keymap.set("n", "<C-h>", "<cmd>vertical resize +" .. INT_RESIZE .. "<cr>", { desc = "Increase current window width" })
vim.keymap.set("n", "<C-l>", "<cmd>vertical resize -" .. INT_RESIZE .. "<cr>", { desc = "Decrease current Increase rent window width" })

-- Scrolling
-- while scrolling up/down, keep the current highlighted line centered horizontally
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Git
-- lookup git history for current file in buffer in a quickfix list with a Fugitive command
-- use commands ":cn" (next) and ":cp" (previous) to navigate the list
vim.keymap.set("n", "<leader>Gh", "<cmd>0Gclog<cr>", { desc = "Git history for current file" })
