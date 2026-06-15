return {
	"sainnhe/gruvbox-material",
	enalbe = true,
	cond = vim.g.neovide == true,
	priority = 1000,

	config = function()
		vim.g.gruvbox_material_cursor = "orange"
		vim.g.gruvbox_material_background = "soft"
		vim.g.gruvbox_material_foreground = "original"
		vim.g.gruvbox_material_better_performance = true
		vim.g.gruvbox_material_bold = true

		vim.o.winblend = 100
		vim.o.pumblend = 100

		vim.g.neovide_floating_blur_amount_x = 30
		vim.g.neovide_floating_blur_amount_y = 30

		vim.g.gruvbox_material_transparent_background = false

		vim.cmd.colorscheme("gruvbox-material")
		vim.o.background = "light"

		vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
		vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
		vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
	end,
}
