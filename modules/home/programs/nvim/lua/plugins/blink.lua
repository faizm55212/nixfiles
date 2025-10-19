return {
  {
    "saghen/blink.cmp",
    event = { "BufReadPre", "BufNewFile" },
    version = "1.*",
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      fuzzy = { implementation = "rust" },
      keymap = {
        preset = "default",
        ["<cr>"] = { "accept", "fallback" },
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
  {
    "saghen/blink.pairs",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    dependencies = "saghen/blink.download",
    opts = {
      mappings = {
        enabled = true,
      },
    },
  },
}
