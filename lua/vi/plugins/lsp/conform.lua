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
        yaml = { "prettier" },
        php = { "pint" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        rust = { "rustfmt" },
        nix = { "nixfmt" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
  end,
}
