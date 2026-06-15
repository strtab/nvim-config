return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	-- cond = vim.env.TERM ~= "linux",
	config = function()
		require("ibl").setup({
			indent = { char = "│" },
			exclude = {
				filetypes = { "dashboard", "markdown", "help" },
			},
			whitespace = {
				highlight = { "IblWhitespace" },
				remove_blankline_trail = true,
			},
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
			},
		})
	end,
	vim.keymap.set("n", "<leader>ui", "<cmd>IBLToggle<CR>", { silent = true, desc = "Toggle indent blankline" }),
}
