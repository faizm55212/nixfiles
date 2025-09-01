{ ... }:

{
  programs.nixvim = {
    enable = true;
    autoCmd = [
      {
        event = "FileType";
        pattern = [
          "markdown"
        ];
        command = "setlocal spell spelllang=en";
      }
    ];
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy .enable = true;
    };
    colorschemes.gruvbox-material-nvim = {
      enable = true;
      settings = {
        contrast = "hard";
        background = {
          transparent = true;
        };
      };
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      {
        action = ":Telescope live_grep<CR>";
        key = "<leader>sg";
        options = {
          silent = true;
          noremap = true;
          desc = "Search grep";
        };
      }
      # Telescope search buffers
      {
        action = ":Telescope buffers<CR>";
        key = "<leader>sb";
        options = {
          silent = true;
          noremap = true;
          desc = "Search buffers";
        };
      }
      # Telescope search commands
      {
        action = ":Telescope command_history<CR>";
        key = "<leader>sc";
        options = {
          silent = true;
          noremap = true;
          desc = "Search commands";
        };
      }
      # Telescope search files
      {
        action = ":Telescope find_files<CR>";
        key = "<leader>sf";
        options = {
          silent = true;
          noremap = true;
          desc = "Search files";
        };
      }
      # Telescope search commands
      {
        action = ":Telescope commands<CR>";
        key = "<leader>sc";
        options = {
          silent = true;
          noremap = true;
          desc = "Search commands";
        };
      }
      # Telescope quickfixlist
      {
        action = ":Telescope quickfix<CR>";
        key = "<leader>ql";
        options = {
          silent = true;
          noremap = true;
          desc = "Quickfix list";
        };
      }
      # Telescope undo tree
      {
        action = ":Telescope undo<CR>";
        key = "<leader>u";
        options = {
          silent = true;
          noremap = true;
          desc = "Undo tree";
        };
      }
    ];
    opts = {
      relativenumber = true;
      number = true;
      mouse = "a";
      mousemodel = "extend";
      swapfile = false;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;

    };
    plugins = {
      lualine.enable = true;
      lazygit = {
        enable = true;
       };
      lsp = {
        enable = true;
        servers = {
          terraformls.enable = true;
          dockerls.enable = true;
          yamlls.enable = true;
          helm_ls.enable = true;
          nil_ls.enable = true;
          qmlls.enable = true;
        };
      };
      none-ls = {
        enable = true;
        sources.formatting = {
          terraform_fmt.enable = true;
          nixpkgs_fmt.enable = true;
        };
        sources.diagnostics = {
          hadolint.enable = true;
          yamllint.enable = true;
        };
      };
      telescope = {
        enable = true;
        settings.defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
            "^data/"
          ];
          set_env.COLORTERM = "truecolor";
        };
      };
      treesitter = {
        enable = true;
        settings = {
          ensureInstalled = [
            "terraform"
            "hcl"
            "dockerfile"
            "yaml"
            "nix"
            "qml"
          ];
          indent.enable = true;
          highlight.enable = true;
        };
      };
      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
      };
      noice = {
        enable = true;
        settings = {
          enable = true;
          notify = {
            enabled = true;
          };
          messages = {
            enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
          };
          lsp = {
            message = {
              enabled = true;
            };
            progress = {
              enabled = true;
              view = "mini";
            };
          };
          popupmenu = {
            enabled = true;
            backend = "nui";
          };
          format = {
            filter = {
              pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
              icon = "";
              lang = "regex";
            };
            replace = {
              pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
              icon = "󱞪";
              lang = "regex";
            };
          };
        };
      };
      rainbow-delimiters.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
      lz-n.enable = true;
    };
    nixpkgs.useGlobalPackages = true;
  };
}
