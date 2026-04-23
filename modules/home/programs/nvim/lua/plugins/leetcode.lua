return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "python",
      picket = { provider = "telescope" },
      editor = { reset_previous_code = false, fold_imports = true },
      theme = {
          ["normal"] = {
            bg = "None"
        },
      },
    },
  },
}
