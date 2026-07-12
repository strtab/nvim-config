return {
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa-paper").setup({
        -- enable undercurls for underlined text
        undercurl = true,
        -- transparent background
        transparent = false,
        -- highlight background for the left gutter
        gutter = false,
        -- background for diagnostic virtual text
        diag_background = true,
        -- dim inactive windows. Disabled when transparent
        dim_inactive = false,
        -- set colors for terminal buffers
        terminal_colors = false,
        -- cache highlights and colors for faster startup.
        -- see Cache section for more details.
        cache = false,
        compile = true,

        styles = {
          -- style for comments
          comment = { italic = true },
          -- style for functions
          functions = { italic = false },
          -- style for keywords
          keyword = { italic = false, bold = false },
          -- style for statements
          statement = { italic = false, bold = false },
          -- style for types
          type = { italic = false },
        },
        -- override default palette and theme colors
        colors = {
          palette = {},
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
            ink = {
              ui = {
                fg = "#bcb7aa",
                bg = "#000000",
                bg_statusline = "#000000",
                indent = "#232323",
              },
              tab = {
                bg = "#000000",
              }
            },
            canvas = {
              ui = {
                bg = "#fff9ee",
                bg_statusline = "#fff9ee",
                bg_float = "#d2cc9c",
                float = "#d2cc9c",
                bg_dim = "#e2dcac",
                indent = "#e2dcac",
              },
              tab = {
                bg = "#f2ecbc",
              }
            },
          },
        },
        -- adjust overall color balance for each theme [-1, 1]
        color_balance = {
          ink = { brightness = 0, saturation = 0 },
          canvas = { brightness = 0, saturation = 0 },
        },

        -- uses lazy.nvim, if installed, to automatically enable needed plugins
        auto_plugins = true,
        -- enable highlights for all plugins (disabled if using lazy.nvim)
        all_plugins = package.loaded.lazy == nil,
        -- manually enable/disable individual plugins.
        -- check the `groups/plugins` directory for the exact names
        plugins = {
          -- examples:
          -- rainbow_delimiters = true
          -- which_key = false
        },
      })
      vim.cmd("colorscheme kanagawa-paper")
    end,
  },
}
