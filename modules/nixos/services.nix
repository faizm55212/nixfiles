{ config, pkgs, lib, ... }:
{ 
  services = {
    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" ];
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "hyprland >/dev/null";
          user = "unknown";
        };
      };
    };
  };
}
