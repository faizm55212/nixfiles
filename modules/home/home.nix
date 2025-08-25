{ config, pkgs, inputs, ... }:
let
  caelestia-shell = inputs.caelestia-shell.packages."x86_64-linux".default.override {
    withCli = true;
  };
in
{
  imports = [
    # ./eww.nix
    ./caelestia.nix
    ./hyprland/hyprland.nix
    ./bash.nix
    ./kitty.nix
    ./fish.nix
    ./programs.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "unknown";
  home.homeDirectory = "/home/unknown";

  # Allow Unfree
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    caelestia-shell
    guestfs-tools
    kitty
    libguestfs
    libnotify
    neovim
    openssl
    pavucontrol
    qemu_kvm
    starship
    tree
    virt-manager
    vscode
    wl-clipboard
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };

  # Let Home Manager install and manage itself
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}