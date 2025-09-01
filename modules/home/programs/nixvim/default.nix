{ ... }:

{
  programs.nixvim = {
    enable = true;
    autoCmd = import ./autocmd.nix;
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy .enable = true;
    };
    colorschemes.gruvbox-material-nvim = {
      enable = true;
      settings = {
        contrast = "hard";
        background = {
          transparent = true;
        };
      };
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = import ./keymaps.nix;
    opts = import ./options.nix;
    plugins = import ./plugins;
    nixpkgs.useGlobalPackages = true;
  };
}
