return {
	"nvimdev/dashboard-nvim",
	enabled = true,
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"",
					"        _ __",
					" _   __(_) /",
					"| | / / / /",
					"| |/ / /_/",
					"|___/_(_)",
					"",
				},
				center = {
					{
						icon = "> ",
						desc = "New file",
						desc_hl = "String",
						keymap = "Enter",
						key_hl = "Number",
						key_format = " %s",
						action = ":enew",
					},
					{
						icon = "> ",
						desc = "Find File",
						desc_hl = "String",
						key = "f",
						keymap = "SPC f",
						key_hl = "Number",
						key_format = " %s",
						action = "lua require('telescope.builtin').find_files()",
					},
					{
						icon = "> ",
						icon_hl = "Title",
						desc_hl = "String",
						desc = "Find String",
						key = "s",
						keymap = "SPC f",
						key_format = " %s",
						action = "lua require('telescope.builtin').live_grep()",
					},
					{
						icon = "> ",
						icon_hl = "Title",
						desc = "Exit",
						key = "q",
						keymap = "Ctrl w",
						key_format = " %s",
						action = "q",
					},
				},
				-- footer = {},
				vertical_center = true, -- Center the Dashboard on the vertical (from top to bottom)
			},
		})
	end,
}
