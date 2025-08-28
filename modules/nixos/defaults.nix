{ ... }:
{
  imports = [
    ./boot.nix
    ./nvidia.nix
    ./fonts.nix
    ./pipewire.nix
    ./services.nix
  ];
}