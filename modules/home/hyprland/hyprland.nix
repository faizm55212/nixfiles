{ pkgs, ... }:
let
  terminal = "kitty";
  fileManager = "dolphin";
  menu = "rofi -show drun";
  super = "SUPER";
  super_shift = "SUPER_SHIFT";
  eww = "$HOME/.config/eww/scripts";
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
      exec-once = import ./exec-once.nix{
        inherit eww;
      };
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
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        repeat_rate = 50;
        repeat_delay = 300;
        follow_mouse = 1;
        sensitivity = 0;
      };
      bind = import ./binds.nix {
        inherit terminal fileManager menu super super_shift;
      };
      bindm = [
        # Move/resize window with SUPER + LMB/RMB and dragging
        "${super}, mouse:272, movewindow"
        "${super}, mouse:273, resizewindow"
      ];
      windowrule = import ./windowrules.nix;
    };
  };
}