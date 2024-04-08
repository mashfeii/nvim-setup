return {
	"echasnovski/mini.pairs",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>tp",
			function()
				vim.g.minipairs_disable = not vim.g.minipairs_disable
				if vim.g.minipairs_disable then
					vim.warn("Disabled auto pairs", { title = "Option" })
				else
					vim.info("Enabled auto pairs", { title = "Option" })
				end
			end,
			desc = "Toggle auto pairs",
		},
	},
}
