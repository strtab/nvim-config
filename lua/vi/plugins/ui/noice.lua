return {
  "folke/noice.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    presets = {
      bottom_search = true,
      long_message_to_split = true,
    },
    cmdline = {
      enabled = true,
      view = "cmdline",
      format = {
        cmdline = false,
        search_down = { icon = "/" },
        search_up = { icon = "?" },
        filter = false,
        lua = false,
        help = false,
      },
    },
    hover = { enabled = true },
    messages = { enabled = true },
    popupmenu = {
      enabled = true,
      kind_icons = false,
    },
    views = {
      confirm = {
        -- backend = "cmdline",
        border = { style = require("vi.core.ui").nui_border },
      },
      cmdline_input = {
        border = { style = require("vi.core.ui").nui_border },
      },
      notify = {
        replace = false,
        merge = false,
      },
    },
    notify = {
      enabled = true,
      timeout = 3500,
    },
    lsp = {
      enabled = true,
      progress = { enabled = true },
      hover = { enabled = false, silent = true },
      signature = { enabled = false },
    },
  },
}
