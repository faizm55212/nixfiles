{ config, pkgs, lib, ... }:
{
  programs.caelestia = {
    enable = true;
    settings = {
      bar.status = {
        showBattery = false;
        showLockStatus = false;
      };
      paths.wallpaperDir = "~/Pictures/Wallpapers/";
      launcher = {
        enable = true;
      };
      general.apps.terminal = ["kitty"];
      osd.enableBrightness = true;
      services.useFahrenheit = false;
    };
    cli = {
      enable = true;
    };
  };
}