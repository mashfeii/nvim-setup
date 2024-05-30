return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "archibate/lualine-time" },
  config = function()
    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        -- theme = "nord",
        theme = "tokyonight",
      },
      sections = {
        lualine_a = { { "mode", right_padding = 2 } },
        lualine_b = { "filename", "branch" },
        lualine_c = { "diagnostics", "%=", "ctime", "cdate" },
        lualine_x = { "fileformat", "filetype" },
        lualine_z = {
          { "location", left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      extensions = { "neo-tree", "lazy", "quickfix" },
    })
  end,
}
