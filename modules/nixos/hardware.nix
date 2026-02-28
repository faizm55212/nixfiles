{ config, pkgs, ... }:
let
  maxTemp = pkgs.writeShellScript "max_temp" ''
    #!${pkgs.bash}/bin/bash
    [ "$(cat /sys/class/hwmon/hwmon3/temp1_input)" -gt "$(( $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null || echo 0) * 1000 ))" ] \
    && cat /sys/class/hwmon/hwmon3/temp1_input \
    || echo "$(( $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null || echo 0) * 1000 ))"
    '';
in
  {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
      };
    };
    i2c.enable = true;
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    new-lg4ff.enable = true;
    nvidia = {
      open = false;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
    nvidia-container-toolkit = {
      enable = true;
      package = pkgs.nvidia-container-toolkit;
    };
    rasdaemon.enable = true;
    xone.enable = true;
    fancontrol = {
      enable = true;
      config = ''
        # Top Exhaust (pwm4)
        # Back Exhaust (pwm1)
        # Front Intake (pwm3)
        INTERVAL=1
        DEVPATH=hwmon2=devices/platform/nct6775.656 hwmon3=devices/pci0000:00/0000:00:18.3
        DEVNAME=hwmon2=nct6799 hwmon3=k10temp
        FCTEMPS=hwmon2/pwm4=!${maxTemp} hwmon2/pwm3=!${maxTemp} hwmon2/pwm1=!${maxTemp}
        FCFANS=hwmon2/pwm4=hwmon2/fan4_input hwmon2/pwm3=hwmon2/fan3_input hwmon2/pwm1=hwmon2/fan1_input
        MINTEMP=hwmon2/pwm3=35 hwmon2/pwm4=35 hwmon2/pwm1=35
        MAXTEMP=hwmon2/pwm3=70 hwmon2/pwm4=85 hwmon2/pwm1=85
        MINSTART=hwmon2/pwm3=150 hwmon2/pwm4=150 hwmon2/pwm1=150
        MINSTOP=hwmon2/pwm3=102 hwmon2/pwm4=76 hwmon2/pwm1=76
        MINPWM=hwmon2/pwm3=102 hwmon2/pwm4=76 hwmon2/pwm1=76
        MAXPWM=hwmon2/pwm3=255 hwmon2/pwm4=255 hwmon2/pwm1=255
      '';
    };
  };
}
