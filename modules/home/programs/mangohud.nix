{ ... }:
{
  programs.mangohud = {
    enable = true;

    settings = {
      # position
      position = "top-left";

      # layout
      horizontal = false;
      font_size = 22;
      background_alpha = 0.3;
      round_corners = 10;

      # FPS
      fps = true;
      fps_limit = 0;
      fps_color_change = true;
      frame_timing = false;
      histogram = false;


      # GPU
      gpu_stats = true;
      gpu_temp = true;
      gpu_load_change = true;
      gpu_list = 0;

      # CPU
      cpu_stats = true;
      cpu_temp = true;
      cpu_load_change = true;

      # clean look
      vram = false;
      ram = false;
      engine_version = false;
      vulkan_driver = false;
      wine = false;
      battery = false;
    };
  };
}
