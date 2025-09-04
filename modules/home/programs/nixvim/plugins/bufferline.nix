{
  enable = true;
  settings = {
    options = {
      diagnostics = "nvim_lsp";
      mode = "buffers";
      modified_icon = "●";
      offsets = [
        {
          filetype = "neo-tree";
          highlight = "Directory";
          text = "File Explorer";
          text_align = "center";
        }
      ];
    };
  };
}
