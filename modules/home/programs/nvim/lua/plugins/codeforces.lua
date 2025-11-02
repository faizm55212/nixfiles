---@diagnostic disable: missing-fields
return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  cmd = "CompetiTest",
  config = function()
    require("competitest").setup({
      received_problems_path = "/home/unknown/Development/comp_coding/codeforces/$(PROBLEM)/$(PROBLEM).$(FEXT)",
      testcases_directory = "testcases",
      testcases_use_single_file = true,
      template_file = "/home/unknown/Development/comp_coding/codeforces/template.cpp",
      evaluate_template_modifiers = true,
      runner_ui = {
        interface = "split",
      },
      compile_command = {
        cpp = { exec = "g++", args = { "-Wall", "-g", "$(FNAME)", "-o", "$(FNOEXT)" } },
      },
      split_ui = {
        position = "right",
        relative_to_editor = true,
        total_width = 0.3,
        vertical_layout = {
          { 1, { { 1, "tc" }, { 1, "si" } } },
          { 1, { { 1, "so" }, { 1, "eo" } } },
          { 1, "se" },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>ctp",
      "<cmd>CompetiTest receive problem<cr>",
      desc = "Start competitest",
    },
    {
      "<leader>cr",
      "<cmd>CompetiTest run<cr>",
      desc = "Run current code",
    },
  },
}
