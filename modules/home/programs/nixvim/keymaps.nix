[
  {
    action = ":normal! \<Esc><CR>";
    key = "<CapsLock>";
    options = {
      silent = true;
      noremap = true;
      desc = "Remap Caps Lock to Escape";
    };
  }
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
]
