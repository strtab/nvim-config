return {
	"seblyng/roslyn.nvim",
	enabled = true,
	ft = "cs",
	config = function()
		vim.lsp.config("roslyn", {
			-- Unity solution is big, fullSolution analysis kills performance
			settings = {
				["csharp|background_analysis"] = {
					dotnet_analyzer_diagnostics_scope = "openFiles",
					dotnet_compiler_diagnostics_scope = "openFiles",
				},
			},
		})
		require("roslyn").setup({
			-- Unity project root may not contain nvim's cwd
			broad_search = true,
			-- let roslyn handle watching, nvim's own watcher chokes on meta files
			filewatching = "roslyn",
		})
	end,
}
