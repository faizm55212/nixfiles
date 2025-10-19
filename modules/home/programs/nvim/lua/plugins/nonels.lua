return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local fmt = null_ls.builtins.formatting
      local dgn = null_ls.builtins.diagnostics
      null_ls.setup({
        sources = {
          fmt.alejandra,
          fmt.stylua,
          fmt.terraform_fmt,
          fmt.terragrunt_fmt,

          -- diagnostics
          dgn.terraform_validate,
        },
      })
    end,
    event = "BufReadPre",
  },
}
