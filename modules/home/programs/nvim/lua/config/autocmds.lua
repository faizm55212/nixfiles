vim.api.nvim_create_autocmd("FileType", {
  pattern = "qml",
  callback = function ()
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldexpr = "0"
  end
})
