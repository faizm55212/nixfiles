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
    command = "lua if vim.bo.filetype ~= 'helm' then vim.lsp.buf.format({ async = false }) end";
  }
  # {
  #   event = "FileType";
  #   pattern = [ "helm" ];
  #   command = "LspRestart";
  # }
]
