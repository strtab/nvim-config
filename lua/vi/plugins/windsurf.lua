return {
	"Exafunction/windsurf.nvim",
	event = "VeryLazy",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},

	config = function()
		require("codeium").setup({
			enable_cmp_source = true,
			enable_chat = false,
			workspace_root = {
				use_lsp = true,
			},
		})
	end,
}
