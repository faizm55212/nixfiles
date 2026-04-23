---@diagnostic disable: missing-fields
local is_nix_on_droid = os.getenv("NIX_ON_DROID") == "1"

return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = not is_nix_on_droid and {
				"bashls",
				"gopls",
				"jsonls",
				"helm_ls",
				"lua_ls",
				"ruff",
				"rust_analyzer",
				"taplo",
				"terraformls",
				"yamlls",
			} or {},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvimtools/none-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local fmt = null_ls.builtins.formatting
			local dgn = null_ls.builtins.diagnostics

			require("mason-null-ls").setup({
				ensure_installed = not is_nix_on_droid and {
					"stylua",
					"alejandra",
					"rustfmt",
					"terraform_fmt",
				} or {},
			})

			null_ls.setup({
				sources = {
					fmt.alejandra,
					fmt.clang_format,
					fmt.stylua,
					-- fmt.rustfmt,
					fmt.terraform_fmt,
					fmt.terragrunt_fmt,

					-- diagnostics
					dgn.terraform_validate,
					dgn.kube_linter,
				},
			})
		end,
	},
}
