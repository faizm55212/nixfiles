{
  enable = true;
  servers = {
    ansiblels.enable = true;
    bashls.enable = true;
    dockerls.enable = true;
    helm_ls.enable = true;
    nil_ls.enable = true;
    pyright.enable = true;
    qmlls.enable = true;
    terraformls.enable = true;
    yamlls = {
      enable = true;
      extraOptions = {
        settings = {
          yaml = {
            schemas = {
              "https://json.schemastore.org/github-workflow.json" = "/.github/workflows/*";
              "https://json.schemastore.org/kustomization.json" = "kustomization.yaml";
              "https://json.schemastore.org/chart.json" = "Chart.yaml";
            };
            format = {
              enable = true;
            };
            validate = true;
          };
        };
      };
    };
  };
}
