return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  ft = { "markdown", "markdown_inline", "comment", "html", "latex", "yaml" },
  config = function()
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      pattern = { "*.md", "*.txt" },
      callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true -- wrap by words, not chars
      end,
    })
    require("markview").setup({
      preview = {
        icon_provider = "",
      },
      markdown = {
        enable = true,
        headings = {
          enable = true,
          shift_width = 0,
          heading_1 = {
            style = "simple",
            hl = "MarkviewHeading1",
          },
          heading_2 = {
            style = "simple",
            hl = "MarkviewHeading2",
          },
          heading_3 = {
            style = "simple",
            hl = "MarkviewHeading3",
          },
          heading_4 = { style = "simple" },
          heading_5 = { style = "simple" },
          heading_6 = { style = "simple" },
        },

        code_blocks = {
          enable = true,
          style = "block",
          hl = "MarkviewCode",
          info_hl = "MarkviewCodeInfo",
          min_width = 60,
          pad_amount = 2,
          pad_char = " ",
          language_direction = "right",
        },

        tables = {
          enable = true,
          parts = {
            top = { "╭", "─", "╮", "┬" },
            header = { "│", "│", "│" },
            separator = { "├", "─", "┤", "┼" },
            row = { "│", "│", "│" },
            bottom = { "╰", "─", "╯", "┴" },
            align_left = "╼",
            align_right = "╾",
            align_center = { "╴", "╶" },
          },
          hl = {
            top = "MarkviewTableBorder",
            header = "MarkviewTableHeader",
            separator = "MarkviewTableBorder",
            row = "MarkviewTableRow",
            bottom = "MarkviewTableBorder",
            align_left = "MarkviewTableAlignLeft",
            align_right = "MarkviewTableAlignRight",
            align_center = "MarkviewTableAlignCenter",
          },
        },

        block_quotes = {
          enable = true,
          default = {
            border = "▋",
            border_hl = "MarkviewBlockQuoteBorder",
          },
          callouts = {
            {
              match_string = "NOTE",
              callout_preview = " Note",
              callout_preview_hl = "MarkviewBlockQuoteNote",
              border = "▋",
              border_hl = "MarkviewBlockQuoteNote",
              title = true,
              icon = " ",
            },
            {
              match_string = "WARNING",
              callout_preview = " Warning",
              callout_preview_hl = "MarkviewBlockQuoteWarn",
              border = "▋",
              border_hl = "MarkviewBlockQuoteWarn",
              title = true,
              icon = " ",
            },
            {
              match_string = "TIP",
              callout_preview = " Tip",
              callout_preview_hl = "MarkviewBlockQuoteOk",
              border = "▋",
              border_hl = "MarkviewBlockQuoteOk",
              title = true,
              icon = " ",
            },
            {
              match_string = "IMPORTANT",
              callout_preview = " Important",
              callout_preview_hl = "MarkviewBlockQuoteSpecial",
              border = "▋",
              border_hl = "MarkviewBlockQuoteSpecial",
              title = true,
              icon = " ",
            },
          },
        },

        horizontal_rules = {
          enable = true,
          parts = {
            {
              type = "repeating",
              repeat_amount = function()
                return vim.o.columns
              end,
              text = "─",
              hl = "MarkviewGradient5",
            },
          },
        },

        list_items = {
          enable = true,
          shift_width = 2,
          marker_minus = { add_padding = true, marker = "•" },
          marker_plus = { add_padding = true, marker = "◦" },
          marker_star = { add_padding = true, marker = "•" },
        },
      },

      markdown_inline = {
        enable = true,
        inline_codes = {
          enable = true,
          hl = "MarkviewInlineCode",
        },
        checkboxes = {
          enable = true,
          checked = { text = "✓", hl = "MarkviewCheckboxChecked" },
          unchecked = { text = "○", hl = "MarkviewCheckboxUnchecked" },
        },
      },
    })
  end,
}
