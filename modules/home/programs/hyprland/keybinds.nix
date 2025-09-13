{ super, super_shift, terminal, fileManager, menu }:
[
  "${super}, SPACE, exec, caelestia shell drawers toggle launcher"

  "${super}, X, exec, ${terminal}"
  "${super}, Q, killactive"
  "CTRL_ALT, Q, exec, sh -c \"hyprctl dispatch exit && rm -rf /run/user/1000/hypr \""
  "${super}, E, exec, ${fileManager}"
  "${super}, V, togglefloating"
  "${super}, F, fullscreen"
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

  # Volume and media controls
  ",XF86AudioRaiseVolume,exec,bash -c '(( $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk \"{print int(\\$2)}\") >= 1 )) && : || wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+'"
  ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"
  ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  ",XF86AudioPlay, exec, playerctl play-pause"
  ",XF86AudioPause, exec, playerctl play-pause"
  ",XF86AudioNext, exec, playerctl next"
  ",XF86AudioPrev, exec, playerctl previous"
]