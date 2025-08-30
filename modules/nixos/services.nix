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
          command = "${pkgs.tuigreet}/bin/tuigreet --remember --remember-session --time --cmd 'hyprland >/dev/null'";
          user = "greeter";
        };
      };
      useTextGreeter = true;
    };
  };
}