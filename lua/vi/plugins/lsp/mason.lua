return {
	{
		"williamboman/mason.nvim",
		enabled = true,
		cmd = "Mason",
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		dependencies = {
			"mason-org/mason-registry",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "-",
						package_pending = ">",
						package_uninstalled = "+",
					},
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"yamlls",
					"bashls",
					"gopls",
				},
			})
		end,
	},
}
