return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"gotmpl",
					"helm",
					"hcl",
					"lua",
					"nix",
					"python",
					"qmljs",
					"terraform",
					"yaml",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
}
