{ pkgs, ... }:
{
  gtk = {
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
  programs = {
    foot = {
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
    git = {
      enable = true;
      lfs.enable = true;
      settings.user = {
        name = "faizm55212";
        email = "faizm55212@gmail.com";
      };
    };
    starship = {
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
    ssh = {
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
    zathura = {
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
