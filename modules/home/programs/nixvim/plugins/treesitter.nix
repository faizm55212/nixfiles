{
  enable = true;
  lazyLoad.enable = true;
  lazyLoad.settings.event = "BufRead";
  settings = {
    ensureInstalled = [
      "bash"
      "dockerfile"
      "gotmpl"
      "helm"
      "hcl"
      "nix"
      "python"
      "qml"
      "terraform"
      # "yaml"
    ];
    indent.enable = true;
    highlight.enable = true;
  };
}
