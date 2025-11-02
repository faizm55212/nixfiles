return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "gruvbox-material",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        always_show_bufferline = false,
        diagnostics = "nvim_lsp",
        mode = "buffer",
        modified_icon = "●",
        offsets = {
          {
            filetype = "neo-tree",
            highlight = "Directory",
            text = "File Explorer",
            text_align = "center",
          },
        },
      },
    },
  },
}
