return {
	"neovim/nvim-lspconfig",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/lazydev.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"m-demare/hlargs.nvim", -- Better highlights arguments
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { silent = true }

		local map = function(keys, func)
			vim.keymap.set("n", keys, func, opts)
		end

		-- This function gets run when an LSP attaches to a particular buffer.
		--  That is to say, every time a new file is opened that is associated with
		--  an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
		--  function will be executed to configure the current buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				opts.buffer = ev.buf
				-- Jump to the definition of the word under your cursor.
				-- This is where a variable was first declared, or where a function is defined, etc.
				-- To jump back, press <C-T>.
				opts.desc = "Goto definition"
				map("gd", require("telescope.builtin").lsp_definitions)

				-- Find references for the word under your cursor.
				opts.desc = "Goto references"
				map("gr", require("telescope.builtin").lsp_references)

				-- Jump to the implementation of the word under your cursor.
				-- Useful when your language has ways of declaring types without an actual implementation.
				opts.desc = "Goto implementation"
				map("gI", require("telescope.builtin").lsp_implementations)

				-- Open diagnostic window for the word under your cursor.
				opts.desc = "Diagnostic"
				map("<leader>d", vim.diagnostic.open_float)

				-- Opens a pop-up that displays documentation about the word under your cursor
				-- See `:help K` for why this keymap.
				opts.desc = "Hover documentation"
				map("K", vim.lsp.buf.hover)

				-- Rename the variable under your cursor
				-- Most lsp support renaming across files, etc.
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

		-- LSP servers and clients are able to communicate to each other what features they support.
		-- By default, neovim doesn't support everything that is in the LSP Specification.
		-- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities()
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
			servers = {
				["*"] = {
					capabilities = {
						workspace = {
							fileOperations = {
								didRename = true,
								willRename = true,
							},
						},
					},
				},
				stylua = { enabled = false },
				qmlls = {
					enabled = true,
					cmd_env = { QT_QML_GENERATE_QMLLS_INI = "1" },
					cmd = { "qmlls", "--build-dir", "/run/current-system/sw/lib/qt-6/qml" },
				},
				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					-- Use this to add any additional keymaps
					-- for specific lsp servers
					-- ---@type LazyKeysSpec[]
					-- keys = {},
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
				},
			},
		})
	end,
}
