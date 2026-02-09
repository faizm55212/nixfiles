{pkgs, ...}: {
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
    eog
    gammastep
    grim
    go
    # guestfs-tools
    inotify-tools
    kubernetes
    kubernetes-helm
    # libguestfs
    libnotify
    pavucontrol
    # qemu_kvm
    steam
    swappy
    terraform
    terragrunt
    tree
    # virt-manager
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
