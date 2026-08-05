return {
  "nvimdev/dashboard-nvim",
  enabled = true,
  cond = function()
    return vim.fn.getcwd() == vim.fn.expand("~/.obsidian/notes")
  end,
  event = "VimEnter",
  config = function()
    local art
    local width = vim.o.columns
    if width >= 100 then
      art = {
        "         ▗▄▟██                       ",
        "       ▄█████▛ █▄                    ",
        "      ▐█████▛ ▟███                   ",
        "      ▐████▛ ▟████▌                  ",
        "     ▗ ▜███▎▐█████▌                  ",
        "    ▗█▙ ▜██▎▐██████                  ",
        "   ▗███▙ ▜█▙ ▜█████▙                 ",
        "  ▗█████▙ ▄▄▄▄▃▔▀███▙                ",
        "  ▝██████ ██████▄ ▜█▘                ",
        "   ▀████▛ ███████▙ ▘                 ",
        "     ▀█▛ ▟████████▌  Obsidian Neovim ",
        "        ▝▀▀▀▀████▀                   ",
        "",
        "",
      }
    else
      art = { "" }
    end

    vim.api.nvim_set_hl(0, 'DashboardHeader', { link = "Number" })
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = art,
        center = {
          {
            desc = "Create new note",
            desc_hl = "String",
            action = ":ObsidianNew",
          },
          {
            desc = "Create daily note",
            desc_hl = "String",
            action = ":ObsidianToday",
          },
          {
            desc = "Go to file",
            desc_hl = "String",
            key = "f",
            keymap = "SPC f",
            key_hl = "Number",
            key_format = " %s",
            action = "lua require('telescope.builtin').find_files()",
          },
          {
            desc = "Find string",
            desc_hl = "String",
            key = "o",
            keymap = "SPC f",
            key_hl = "Number",
            key_format = " %s",
            action = ":ObsidianSearch",
          },
          {
            desc = "Search by tag",
            desc_hl = "String",
            key = "t",
            keymap = "SPC f",
            key_hl = "Number",
            key_format = " %s",
            action = ":ObsidianTags",
          },
        },
        vertical_center = true,
      },
    })
  end,
}
