return {
	"neovim/nvim-lspconfig",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/lazydev.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"m-demare/hlargs.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local opts = { silent = true }

		local map = function(keys, func)
			vim.keymap.set("n", keys, func, opts)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)

				-- qmlls sends broken semantic tokens, causes nil arithmetic crash
				if client and client.name == "qmlls" then
					client.server_capabilities.semanticTokensProvider = nil
				end

				opts.buffer = ev.buf

				opts.desc = "Goto definition"
				map("gd", require("telescope.builtin").lsp_definitions)

				opts.desc = "Goto references"
				map("gr", require("telescope.builtin").lsp_references)

				opts.desc = "Goto implementation"
				map("gI", require("telescope.builtin").lsp_implementations)

				opts.desc = "Diagnostic"
				map("<leader>d", vim.diagnostic.open_float)

				opts.desc = "Hover documentation"
				map("K", vim.lsp.buf.hover)

				opts.desc = "Rename"
				map("<leader>r", vim.lsp.buf.rename)

				opts.desc = "Toggle diagnostic"
				map("<leader>lt", function()
					if vim.diagnostic.is_enabled() then
						vim.diagnostic.enable(false)
					else
						vim.diagnostic.enable(true)
					end
				end)
			end,
		})

		opts.desc = "Lsp install"
		map("<leader>li", ":LspInstall<CR>")

		opts.desc = "Lsp uninstall"
		map("<leader>lu", ":lsp uninstall<CR>")

		opts.desc = "Lsp restart"
		map("<leader>lr", ":lsp restart<CR>")

		opts.desc = "Lsp enable"
		map("<leader>le", ":lsp enable<CR>")

		opts.desc = "Lsp disable"
		map("<leader>ld", ":lsp disable<CR>")

		opts.desc = "Lsp stop"
		map("<leader>ls", ":lsp stop<CR>")

		opts.desc = "Format current buffer"
		map("<leader>lf", vim.lsp.buf.format)

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		vim.diagnostic.config({
			underline = false,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "<",
			},
			severity_sort = true,
			float = { border = "none" },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
		})

		vim.lsp.config("*", {
			capabilities = {
				workspace = {
					fileOperations = {
						didRename = true,
						willRename = true,
					},
				},
			},
		})

		vim.lsp.config("stylua", { enabled = false })

		vim.lsp.config("qmlls", {
			capabilities = capabilities,
			cmd_env = { QT_QML_GENERATE_QMLLS_INI = "1" },
			cmd = { "qmlls", "--build-dir", "/run/current-system/sw/lib/qt-6/qml" },
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
						maxPreload = 1000,
						preloadFileSize = 150,
					},
					codeLens = {
						enable = true,
					},
					completion = {
						callSnippet = "Replace",
					},
					hint = {
						enable = true,
						setType = false,
						paramType = true,
						paramName = "Disable",
						semicolon = "Disable",
						arrayIndex = "Disable",
					},
				},
			},
		})

		vim.lsp.config("nil_ls", { -- For me, nixd didn't work properly.
			capabilities = capabilities,
			settings = {
				["nil"] = {
					nix = {
						flake = {
							autoArchive = false,
							autoEvalInputs = false,
						},
					},
					formatting = {
						command = { "nixfmt" },
					},
				},
			},
		})

		vim.lsp.enable({ "qmlls", "lua_ls", "nil_ls" })
	end,
}
