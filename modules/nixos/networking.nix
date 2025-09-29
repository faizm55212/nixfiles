{ lib, ... }:
{
  networking = {
    hostName = "unknown";
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
    networkmanager = {
      enable = true;
      dns = "none";
    };
    firewall = {
      enable = true;
      allowPing = false;
      extraCommands = ''
      iptables -t nat -A POSTROUTING -s 172.17.0.0/16 ! -o docker0 -j MASQUERADE
      '';
    };
    useDHCP = lib.mkDefault true;
  };
}
