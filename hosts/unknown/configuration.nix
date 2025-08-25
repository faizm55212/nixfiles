# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos/defaults.nix
    ];

  nix.settings = {
    auto-optimise-store = true;
    warn-dirty = false;
    experimental-features = [ "nix-command" "flakes" ];
  };

  networking.hostName = "unknown"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time = {
    timeZone = "Asia/Kolkata";
    hardwareClockInLocalTime = true;
  };
  
  # Enabled Nvidia Drivers for my Desktop
  services = {
    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" ];
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --remember --remember-session --time --cmd hyprland";
          user = "greeter";
        };
      };
    };
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    firefox.enable = true;
  };

  # Enable sound.
  #services.pulseaudio.enable = true;
  security.rtkit.enable = true;
  # security.polkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    unknown = {
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "input"
        "networkmanager"
        "libvirtd"
      ];
      ignoreShellProgramCheck = true;
    };
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "unknown" = { ... }: {
        imports = [ 
          ../../modules/home/home.nix
          inputs.caelestia-shell.homeManagerModules.default
        ];
      };
    };
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    cargo
    git
    jq
    libvirt
    nodejs
    python3
    pkgs.stdenv.cc
    rustc
    unzip
    wget
  ];

  # Virtualization via libvirt
  virtualisation.libvirtd = {
    enable = true;
    extraConfig = ''
      unix_sock_group = "libvirtd"
      unix_sock_ro_perms = "0777"
      unix_sock_rw_perms = "0770"
    '';
  };

  # Allow Unfree
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
