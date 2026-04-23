{ pkgs, inputs, ... }: {
  imports = [
    ../../modules/home/programs
    ../../modules/home/services
    inputs.caelestia-shell.homeManagerModules.default
  ];

  # Modules enable
  modules.programs.fish.enable = true;
  modules.programs.neovim.enable = true;
  modules.programs.bash.enable = true;
  modules.programs.caelestia.enable = true;
  modules.programs.mangohud.enable = true;
  modules.programs.foot.enable = true;
  modules.programs.git.enable = true;
  modules.programs.starship.enable = true;
  modules.programs.ssh.enable = true;
  modules.programs.zathura.enable = true;
  modules.programs.gtk.enable = true;
  modules.programs.hyprland.enable = true;

  modules.services.gammastep.enable = true;
  modules.services.xdg.enable = true;

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
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };

  # Let Home Manager install and manage itself
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
