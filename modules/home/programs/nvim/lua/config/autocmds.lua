vim.api.nvim_create_autocmd("FileType", {
  pattern = "qml",
  callback = function ()
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldexpr = "0"
  end
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local win = vim.api.nvim_get_current_win()
    local ft = vim.bo[buf].filetype

    if ft:match("^CompetiTest") or ft:match("^dapui_") then
      vim.defer_fn(function()
        local ok, title = pcall(vim.api.nvim_buf_get_var, buf, "competitest_title")
        local text = ok and title or ft
        vim.api.nvim_set_option_value(
          "winbar",
          "%=" .. text .. "%=",
          { scope = "local", win = win }
        )
      end, 100)
    end
  end,
})
