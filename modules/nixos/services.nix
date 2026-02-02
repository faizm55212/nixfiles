{ ... }:
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
          command = "hyprland > /dev/null";
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
    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" ];
    };
  };
}
