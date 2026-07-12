return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  config = function()
    local custom_theme = {
      normal = {
        a = { fg = "#a59a84", bg = nil },
        b = { fg = "#8f8473", bg = nil },
        c = { fg = "#727169", bg = nil },
        x = { fg = "#727169", bg = nil },
        y = { fg = "#8f8473", bg = nil },
        z = { fg = "#a59a84", bg = nil },
      },
    }

    local mode_map = {
      ["n"] = "NOR",
      ["no"] = "NOR",
      ["i"] = "INS",
      ["ic"] = "BIN",
      ["R"] = "REP",
      ["v"] = "SEL",
      ["V"] = "LIN",
      [""] = "BLK",
      ["t"] = "TER",
      ["c"] = "CMD",
    }

    local function custom_mode()
      local mode = vim.api.nvim_get_mode().mode
      return mode_map[mode] or mode
    end

    local function get_oil_winbar()
      local dir = require("oil").get_current_dir()
      if dir then
        return vim.fn.fnamemodify(dir, ":~") -- Shows path with ~ for home
      else
        return vim.api.nvim_buf_get_name(0)
      end
    end

    require("lualine").hide({
      place = { "statusline", "tabline", "winbar" }, -- The segment this change applies to.
      unhide = false,                             -- whether to re-enable lualine again/
    })

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = custom_theme,

        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        always_show_tabline = false,
      },
      sections = {
        lualine_a = { custom_mode },
        lualine_b = {
          {
            function()
              if vim.bo.filetype == "oil" then
                return get_oil_winbar()
              end
              return vim.fn.expand("%t")
            end,
          },
          "selectioncount",
        },
        lualine_c = {
          { "diff",        colored = false, update_in_insert = false },
          { "diagnostics", colored = false, update_in_insert = false },
        },
        lualine_x = { "lsp_status", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
