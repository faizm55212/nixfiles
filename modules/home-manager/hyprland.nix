{ nixosConfig, pkgs, lib, ... }:
let
  terminal = "kitty";
  fileManager = "dolphin";
  menu = "wofi --show drun";
  super = "SUPER";
  super_shift = "SUPER_SHIFT";
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

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
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
        repeat_rate = 50;
        repeat_delay = 400;
        follow_mouse = 1;
        sensitivity = 0;
      };

      bind = [
        "${super}, X, exec, ${terminal}"
        "${super_shift}, Q, killactive"
        "CTRL_ALT, Q, exit"
        "${super}, E, exec, ${fileManager}"
        "${super}, V, togglefloating"
        "${super}, D, exec, ${menu}"
        "${super}, P, pseudo"
        "${super}, J, togglesplit"

        # Move focus with SUPER + arrow key
        "${super}, left, movefocus, l"
        "${super}, right, movefocus, r"
        "${super}, up, movefocus, u"
        "${super}, down, movefocus, d"

        # Switch workspace with SUPER + [0-9]
        "${super}, 1, workspace, 1"
        "${super}, 2, workspace, 2"
        "${super}, 3, workspace, 3"
        "${super}, 4, workspace, 4"
        "${super}, 5, workspace, 5"
        "${super}, 6, workspace, 6"
        "${super}, 7, workspace, 7"
        "${super}, 8, workspace, 8"
        "${super}, 9, workspace, 9"
        "${super}, 0, workspace, 10"

        # Move active window to a workspace with SUPER + SHIFT + [0-9]
        "${super_shift}, 1, movetoworkspace, 1"
        "${super_shift}, 2, movetoworkspace, 2"
        "${super_shift}, 3, movetoworkspace, 3"
        "${super_shift}, 4, movetoworkspace, 4"
        "${super_shift}, 5, movetoworkspace, 5"
        "${super_shift}, 6, movetoworkspace, 6"
        "${super_shift}, 7, movetoworkspace, 7"
        "${super_shift}, 8, movetoworkspace, 8"
        "${super_shift}, 9, movetoworkspace, 9"
        "${super_shift}, 10, movetoworkspace, 10"

        # Special workspace (scratchpad)
        "${super}, S, togglespecialworkspace, magic"
        "${super_shift}, S, movetoworkspace, Special:magic"

        # Scroll through existing workspaces with SUPER + Scroll
        "${super}, mouse_down, workspace, e+1"
        "${super}, mouse_up, workspace, e-1"
      ];

      bindm = [
        # Move/resize window with SUPER + LMB/RMB and dragging
        "${super}, mouse:272, movewindow"
        "${super}, mouse:273, resizewindow"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
