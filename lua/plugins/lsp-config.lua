return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end 
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "tsserver", "ltex", "marksman", "rust_analyzer" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig"
  }
} 
