{
  enable = true;
  servers = {
    bashls.enable = true;
    helm_ls.enable = true;
    nil_ls.enable = true;
    pyright.enable = true;
    qmlls.enable = true;
    terraformls.enable = true;
    yamlls = {
      enable = true;
      settings = {
        yaml = {
          schemas = {
            "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
            "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
            "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
            "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
            "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
            "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
            "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
            "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" =
              "*flow*.{yml,yaml}";
          };
        };
      };
    };
  };
}
