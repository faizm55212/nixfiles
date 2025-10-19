return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local servers = {
				"bashls",
        "gopls",
				"helm_ls",
				"lua_ls",
				"nixd",
				"pyright",
				"terraformls",
				"yamlls",
			}
			for _, server in ipairs(servers) do
				vim.lsp.enable(server, { capabilities = capabilities })
			end
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
		end,
	},
}
