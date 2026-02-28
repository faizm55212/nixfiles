{
pkgs,
inputs,
...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  nix.settings = {
    auto-optimise-store = true;
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Set your time zone.
  time = {
    timeZone = "Asia/Kolkata";
    hardwareClockInLocalTime = true;
  };

  security.rtkit.enable = true;

  environment = {
    variables = {
      LD_LIBRARY_PATH = "/run/opengl-driver/lib:/run/opengl-driver-32/lib";
    };
    systemPackages = with pkgs; [
      btrfs-progs
      ddcutil
      file
      git
      jq
      lm_sensors
      nodejs 
      pavucontrol
      python3
      stdenv.cc
      unzip
      wget
    ];
  };

  fonts.packages = with pkgs; [
      nerd-fonts.mononoki
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    unknown = {
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [
        "audio"
        "docker"
        "i2c"
        "input"
        "libvirtd"
        "networkmanager"
        "video"
        "wheel"
      ];
      ignoreShellProgramCheck = true;
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    users = {
      "unknown" = {...}: {
        imports = [
          ../../modules/home/home.nix
          inputs.caelestia-shell.homeManagerModules.default
        ];
      };
    };
  };

  # Virtualization
  virtualisation = {
    libvirtd = {
      enable = true;
      extraConfig = ''
        unix_sock_group = "libvirtd"
        unix_sock_ro_perms = "0777"
        unix_sock_rw_perms = "0770"
      '';
    };
    docker = {
      enable = false;
      daemon.settings = {
        iptables = false;
      };
    };
  };

  system.stateVersion = "25.05";
}
