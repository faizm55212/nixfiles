{ ... }:
{
  imports = [
    ./boot.nix
    ./networking.nix
    ./hardware.nix
    ./pipewire.nix
    ./programs.nix
    ./services.nix
  ];
}
