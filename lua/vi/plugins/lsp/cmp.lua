return {
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/lazydev.nvim",                  opts = {} },
    },
    config = function()
      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config("*", { capabilities = capabilities })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",        -- Source for text in buffer
      "hrsh7th/cmp-path",          -- Source for file system paths
      "hrsh7th/cmp-nvim-lsp",      -- Lsp
      "ray-x/cmp-treesitter",      -- Treesitter
      "saadparwaiz1/cmp_luasnip",  -- For autocomplettion
      "onsails/lspkind.nvim",      -- vs-code like pictograms
      "rafamadriz/friendly-snippets", -- Snippets
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
      local default_cmp_sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "spell" },
      }

      if package.loaded["nvim-highlight-colors"] then
        table.insert(default_cmp_sources, 1, { name = "nvim-highlight-colors" })
      end

      local bufIsBig = function(bufnr)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if ok and stats and stats.size > max_filesize then
          return true
        else
          return false
        end
      end

      vim.api.nvim_create_autocmd("BufReadPre", {
        callback = function(t)
          local sources = vim.deepcopy(default_cmp_sources)
          if not bufIsBig(t.buf) then
            sources[#sources + 1] = { name = "treesitter", group_index = 2 }
          end
          cmp.setup.buffer({ sources = sources })
        end,
      })

      -- fucntions for keymaps
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        if col == 0 then
          return false
        end
        return vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(1, col):match("%S") ~= nil
      end

      cmp.setup({
        enabled = function()
          local disabled = false
          disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
          disabled = disabled or (vim.fn.reg_recording() ~= "")
          disabled = disabled or (vim.fn.reg_executing() ~= "")
          disabled = disabled or require("cmp.config.context").in_treesitter_capture("comment")
          return not disabled
        end,
        completion = { completeopt = "menu,menuone,preview,noselect" },

        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-u>"] = cmp.mapping.scroll_docs(-1),
          ["<C-d>"] = cmp.mapping.scroll_docs(1),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping(function(fallback)
            if has_words_before() and cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({ select = true })
              end
            else
              fallback()
            end
          end),

          ["<Tab>"] = cmp.mapping(function(fallback)
            -- if has_words_before() and cmp.visible() then
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({ select = true })
              end
            else
              fallback()
            end
          end),
        }),
        experimental = { ghost_text = false },

        -- sources for autocompletion
        sources = cmp.config.sources(default_cmp_sources),

        formatting = {
          format = require("lspkind").cmp_format({
            maxwidth = 25,
            ellipsis_char = "...",
          }),
        },

        -- window = {
        -- 	completion = cmp.config.window.bordered(),
        -- 	documentation = cmp.config.window.bordered({
        -- 		winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
        -- 	}),
        -- },
      })
    end,
  },
}
