{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
      vim = "nvim";
      sudo-vim = "sudo -E nvim";
      update = "sudo nixos-rebuild switch --flake /home/unknown/nixfiles#unknown";
    };
    profileExtra = ''
      eval "$(starship init bash)"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "faizm55212";
    userEmail = "faizm55212@gmail.com";
  };
}
