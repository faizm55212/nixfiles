{ inputs, pkgs, ... }: {
  imports = [
    ../../modules/home/programs
    # services might not all work on nix-on-droid, we'll see
    inputs.caelestia-shell.homeManagerModules.default
  ];

  home.username = "nix-on-droid";
  home.homeDirectory = "/data/data/com.termux.nix/files/home";

  # Modules enable
  modules.programs.fish.enable = true;
  modules.programs.neovim.enable = true;
  modules.programs.neovim.isNixOnDroid = true;
  modules.programs.git.enable = true;
  modules.programs.starship.enable = true;
  modules.programs.bash.enable = true;

  home.packages = with pkgs; [
    tree
    zip
    unzip
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Read the changelog before changing this value
  home.stateVersion = "26.05";
}
