{ pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
      configPackages = [
        (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/51-disable-hdmi-devices.conf" ''
          monitor.alsa.rules = [
            {
              matches = [
                { device.name = "alsa_card.pci-0000_01_00.1" }
                { device.name = "alsa_card.pci-0000_0d_00.1" }
              ]
              actions = {
                update-props = {
                  device.disabled = true
                }
              }
            }
          ]
        '')
        # bluetooth config
        (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/50-bluez.conf" ''
          monitor.bluez.properties = {
            bluez5.enable-sbc-xq = true
            bluez5.enable-msbc = true
            bluez5.enable-hw-volume = true
            bluez5.codecs = [ sbc sbc_xq aac ]
          }
        '')
      ];
    };
  };
}
