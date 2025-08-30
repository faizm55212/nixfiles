{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [ 
      "quiet"
      "splash"
      "nowatchdog"
      "udev.log_level=3"
    ];
    consoleLogLevel = 0;
    initrd.verbose = true;
    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        devices = [ "nodev" ];
        splashImage = ./splash_image.jpg;
      };
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = [ pkgs.mac-style-plymouth ];
    };
  };
}