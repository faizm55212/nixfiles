return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      {
        "folke/noice.nvim",
        opts = {
          lsp = {
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
          },
          presets = {
            long_message_to_split = true, -- long messages will be sent to a split
            lsp_doc_border = false, -- add a border to hover docs and signature help
          },
        },
      },
    },
    opts = {
      lazygit = { enabled = true },
      notifier = { enabled = true },
      terminal = { enabled = true },
    },
    keys = {
      {
        "<leader>lg",
        function()
          require("snacks").lazygit()
        end,
        desc = "lazygit",
      },
      {
        "<C-q>",
        function()
          require("snacks").bufdelete()
        end,
        desc = "Close buffer (Confirm)",
      },
      {
        "<leader>nd",
        function()
          require("snacks").notifier.hide()
        end,
        desc = "Hide notifications",
      },
      {
        "<C-`>",
        function()
          require("snacks").terminal()
        end,
        desc = "lazygit",
      },
    },
  },
}
