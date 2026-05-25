return {
	"lewis6991/gitsigns.nvim",
	enabled = true,
	config = function()
		local g = require("gitsigns")
		g.setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "-" },
				changedelete = { text = "~" },
				untracked = { text = "|" },
			},
			signs_staged_enable = true,
			signcolumn = true, -- Toggle with `:G toggle_signs`
			numhl = false, -- Toggle with `:G toggle_numhl`
			linehl = false, -- Toggle with `:G toggle_linehl`
			word_diff = false, -- Toggle with `:G toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:G toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			blame_formatter = nil, -- Use default
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})

		-- Navigation
		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				g.nav_hunk("next")
			end
		end, { desc = "Next hunk" })

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				g.nav_hunk("prev")
			end
		end, { desc = "Previous hunk" })

		-- Actions
		vim.keymap.set("n", "<leader>hs", g.stage_hunk, { desc = "Stage hunk" })
		vim.keymap.set("n", "<leader>hr", g.reset_hunk, { desc = "Reset hunk" })

		vim.keymap.set("v", "<leader>hs", function()
			g.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage hunk" })

		vim.keymap.set("v", "<leader>hr", function()
			g.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset hunk" })

		vim.keymap.set("n", "<leader>hS", g.stage_buffer, { desc = "Stage buffer" })
		vim.keymap.set("n", "<leader>hR", g.reset_buffer, { desc = "Reset buffer" })
		vim.keymap.set("n", "<leader>hp", g.preview_hunk, { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>hi", g.preview_hunk_inline, { desc = "Preview hunk inline" })

		vim.keymap.set("n", "<leader>hb", function()
			g.blame_line({ full = true })
		end, { desc = "Blame line" })

		vim.keymap.set("n", "<leader>hd", g.diffthis, { desc = "Diff this" })

		vim.keymap.set("n", "<leader>hD", function()
			g.diffthis("~")
		end, { desc = "Diff this ~" })

		vim.keymap.set("n", "<leader>hQ", function()
			g.setqflist("all")
		end, { desc = "Set quick fix list" })
		vim.keymap.set("n", "<leader>hq", g.setqflist, { desc = "Blame line" })

		-- Toggles
		vim.keymap.set("n", "<leader>gtb", g.toggle_current_line_blame, { desc = "Toggle current line blame" })
		vim.keymap.set("n", "<leader>gtw", g.toggle_word_diff, { desc = "Toggle word diff" })
		vim.keymap.set("n", "<leader>gts", g.toggle_signs, { desc = "Toggle signs" })

		-- Text object
		vim.keymap.set({ "o", "x" }, "ih", g.select_hunk, { desc = "select hunk" })
	end,
}
