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

  networking.hostName = "unknown";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time = {
    timeZone = "Asia/Kolkata";
    hardwareClockInLocalTime = true;
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    firefox.enable = true;
  };

  security.rtkit.enable = true;

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
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    users = {
      "unknown" = { ... }: {
        imports = [ 
          ../../modules/home/home.nix
          inputs.caelestia-shell.homeManagerModules.default
          inputs.nixvim.homeModules.nixvim
        ];
      };
    };
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    cargo
    ddcutil
    git
    jq
    libvirt
    nodejs
    ntfs3g
    python3
    stdenv.cc
    rustc
    unzip
    wget
  ];

  # Virtualization via libvirt
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
      enable = true;
      package = pkgs.docker;
    };
  };

  system.stateVersion = "25.05";
}
