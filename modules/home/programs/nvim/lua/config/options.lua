-- basic --
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.undofile = true
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

-- seach --
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- diagnostics --
vim.diagnostic.config({
  virtual_text = {
    source = false,
    prefix = "●",
    spacing = 2,
  },
  signs = true,
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
