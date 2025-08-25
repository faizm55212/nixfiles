{ config, lib, pkgs, ... }:
{
  qt = {
    enable = false;
    platformTheme.name = "qt5ct";
  };
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "Fusion";
  };
  catppuccin = {
    accent = "peach";
    flavor = "mocha";
    kvantum = {
      enable = false;
      flavor = "mocha";
      apply = true;
    };
    fzf.enable = false;
    cursors.enable = true;
  };
  gtk = {
    enable = false;
    iconTheme = {
      name = "Papirus-Dark";
      package = (
        pkgs.papirus-icon-theme.override {
          color = "mocha";
        }
      );
    };
  };
}