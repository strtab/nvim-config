return {
  {
    "stevearc/oil.nvim",
    enabled = true,
    config = function()
      local oil = require("oil")
      oil.setup({
        default_file_explorer = true,
        columns = {
          { "permissions" },
          { "size" },
        },
        delete_to_trash = true,
        watch_for_changes = true,

        view_options = {
          show_hidden = true,
          natural_order = "fast",
          get_win_title = nil,
        },

        win_options = {
          signcolumn = "yes:1",
        },

        keymaps = {
          ["g?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["<C-s>"] = { "actions.select", opts = { vertical = true } },
          ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
          ["<C-t>"] = { "actions.select", opts = { tab = true } },
          ["<C-p>"] = "actions.preview",
          ["q"] = { "actions.close", mode = "n" },
          ["<C-l>"] = "actions.refresh",
          ["-"] = { "actions.parent", mode = "n" },
          ["_"] = { "actions.open_cwd", mode = "n" },
          ["`"] = { "actions.cd", mode = "n" },
          ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          ["gs"] = { "actions.change_sort", mode = "n" },
          ["gx"] = "actions.open_external",
          ["g."] = { "actions.toggle_hidden", mode = "n" },
          ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        use_default_keymaps = false,

        preview_win = {
          update_on_cursor_moved = true,
          preview_method = "fast_scratch",
        },

        confirmation = {
          max_width = 0.5,
          min_width = { 40, 0.4 },
          max_height = 0.5,
          min_height = { 5, 0.1 },
          win_options = {
            winblend = 0,
          },
        },
      })
      require("vim.keymap").set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Files" })
    end,
  },
}
