{ config, pkgs, ... }:

{
  hardware = {
    i2c.enable = true;
    enableAllFirmware = true;
    graphics.enable = true;
    nvidia = {
      open = false;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
    nvidia-container-toolkit = {
      enable = true;
      package = pkgs.nvidia-container-toolkit;
    };
  };
}
