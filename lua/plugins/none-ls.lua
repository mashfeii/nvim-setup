return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.code_actions.ts_node_action,
				null_ls.builtins.completion.spell,
				null_ls.builtins.diagnostics.cppcheck,
				null_ls.builtins.diagnostics.write_good,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.codespell,
				null_ls.builtins.formatting.markdownlint,
			},
		})

		vim.keymap.set("n", "<leader>for", vim.lsp.buf.format, {})
	end,
}
