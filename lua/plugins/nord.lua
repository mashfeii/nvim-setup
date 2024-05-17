return {
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        search = { theme = "vscode" },
        -- styles = {
        --   comments = { italic = false },
        --   keywords = { italic = false, bold = true },
        --   functions = { italic = false, bold = true },
        --   variables = { italic = false },
        -- },
      })
      -- vim.cmd([[colorscheme nord]])
    end,
  },
}
