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

        # Set analog output as default by raising its session priority
        (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/60-default-sink.conf" ''
          monitor.alsa.rules = [
            {
              matches = [
                { node.name = ~"alsa_output.*analog-stereo" }
              ]
              actions = {
                update-props = {
                  "node.priority.session" = 10000
                  "node.description" = "Default Analog Output"
                }
              }
            }
          ]
        '')
      ];
    };
  };
}
