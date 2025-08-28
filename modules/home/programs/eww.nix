{ config, pkgs, ... }:

{
  programs.eww = {
    enable = false;
    configDir = ../eww-config;
  };
}