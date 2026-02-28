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
    brave
    btop
    ffmpeg
    gammastep
    gearlever
    grim
    go
    gthumb
    inotify-tools
    libnotify
    mpv
    nemo
    p7zip
    rustdesk
    slurp
    tree
    vulkan-hdr-layer-kwin6
    wl-clipboard

    #DevOps
    kubernetes
    kubernetes-helm
    terraform
    terragrunt

    #Gaming
    oversteer
    protonup-qt
    steam-run
    (prismlauncher.override {
      jdks = [jdk21];
    })

    #Virtualization
    # guestfs-tools
    # libguestfs
    # qemu_kvm
    # virt-manager
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };

  # Let Home Manager install and manage itself
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
