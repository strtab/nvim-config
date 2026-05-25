return {
	"nvim-telescope/telescope.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Strings" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Diagnostics" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				theme = "center",
				sorting_strategy = "ascending",
				selection_caret = " ",
				entry_prefix = " ",
				initial_mode = "insert",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.75,
					},
					width = 0.9,
					height = 0.9,
					preview_cutoff = 120,
				},
				winblend = 0,
				borderchars = require("vi.core.ui").borderchars,
				path_display = { "tail" },
			},
		})
	end,
}
