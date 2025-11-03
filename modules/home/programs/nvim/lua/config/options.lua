-- basic --
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.laststatus = 3
vim.g.editorconfig = true

-- clipboard --
vim.opt.clipboard:append("unnamedplus")

-- line numbers --
vim.opt.rnu = true
vim.opt.nu = true

-- mouse --
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"

-- tab stops --
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- search --
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- fold options --
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- diagnostics --
local severity = vim.diagnostic.severity

vim.diagnostic.config({
  virtual_text = {
    source = false,
    prefix = "",
    spacing = 2,
  },
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

-- filetypes --
vim.filetype.add({
  pattern = {
    [".*/templates/.*%.yaml"] = "helm",
    [".*/templates/.*%.yml"] = "helm",
  },
})
