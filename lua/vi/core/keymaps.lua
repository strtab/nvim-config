vim.g.mapleader = " "

local keymap = vim.keymap
local cmd = vim.cmd

-- keymap.set("i", "jk", "<Esc>", { desc = "Exit from insert mode" })

keymap.set("n", "<leader>n", ":nohl<CR>", { silent = true, desc = "Clear search" })
keymap.set("n", "<leader>e", ":Explore<CR>", { silent = true, desc = "Explore" })

-- Term
keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
keymap.set("n", "<leader>/", function()
	cmd.vnew()
	cmd.term()
	cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
	cmd.startinsert()
end, { silent = true, desc = "Open terminal" })

-- Tabs management
keymap.set("n", "<leader>t", ":tabnew<CR>", { desc = "New tab" })

-- Buffer navigation
keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Previous buffer" })

keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

-- Ui
keymap.set("n", "<leader>ub", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, { silent = true, desc = "Toggle background (dark/light)" })
