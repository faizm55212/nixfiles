{ config, pkgs, inputs, ... }:
{
  imports = [
    ./programs
    ./services
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "unknown";
  home.homeDirectory = "/home/unknown";

  home.packages = with pkgs; [
    btop
    gammastep
    grim
    guestfs-tools
    kitty
    kubernetes
    kubernetes-helm
    libguestfs
    libnotify
    ripgrep
    qemu_kvm
    starship
    swappy
    terraform
    terragrunt
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
