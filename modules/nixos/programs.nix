{ pkgs,... }:
{
  programs = {
    appimage = {
      enable =  true;
      binfmt = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    firefox.enable = true;
    nix-ld.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
