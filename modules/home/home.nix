{ pkgs, ... }:
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
    helm-ls
    inotify-tools
    kitty
    kubernetes
    kubernetes-helm
    libguestfs
    libnotify
    qemu_kvm
    ripgrep
    swappy
    terraform
    terragrunt
    tree
    virt-manager
    vscode
    wl-clipboard
    yaml-language-server
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };

  # Let Home Manager install and manage itself
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
