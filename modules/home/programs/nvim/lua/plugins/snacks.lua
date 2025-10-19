return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
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
