vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set("i", "jk", "<Esc>", { desc = "Exit from insert mode" })
keymap.set("n", "<leader>n", ":nohl<CR>", { silent = true, desc = "Clear search" })
keymap.set("n", "<leader>e", ":Explore<CR>", { silent = true, desc = "Explore" })

-- Tabs management
keymap.set("n", "<leader>t", ":tabnew<CR>", { desc = "New tab" })

-- Buffer navigation
keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Previous buffer" })

keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

keymap.set("n", "<leader>lf", vim.lsp.buf.format, { silent = true, desc = "Format current buffer" })
