{ config, ... }:

let
  inherit (config.lib.stylix.colors.withHashtag) base00;
in
{
  programs.kitty = {
    enable = true;
    settings = {
      # Font config
      font_family = "Mononoki Nerd Font Mono";
      bold_font = "Mononoki Nerd Font Mono Bold";
      italic_font = "Mononoki Nerd Font Mono Italic";
      bold_italic_font = "Mononoki Nerd Font Mono Bold Italic";
      font_size = 17;
      disable_ligatures = "never";

      # Padding and Margin
      window_padding_width = 5;
      tab_bar_margin_width = 5;

      # extra config
      enable_audio_bell = false;
      close_on_child_death = true;
      cursor_blink_interval = 0;
      confirm_os_window_close = 0;
      enabled_layouts = "fat, tall, vertical";
      notify_on_cmd_finish = "unfocused";
      scrollback_pager = "less --chop-long-lines --raw-control-chars +INPUT_LINE_NUMBER";
    };
  };
}