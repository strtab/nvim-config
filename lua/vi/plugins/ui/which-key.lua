return {
	"folke/which-key.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
			notify = false,
			win = {
				border = require("vi.core.ui").border,
				padding = { 1, 2 },
				title = false,
				zindex = 1000,
			},
			icons = {
				separator = "",
				group = "",
				ellipsis = "…",
				mappings = false,
				colors = true,
			},
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 30, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			show_help = false,
			show_keys = false,
		})
		wk.add({
			{ "<leader>f", group = "file" }, -- group
			{ "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
			{
				"<leader>b",
				group = "buffers",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			{
				-- Nested mappings are allowed and can be added in any order
				-- Most attributes can be inherited or overridden on any level
				-- There's no limit to the depth of nesting
				mode = { "n", "v" }, -- NORMAL and VISUAL mode
				{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
				{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
			},
		})
		wk.add({
			{
				mode = { "n" },
				{ "<leader>b", group = "Buffers" },
				{ "<leader>e", group = "Files" },
				{ "<leader>f", group = "Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gt", group = "Toggle" },
				{ "<leader>h", group = "Git Hunk" },
				{ "<leader>l", group = "Lsp" },
				{ "<leader>o", group = "Org" },
				{ "<leader>s", group = "Surround" },
				{ "<leader>u", group = "Ui" },
			},
		})
	end,
}
