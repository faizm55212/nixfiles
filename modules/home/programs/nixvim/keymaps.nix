[
  # NeoTree start
  {
    action = ":Neotree filesystem reveal left<CR>";
    key = "<C-e>";
    options = {
      silent = true;
      noremap = true;
      desc = "Open Neo Tree";
    };
  }
  {
    action = ":bnext<CR>";
    key = "<Tab>";
    options = {
      silent = true;
      noremap = true;
      desc = "GoTo Next Tab";
    };
  }
  {
    action = ":bprevious<CR>";
    key = "<S-Tab>";
    options = {
      silent = true;
      noremap = true;
      desc = "GoTo Next Tab";
    };
  }
  # NeoTree End

  # Telescope Start
  {
    action = ":Telescope live_grep<CR>";
    key = "<leader>ts";
    options = {
      silent = true;
      noremap = true;
      desc = "Search grep";
    };
  }
  {
    action = ":Telescope quickfix<CR>";
    key = "<leader>tq";
    options = {
      silent = true;
      noremap = true;
      desc = "Quickfix list";
    };
  }
  {
    action = ":Telescope undo<CR>";
    key = "<leader>tu";
    options = {
      silent = true;
      noremap = true;
      desc = "Undo tree";
    };
  }
  # Telescope End

  # Terminal split start
  {
    action = ":lua vim.cmd('belowright 10split') vim.cmd('terminal') vim.cmd('startinsert')<CR>";
    key = "<C-`>";
    options = {
      silent = true;
      noremap = true;
      desc = "Open terminal below";
    };
  }
  {
    action = "exit<CR>";
    key = "<C-`>";
    mode = [ "t" ];
    options = {
      silent = true;
      noremap = true;
      desc = "Close Terminal";
    };
  }
  # Terminal Split End

  # LazyGit start
  {
    action = ":LazyGit<CR>";
    key = "<leader>lg";
    options = {
      silent = true;
      noremap = true;
      desc = "LazyGit float";
    };
  }
  # LazyGit End
]
