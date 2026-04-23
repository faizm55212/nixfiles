{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  build.activation = {
    zz_unfuck_proot = ''
      echo "overwriting proot-static.new with old (and working) proot executable"
      cp -v /data/data/com.termux.nix/files/home/nixfiles/hosts/nix-on-droid/proot-static /data/data/com.termux.nix/files/usr/bin/.proot-static.new
    '';
    setup_sshd = ''
      # Create SSH directory if it doesn't exist
      mkdir -p ~/.ssh

      # Check for host key and generate if missing
      if [ ! -f ~/.ssh/ssh_host_ed25519_key ]; then
        echo "Generating new SSH host key..."
        ${pkgs.openssh}/bin/ssh-keygen -t ed25519 -f ~/.ssh/ssh_host_ed25519_key -N ""
      fi

      # Check for config and generate if missing
      if [ ! -f ~/.ssh/sshd_config ]; then
        echo "Generating sshd_config..."
        echo "HostKey $HOME/.ssh/ssh_host_ed25519_key" > ~/.ssh/sshd_config
        echo "Port 8022" >> ~/.ssh/sshd_config
        echo "StrictModes no" >> ~/.ssh/sshd_config
        echo "PasswordAuthentication no" >> ~/.ssh/sshd_config
      fi
    '';
  };
  # Simply install just the packages
  environment.packages = with pkgs; [
    coreutils
    curl
    findutils
    gcc
    gemini-cli
    gnumake
    gnutar
    gawk
    gzip
    hostname
    luarocks
    ncurses
    openssh
    procps
    python3
    (pkgs.writeShellScriptBin "start-sshd" ''
      echo "Starting SSH daemon on port 8022..."
      ${pkgs.openssh}/bin/sshd -f ~/.ssh/sshd_config
    '')
    wget
    which
  ];

  user.shell = "${pkgs.fish}/bin/fish";

  terminal.font = "${pkgs.nerd-fonts.mononoki}/share/fonts/truetype/NerdFonts/Mononoki/MononokiNerdFontMono-Regular.ttf";

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    config = ./home.nix;
    # backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";
  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  #time.timeZone = "Asia/Kolkata";
}
