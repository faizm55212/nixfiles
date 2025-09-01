[
  {
    event = "FileType";
    pattern = [
      "markdown"
    ];
    command = "setlocal spell spelllang=en";
  }
  {
    event = "BufWritePre";
    pattern = [ "*" ];
    command = "lua vim.lsp.buf.format({ async = false })";
  }
]
