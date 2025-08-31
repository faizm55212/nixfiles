{ pkgs, ... }:
{
  boot = {
    consoleLogLevel = 0;
    extraModulePackages = [ ];
    initrd = {
      verbose = false;
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    };
    kernelModules = [ "kvm-amd" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" "i2c-dev" ];
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [ 
      "splash"
      "quiet"
      "udev.log_priority=0"
      "nvidia_drm.modeset=1"
    ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        devices = [ "nodev" ];
        efiSupport = true;
        enable = true;
        font = "${pkgs.dejavu_fonts}/share/fonts/truetype/DejaVuSansMono.ttf";
        fontSize = 22;
        gfxmodeEfi = "2560x1440";
        gfxpayloadEfi = "keep";
        splashImage = ./splash_image.jpg;
        useOSProber = true;
      };
    };
    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = [ pkgs.mac-style-plymouth ];
      extraConfig = "DeviceScale = 1";
    };
  };
}
