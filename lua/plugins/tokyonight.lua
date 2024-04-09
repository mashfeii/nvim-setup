return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "moon",
		styles = {
			-- default comment
			comments = { italic = false, bold = false },
			keywords = {
				italic = false,
				bold = true,
			},
			functions = { italic = false, bold = true },
		},
		lualine_bold = true,
	},
}
