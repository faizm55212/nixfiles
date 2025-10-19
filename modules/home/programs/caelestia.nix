{
  programs.caelestia = {
    enable = true;
    settings = {
      bar.status = {
        showBattery = false;
        showLockStatus = false;
      };
      paths.wallpaperDir = "~/Pictures/Wallpapers/";
      launcher = {
        enable = true;
      };
      general = {
        apps.terminal = ["kitty"];
        idle.timeouts = [
          {
            "timeout" = 300;
            "idleAction" = "lock";
          }
          {
            "timeout" = 600;
            "idleAction" = "dpms off";
            "returnAction" = "dpms on";
          }
          {
            "timeout" = 900;
            "idleAction" = ["systemctl" "suspend-then-hibernate"];
          }
        ];
      };
      osd.enableBrightness = true;
      services.useFahrenheit = false;
    };
    cli = {
      enable = true;
    };
  };
}
