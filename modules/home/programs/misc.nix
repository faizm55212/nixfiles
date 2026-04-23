{ config, lib, pkgs, ... }:

let
  cfg = config.modules.programs;
in
{
  options.modules.programs = {
    foot.enable = lib.mkEnableOption "foot";
    git.enable = lib.mkEnableOption "git";
    starship.enable = lib.mkEnableOption "starship";
    ssh.enable = lib.mkEnableOption "ssh";
    zathura.enable = lib.mkEnableOption "zathura";
    gtk.enable = lib.mkEnableOption "gtk";
  };

  config = {
    gtk = lib.mkIf cfg.gtk.enable {
      enable = true;
      theme = {
        name = "Materia-dark";
        package = pkgs.materia-theme;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };

    programs.foot = lib.mkIf cfg.foot.enable {
      enable = true;
      settings = {
        main = {
          font = "Mononoki Nerd Font Mono:size=17"; 
          pad = "5x5 center";
        };
        mouse = {
          hide-when-typing = "yes";
        };
      };
    };

    programs.git = lib.mkIf cfg.git.enable {
      enable = true;
      lfs.enable = true;
      settings.user = {
        name = "faizm55212";
        email = "faizm55212@gmail.com";
      };
    };

    programs.starship = lib.mkIf cfg.starship.enable {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[✗](bold red)";
        };
      };
    };

    programs.ssh = lib.mkIf cfg.ssh.enable {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "github.com" = {
          identityFile = "~/.ssh/id_rsa_github";
          user = "git";
          identitiesOnly = true;
        };
      };
    };

    programs.zathura = lib.mkIf cfg.zathura.enable {
      enable = true;
      options = {
        default-bg = "rgba(0,0,0,0.7)";
        recolor-lightcolor = "rgba(0, 0, 0, 0)";
        recolor-darkcolor = "#F2E5BC";
        recolor = true;
        adjust-open = "best";
        guioptions = "none";
      };

      mappings = {
        "i" = "recolor";
        "j" = "feedkeys <C-Down>";
        "k" = "feedkeys <C-Up>";
      };
    };
  };
}
