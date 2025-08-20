# /etc/nixos/nvidia.nix
{ config, pkgs, lib, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
	useOSProber = true;
	efiSupport = true;
	devices = [ "nodev" ];
      };
    };
  };
}
