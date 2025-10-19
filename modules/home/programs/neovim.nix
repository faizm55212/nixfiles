{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # extras
      ghostscript
      lazygit
      mermaid-cli
      ripgrep
      tectonic

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
  home.file.".config/nvim".source = ./nvim;
}
