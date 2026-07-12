return {
  "akinsho/bufferline.nvim",
  enabled = false,
  opts = {
    options = {
      mode = "tabs",
      modified_icon = "+ ",
      color_icons = false,
      show_buffer_icons = false, -- disable filetype icons for buffers
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
      show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
      move_wraps_at_ends = false,        -- whether or not the move command "wraps" at the first or last position
    },
  },
}
