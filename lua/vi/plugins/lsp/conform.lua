return {
	"stevearc/conform.nvim",
	enabled = true,
	cmd = "ConformInfo",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "goimports", "gofmt" },
				lua = { "lua_ls" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				python = { "isort", "black" },
				php = { "pint" },
				sh = { "shfmt" },
				fish = { "fish_indent" },
				bash = { "shfmt" },
				rust = { "rustfmt" },
			},
			formatters = {
				injected = { options = { ignore_errors = true } },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 10000,
				lsp_format = "fallback",
			},
		})
	end,
}
