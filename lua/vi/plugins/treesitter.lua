return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  build = ":TSUpdate",
  tag = "v0.9.3",
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  opts_extend = { "ensure_installed" },
  config = function()
    require("nvim-treesitter").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      incremental_selection = { enable = false },
    })
  end,
}
