return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier
        -- null_ls.builtins.diagnostics.markdownlint,
        -- null_ls.builtins.formatting.mdformat,
        -- null_ls.builtins.diagnostics.vale,
        -- null_ls.builtins.diagnostics.codespell,
      },
    })
  end,
}
