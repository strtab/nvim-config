return {
  "nvimdev/dashboard-nvim",
  enabled = false,
  event = "VimEnter",
  config = function()
    local art
    -- local width = vim.o.columns
    -- if width >= 170 then
    --   art = {
    --     "=================     ===============     ===============   ========  ========",
    --     "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
    --     "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
    --     "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
    --     "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
    --     "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
    --     "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
    --     "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
    --     "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
    --     "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
    --     "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
    --     "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
    --     "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
    --     "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
    --     "||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||",
    --     "||.=='    _-'                                                     `' |  /==.||",
    --     "=='    _-'                       N E O V I M                          \\/   `==",
    --     "\\   _-'                                                                `-_   /",
    --     " `''                                                                      ``'",
    --   }
    -- elseif width >= 90 then
    --   art = {
    --     "______ _____ ____ ___ ___",
    --     "`  _  V  _  V  _ \\|  V  ´",
    --     "| | | | | | | | | | . . |",
    --     "| | | | | | | | | | |V| |",
    --     "| |/ / \\ \\| | |/ /\\ | | |",
    --     "|   /   \\__/ \\__/  \\| | |",
    --     "|  /                ' | |",
    --     "| /    N E O V I M    \\ |",
    --     "´´                     ``",
    --     "",
    --   }
    -- else
    --   art = {""}
    -- end
    art = {}
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = art,
        center = {
          {
            icon = "> ",
            icon_hl = "Title",
            desc = "New file",
            desc_hl = "String",
            keymap = "Enter",
            key_hl = "Number",
            key_format = " %s",
            action = ":enew",
          },
          {
            icon = "> ",
            icon_hl = "Title",
            desc = "Check health",
            desc_hl = "String",
            action = ":checkhealth",
          },
          {
            icon = "> ",
            icon_hl = "Title",
            desc = "News",
            desc_hl = "String",
            action = ":help news",
          },
          {
            icon = "> ",
            icon_hl = "Title",
            desc = "Find File",
            desc_hl = "String",
            key = "f",
            keymap = "SPC f",
            key_hl = "Number",
            key_format = " %s",
            action = "lua require('telescope.builtin').find_files()",
          },
          {
            icon = "> ",
            icon_hl = "Title",
            desc_hl = "String",
            desc = "Find String",
            key = "s",
            keymap = "SPC f",
            key_format = " %s",
            action = "lua require('telescope.builtin').live_grep()",
          },
          -- {
          --   icon = "> ",
          --   icon_hl = "Title",
          --   desc = "Exit",
          --   key = "q",
          --   keymap = "CTRL w",
          --   key_format = " %s",
          --   action = "q",
          -- },
        },
        -- footer = {},
        vertical_center = true, -- Center the Dashboard on the vertical (from top to bottom)
      },
    })
  end,
}
