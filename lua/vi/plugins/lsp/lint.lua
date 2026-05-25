return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lint").linters_by_ft = {
      -- c = { "ast_grep" },
      -- rust = { "ast_grep" },
      -- go = { "ast_grep" },
      -- java = { "ast_grep" },
      -- python = { "ast_grep" },
      -- javascript = { "ast_grep" },
      -- jsx = { "ast_grep" },
      -- typescript = { "ast_grep" },
      -- html = { "ast_grep" },
      -- css = { "ast_grep" },
      -- kotlin = { "ast_grep" },
      -- dart = { "ast_grep" },
      -- lua = { "ast_grep" },
    }
  end,
}
