{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    filetype.pattern = {
      ".*/templates/.*%.yaml" = "helm";
      ".*/templates/.*%.yml" = "helm";
    };
    autoCmd = import ./autocmd.nix;
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
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
    diagnostic.settings = import ./diagnostic.nix;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = import ./keymaps.nix;
    opts = import ./options.nix;
    nixpkgs.useGlobalPackages = true;
    plugins = import ./plugins;
    extraPackages = with pkgs; [
      # extras
      lazygit
      ripgrep

      # formatter
      alejandra
      stylua

      # linter
      kube-linter

      # lsp servers
      bash-language-server
      gopls
      helm-ls
      lua-language-server
      nixd
      pyright
      terraform-ls
      yaml-language-server
    ];
  };
}
