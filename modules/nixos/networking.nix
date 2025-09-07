{ lib, ... }:
{
  networking = {
    hostName = "unknown";
    nameservers = [ "127.0.0.1" "::1" ];
    networkmanager = {
        enable = true;
        dns = "none";
    };
    useDHCP = lib.mkDefault true;
  };
}