{
  enable = true;
  sources.formatting = {
    black.enable = true;
    alejandra.enable = true;
    shfmt.enable = true;
    terraform_fmt.enable = true;
    terragrunt_fmt.enable = true;
  };
  sources.diagnostics = {
    ansiblelint.enable = true;
    hadolint.enable = true;
    yamllint = {
      enable = true;
      settings = {disabled_filetypes = ["helm"];};
    };
  };
}
