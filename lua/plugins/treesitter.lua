return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "c", "cpp", "markdown", "lua", "vim", "vimdoc", "query" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
