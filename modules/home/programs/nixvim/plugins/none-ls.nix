{
  enable = true;
  sources.formatting = {
    black.enable = true;
    nixpkgs_fmt.enable = true;
    shfmt.enable = true;
    terraform_fmt.enable = true;
  };
  sources.diagnostics = {
    ansiblelint.enable = true;
    hadolint.enable = true;
    yamllint = {
      enable = true;
      settings = {
        disabled_filetypes = ["helm"];
      };
    };
  };
}
