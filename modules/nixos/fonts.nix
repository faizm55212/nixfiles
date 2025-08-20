# /etc/nixos/nvidia.nix
{ config, pkgs, lib, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
  ];
}
