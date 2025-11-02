---@diagnostic disable: missing-fields
return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
        "gopls",
        "helm_ls",
        "lua_ls",
        "pyright",
        "terraformls",
        "yamlls",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvimtools/none-ls.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      local fmt = null_ls.builtins.formatting
      local dgn = null_ls.builtins.diagnostics

      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "alejandra", "terraform_fmt" },
      })

      null_ls.setup({
        sources = {
          fmt.alejandra,
          fmt.clang_format,
          fmt.stylua,
          fmt.terraform_fmt,
          fmt.terragrunt_fmt,

          -- diagnostics
          dgn.terraform_validate,
          dgn.kube_linter,
        },
      })
    end,
  },
}
