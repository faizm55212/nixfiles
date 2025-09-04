{
  bufferline = import ./bufferline.nix;
  cmp = import ./cmp.nix;
  lualine.enable = true;
  lazygit = {
    enable = true;
  };
  lsp = import ./lsp.nix;
  lz-n.enable = true;
  markview.enable = true;
  neo-tree = {
    enable = true;
    closeIfLastWindow = true;
  };
  noice = import ./noice.nix;
  none-ls = import ./none-ls.nix;
  rainbow-delimiters.enable = true;
  telescope = import ./telescope.nix;
  treesitter = import ./treesitter.nix;
  web-devicons.enable = true;
  which-key.enable = true;
}
