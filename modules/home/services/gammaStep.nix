{ config, lib, pkgs, ... }:

let
  cfg = config.modules.services.gammastep;
in
{
  options.modules.services.gammastep = {
    enable = lib.mkEnableOption "gammastep";
  };

  config = lib.mkIf cfg.enable {
    services.gammastep = {
      enable = true;
      package = pkgs.gammastep;
      temperature = {
        day = 5000;
        night = 5000;
      };
      provider = "manual";
      latitude = null;
      longitude = null;
      dawnTime = "00:00";
      duskTime = "23:59";
      tray = true;
      enableVerboseLogging = false;
    };
  };
}
