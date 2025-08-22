{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    configDir = ./eww-config;
  };
  
  # systemd.user.services.eww-daemon = {
  #   Unit = {
  #     Description = "Eww Daemon";
  #     After = [ "hyprland-session.target" ];
  #   };
  #   Service = {
  #     ExecStart = "${pkgs.eww}/bin/eww daemon";
  #     Restart = "on-failure";
  #     # Use a directory that your user can write to.
  #     StateDirectory = "eww"; 
  #   };
  #   Install = {
  #     WantedBy = [ "hyprland-session.target" ];
  #   };
  # };
}