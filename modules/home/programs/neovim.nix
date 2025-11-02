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
      nixd
      clang-tools

      # linter
      kube-linter

    ];
  };
  home.file.".config/nvim".source = ./nvim;
}
