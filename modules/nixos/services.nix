{ pkgs, ... }:
{
  services = {
    dnscrypt-proxy = {
      enable = true;
      settings = {
        server_names = [ "cloudflare" ];
        ipv6_servers = false;
        require_dnssec = true;
        dnscrypt_servers = false;
      };
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "start-hyprland > /dev/null";
          user = "unknown";
        };
      };
    };
    openssh = {
      enable = false;
      startWhenNeeded = true;
      settings = {
        PasswordAuthentication = false;
      };
    };
    udev = {
      packages = with pkgs; [ oversteer ];
      extraRules = ''
        ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c24f", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 046d -p c24f -m 01 -r 01 -C 03 -M '0f00010142'"
'';
    };
    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" ];
    };
  };
}
