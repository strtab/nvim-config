vim = vim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--depth 1",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("vi.core.colorscheme")
  end,
})

require("lazy").setup({
  spec = {
    { import = "vi.plugins" },
    { import = "vi.plugins.ui" },
    { import = "vi.plugins.lsp" },
    { import = "vi.plugins.git" },
    { import = "vi.plugins.notes" },
  },
  ui = {
    border = require("vi.core.ui").border,
    size = { width = 0.8, height = 0.8 },
    pills = true,
  },
  checker = {
    enabled = false,
    notify = false,
  },
  install = {
    colorscheme = { "default" },
  },
  change_detection = {
    enabled = false,
  },
  performance = {
    disabled_plugins = {
      -- "tutor",
      -- "netrwPlugin",
      "gzip",
      -- "matchit",
      -- "matchparen",
      -- "tarPlugin",
      -- "tohtml",
      -- "zipPlugin",
    },
  },
  readme = {
    enabled = false,
  },
})
