{ config, pkgs, ... }:

{
  imports = [
    ./eww.nix
    ./hyprland/hyprland.nix
    ./bash.nix
    ./kitty.nix
    ./programs.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "unknown";
  home.homeDirectory = "/home/unknown";

  # Allow Unfree
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    dunst
    eww
    kitty
    libnotify
    neovim
    rofi-wayland
    starship
    tree
    vscode
    wl-clipboard
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # Let Home Manager install and manage itself
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}