{ config, lib, pkgs, ... }:

let
  cfg = config.modules.programs.bash;
in
{
  options.modules.programs.bash = {
    enable = lib.mkEnableOption "bash";
  };

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ll = "ls -alF";
        vim = "nvim";
        v = "nvim";
        sv = "sudo -E nvim";
        update = "sudo nixos-rebuild switch --flake /home/unknown/nixfiles#unknown";
      };
      profileExtra = ''
        eval "$(starship init bash)"
      '';
    };
  };
}