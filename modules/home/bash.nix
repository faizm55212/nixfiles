{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
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
}