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
        styles = {            -- Handles the styles of general hi groups (see `:h highlight-args`):
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
      vim.cmd[[colorscheme tokyonight]]
    end,
  },
}
