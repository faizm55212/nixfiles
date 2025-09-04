{ pkgs, ... }:
let
  terminal = "kitty";
  fileManager = "dolphin";
  menu = "rofi -show drun";
  super = "SUPER";
  super_shift = "SUPER_SHIFT";
  # eww = "$HOME/.config/eww/scripts";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = false;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      exec-once = import ./exec-once.nix;
      animations = import ./animations-default.nix;
      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 0.9;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = true;
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      input = {
        follow_mouse = 1;
        kb_layout = "us";
        kb_options = "caps:escape";
        numlock_by_default = true;
        repeat_rate = 25;
        repeat_delay = 500;
        sensitivity = 0;
      };
      exec = [ "hyprctl dispatch submap global" ];
      # Define submap
      submap = "global";
      bind = import ./keybinds.nix {
        inherit
          terminal
          fileManager
          menu
          super
          super_shift
          ;
      };
      bindm = [
        "${super}, mouse:272, movewindow"
        "${super}, mouse:273, resizewindow"
      ];
      bindin = [
        "Super, mouse:272, global, caelestia:launcherInterrupt"
        "Super, mouse:273, global, caelestia:launcherInterrupt"
        "Super, mouse:274, global, caelestia:launcherInterrupt"
        "Super, mouse:275, global, caelestia:launcherInterrupt"
        "Super, mouse:276, global, caelestia:launcherInterrupt"
        "Super, mouse:277, global, caelestia:launcherInterrupt"
        "Super, mouse_up, global, caelestia:launcherInterrupt"
        "Super, mouse_down, global, caelestia:launcherInterrupt"
      ];
      windowrule = import ./windowrules.nix;
      env = [
        "NIXOS_OZONE_WL, 1"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "QS_ICON_THEME,hicolor"
        "QT_QPA_PLATFORMTHEME,gtk3"
      ];
    };
  };
}
