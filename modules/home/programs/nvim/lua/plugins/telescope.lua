return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({}),
        },
      })
      telescope.load_extension("ui-select")
    end,
    keys = {
      { "<leader>ts", "<cmd>Telescope live_grep<cr>", desc = "Search grep" },
      { "<leader>tq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix list" },
    },
  },
}

