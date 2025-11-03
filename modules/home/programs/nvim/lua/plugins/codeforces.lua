return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  cmd = "CompetiTest",
  config = function()
    require("competitest").setup({
      compile_command = {
        cpp = { exec = "g++", args = { "-Wall", "-g", "$(FNAME)", "-o", "$(FNOEXT)" } },
      },
      evaluate_template_modifiers = true,
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
      start_receiving_persistently_on_setup = true,
      received_problems_path = "/home/unknown/Development/comp_coding/codeforces/$(PROBLEM)/$(PROBLEM).$(FEXT)",
      runner_ui = {
        interface = "split",
      },
      template_file = "/home/unknown/Development/comp_coding/codeforces/template.cpp",
      testcases_directory = "testcases",
      testcases_use_single_file = true,
    })
  end,
  keys = {
    {
      "<leader>cps",
      "<cmd>CompetiTest receive problem<cr>",
      desc = "CompetiTest start",
    },
    {
      "<leader>cpr",
      "<cmd>CompetiTest run<cr>",
      desc = "CompetiTest run code",
    },
  },
}
