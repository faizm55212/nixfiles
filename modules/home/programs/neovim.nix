{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.programs.neovim;
in {
  options.modules.programs.neovim = {
    enable = lib.mkEnableOption "neovim";
    isNixOnDroid = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether we are on Nix-on-Droid";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      extraPackages = with pkgs;
        [
          # 1. BASE TOOLS: Lightweight and needed everywhere
          lazygit
          ripgrep
          nil
          kube-linter
        ]
        ++ lib.optionals (!cfg.isNixOnDroid) [
          # 2. DESKTOP ONLY: Heavy tools skipped on Nix-on-Droid
          bash-language-server
          clang-tools
          gopls
          ghostscript
          mermaid-cli
          rustfmt
          taplo
          tectonic
          vscode-langservers-extracted # for jsonls
        ]
        ++ lib.optionals cfg.isNixOnDroid [
          # 3. DROID ONLY: Workarounds for when Mason doesn't work well
          ruff
          lua-language-server
          alejandra
          stylua
        ];
    };

    home.sessionVariables = lib.mkIf cfg.isNixOnDroid {
      NIX_ON_DROID = "1";
    };

    home.file.".config/nvim".source = ./nvim;
  };
}
