return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr, silent = true }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP: Hover" }))
				vim.keymap.set(
					"n",
					"gd",
					vim.lsp.buf.definition,
					vim.tbl_extend("force", opts, { desc = "LSP: Go to definition" })
				)
				vim.keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "LSP: Go to declaration" })
				)
				vim.keymap.set(
					"n",
					"gi",
					vim.lsp.buf.implementation,
					vim.tbl_extend("force", opts, { desc = "LSP: Go to implementation" })
				)
				vim.keymap.set(
					"n",
					"gr",
					vim.lsp.buf.references,
					vim.tbl_extend("force", opts, { desc = "LSP: References" })
				)
				vim.keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					vim.tbl_extend("force", opts, { desc = "LSP: Rename symbol" })
				)
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					vim.tbl_extend("force", opts, { desc = "LSP: Code action" })
				)
				vim.keymap.set(
					"n",
					"[d",
					vim.diagnostic.goto_prev,
					vim.tbl_extend("force", opts, { desc = "LSP: Previous diagnostic" })
				)
				vim.keymap.set(
					"n",
					"]d",
					vim.diagnostic.goto_next,
					vim.tbl_extend("force", opts, { desc = "LSP: Next diagnostic" })
				)
				vim.keymap.set(
					"n",
					"<leader>ld",
					vim.diagnostic.open_float,
					vim.tbl_extend("force", opts, { desc = "LSP: Line diagnostics" })
				)
			end

			vim.lsp.config("clangd", {
				cmd = { "/run/current-system/sw/bin/clangd" },
				capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.lsp.config("lua_ls", {
				cmd = { "/run/current-system/sw/bin/lua-lsp" },
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("nil_ls", {
				cmd = { "/run/current-system/sw/bin/nil" },
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}
