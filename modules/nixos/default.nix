{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./networking.nix
    ./nvidia.nix
    ./pipewire.nix
    ./services.nix
  ];
}