return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "c", "cpp", "lua", "vim", "javascript", "html", "css", "markdown", "markdown_inline", "latex" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
