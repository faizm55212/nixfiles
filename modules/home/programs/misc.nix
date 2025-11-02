{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user = {
      name = "faizm55212";
      email = "faizm55212@gmail.com";
    };
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
    };
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/id_rsa_github";
        user = "git";
        identitiesOnly = true;
      };
    };
  };
}
