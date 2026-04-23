{ config, lib, pkgs, ... }:

let
  cfg = config.modules.services.xdg;
in
{
  options.modules.services.xdg = {
    enable = lib.mkEnableOption "xdg";
  };

  config = lib.mkIf cfg.enable {
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-hyprland
          xdg-desktop-portal-gtk
        ];
        config.common.default = [
          "hyprland"
          "gtk"
        ];
      };
      desktopEntries.fish = {
        name = "fish";
        noDisplay = true;
      };
    };
  };
}