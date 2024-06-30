return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				transparent_background = true,
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = { "italic" },
					keywords = { "bold" },
					operators = {},
				},
			})
			-- vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"phha/zenburn.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({
				search = { theme = "vscode" },
				styles = {
					comments = { italic = false },
					keywords = { italic = false, bold = true },
					functions = { italic = false, bold = true },
					variables = { italic = false },
				},
			})
			-- vim.cmd([[colorscheme nord]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
				styles = {
					comments = { italic = true, bold = false },
					keywords = {
						italic = false,
						bold = true,
					},
					functions = { italic = true, bold = false },
				},
				lualine_bold = true,
			})
			-- vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa-paper").setup({
				transparent = true,
				gutter = true,
				dimInactive = false, -- disabled when transparent
				commentStyle = { italic = true },
				functionStyle = { italic = true },
				keywordStyle = { italic = false, bold = true },
				statementStyle = { italic = false, bold = false },
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_cursor = "green"
			vim.g.everforest_transparent_background = '2'
			vim.g.everforest_diagnostic_text_highlight = true
			vim.g.everforest_diagnostic_line_highlight = true
			vim.cmd([[colorscheme everforest]])
		end,
	},
}
