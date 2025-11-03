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
              ["cmp.entry.get_documentation"] = true,
            },
          },
          presets = {
            long_message_to_split = true,
            lsp_doc_border = false,
          },
        },
      },
    },
    opts = {
      indent = { enabled = true },
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
        desc = "Open terminal",
      },
    },
  },
}
