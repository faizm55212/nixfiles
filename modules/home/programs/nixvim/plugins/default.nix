{
  lualine.enable = true;
  lazygit = {
    enable = true;
  };
  lsp = import ./lsp.nix;
  cmp = import ./cmp.nix;
  none-ls = import ./none-ls.nix;
  telescope = import ./telescope.nix;
  treesitter = import ./treesitter.nix;
  neo-tree = {
    enable = true;
    closeIfLastWindow = true;
  };
  noice = import ./noice.nix;
  rainbow-delimiters.enable = true;
  web-devicons.enable = true;
  which-key.enable = true;
  lz-n.enable = true;
}
