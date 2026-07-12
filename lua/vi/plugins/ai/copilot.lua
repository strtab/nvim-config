return {
	"zbirenbaum/copilot.vim",
	dependencies = { "zbirenbaum/copilot-cmp" },
	enabled = false,
	cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      auto_trigger = true,
    },
    panel = { enabled = false, },
    filetypes = {
      ["*"] = true,
      ["markdown"] = false,
      ["text"] = false,
      ["oil"] = false,
    },
  },
	config = function()
    vim.gcopilot_filetypes = {
      ["*"] = true,
      ["markdown"] = false,
      ["text"] = false,
      ["oil"] = false,
    }
		vim.g.copilot_assume_mapped = true

		-- vim.api.nvim_set_keymap("i", "<C-m>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		vim.g.copilot_no_tab_map = false
	end,
}
