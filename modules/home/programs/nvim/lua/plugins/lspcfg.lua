return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local servers = {
        "bashls",
        "clangd",
        "gopls",
        "helm_ls",
        "lua_ls",
        "nixd",
        "pyright",
        "rust_analyzer",
        "taplo",
        "terraformls",
        "yamlls",
      }
      for _, server in ipairs(servers) do
        local opts = { capabilities = capabilities }

        if server == "rust_analyzer" then
          opts.settings = {
            ["rust-analyzer"] = {
              checkOnSave = { command = "clippy" },
            },
          }
        end

        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end
      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Code hover" })
      vim.keymap.set("n", "<leader>cgd", vim.lsp.buf.definition, { desc = "Code goto definition" })
      vim.keymap.set("n", "<leader>cgD", vim.lsp.buf.declaration, { desc = "Code goto declaration" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code formatting" })
      vim.keymap.set("n", "<leader>cgr", vim.lsp.buf.rename, { desc = "Code smart rename" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "gotmpl",
          "helm",
          "hcl",
          "lua",
          "nix",
          "python",
          "qmljs",
          "rust",
          "terraform",
          "toml",
          "yaml",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
}
