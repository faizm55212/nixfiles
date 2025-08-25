{ config, pkgs, lib, ... }:
let
  patchPapirus = pkgs.stdenv.mkDerivation {
    name = "${pkgs.papirus-icon-theme.name}-patch";
    src = pkgs.papirus-icon-theme;
    installPhase = ''
      mkdir -p $out/share/icons
      # Quickshell only find icons in share/icons/hicolor
      cp -r $src/share/icons/Papirus $out/share/icons/hicolor
    '';
  };
in
{
  programs.caelestia = {
    enable = true;
    settings = {
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/Pictures/Wallpapers/";
      launcher = {
        enable = true;
      };
    };
    cli = {
      enable = true;
    };
  };
}