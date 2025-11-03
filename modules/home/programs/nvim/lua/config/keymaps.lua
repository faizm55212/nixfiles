vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- QOL --
map("v", "<", ":m '>+1<cr>gv=gv", {
	silent = true,
	noremap = true,
	desc = "move lines down in visual mode",
})
map("v", ">", ":m '<-2<cr>gv=gv", {
	silent = true,
	noremap = true,
	desc = "move lines down in visual mode",
})
map("n", "Q", "<nop>", {
	silent = true,
	noremap = true,
	desc = "disable Q command line",
})
map("n", "x", '"_x', {
	silent = true,
	noremap = true,
	desc = "prevent deleted chars from copying to clipboard",
})

-- Neo tree
map("n", "<C-e>", "<cmd>Neotree filesystem reveal left<cr>", {
	silent = true,
	noremap = true,
	desc = "Open Neo Tree",
})
map("n", "<Tab>", "<cmd>bnext<cr>", {
	silent = true,
	noremap = true,
	desc = "GoTo Next Tab",
})
map("n", "<S-Tab>", "<cmd>bprevious<cr>", {
	silent = true,
	noremap = true,
	desc = "GoTo Previous Tab",
})
