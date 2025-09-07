{ ... }:
{
  services = {
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        server_names = [ "cloudflare" "cloudflare-ipv6" ];
        ipv6_servers = true;
        require_dnssec = true;
        dnscrypt_servers = false;
      };
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "hyprland >/dev/null";
          user = "unknown";
        };
      };
    };
    openssh = {
      enable = true;
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
