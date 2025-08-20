# /etc/nixos/nvidia.nix
{ config, pkgs, lib, ... }:

{
  boot.kernelModules = [ "kvm-amd" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  hardware = {
    enableAllFirmware = true;
    graphics.enable = true;
    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
#      package = config.boot.kernelPackages.nvidiaPackages.production;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "580.76.05";
        sha256_64bit = "sha256-IZvmNrYJMbAhsujB4O/4hzY8cx+KlAyqh7zAVNBdl/0=";
        sha256_aarch64 = "sha256-NL2DswzVWQQMVM092NmfImqKbTk9VRgLL8xf4QEvGAQ=";
        openSha256 = "sha256-xEPJ9nskN1kISnSbfBigVaO6Mw03wyHebqQOQmUg/eQ=";
        settingsSha256 = "sha256-ll7HD7dVPHKUyp5+zvLeNqAb6hCpxfwuSyi+SAXapoQ=";
        persistencedSha256 = "sha256-bs3bUi8LgBu05uTzpn2ugcNYgR5rzWEPaTlgm0TIpHY=";
      };
    };
 };
}
