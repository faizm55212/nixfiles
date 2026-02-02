{
  programs.caelestia = {
    enable = true;
    settings = {
      bar = {
        status = {
          showBattery = false;
          showLockStatus = false;
        };
      };
      launcher = {
        enable = true;
        hiddenApps = [
          "btop"
          "gammastep-indicator"
          "foot"
          "footclient"
          "foot-server"
          "nvim"
        ];
      };
      general = {
        apps.terminal = ["foot"];
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
      paths.wallpaperDir = "~/Pictures/Wallpapers/";
      services = {
        useFahrenheit = false;
        weatherLocation = "12.9629,77.5775";
      };
    };
    cli = {
      enable = true;
    };
  };
}
