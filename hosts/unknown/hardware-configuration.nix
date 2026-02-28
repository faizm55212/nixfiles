{
config,
lib,
modulesPath,
...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e2187794-70f2-4798-8ba5-6c28843d09fa";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "noatime" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/90F3-9B93";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/ae681c7e-c970-48dc-905c-16231f7d6c6c";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "noatime" ];
  };
  fileSystems."/Games" = {
    device = "/dev/disk/by-uuid/c5e53c76-d4a0-4859-ab50-617e1d6f99fa";
    fsType = "btrfs";
    options = [ "compress=zstd:1" "noatime" ];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
