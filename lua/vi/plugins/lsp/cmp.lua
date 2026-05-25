return {
	{
		"hrsh7th/cmp-nvim-lsp",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/lazydev.nvim", opts = {} },
		},
		config = function()
			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/vim-vsnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				build = "make install_jsregexp",
			},
		},

		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- sources for autocompletion
			local sources_ = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "vsnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "spell" },
			}

			if package.loaded["nvim-highlight-colors"] then
				table.insert(sources_, 1, { name = "nvim-highlight-colors" })
			end

			cmp.setup({
				completion = { completeopt = "menu,menuone,preview,noselect" },

				snippet = { -- configure how nvim-cmp interacts with snippet engine
					expand = function(args)
						luasnip.lsp_expand(args.body)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					-- ["<C-p>"] = cmp.mapping.select_prev_item(),
					-- ["<C-m>"] = cmp.mapping.select_next_item(),
					["<C-u>"] = cmp.mapping.scroll_docs(-1),
					["<C-d>"] = cmp.mapping.scroll_docs(1),
					-- ["<C-n>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-c>"] = cmp.mapping.confirm({ select = true }),
				}),

				-- sources for autocompletion
				sources = cmp.config.sources(sources_),
			})
		end,
	},
}
