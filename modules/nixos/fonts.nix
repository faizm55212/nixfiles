# /etc/nixos/nvidia.nix
{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
  ];
}