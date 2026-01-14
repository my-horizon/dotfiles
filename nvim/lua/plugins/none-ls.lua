return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.clang_format.with({
					cmd = "/run/current-system/sw/bin/clang-format",
					extra_args = {
						"--style={BasedOnStyle: llvm, ReflowComments: false}",
					},
				}),
				null_ls.builtins.formatting.prettier.with({
					cmd = "/run/current-system/sw/bin/prettier",
					filetypes = { "json" },
				}),
				null_ls.builtins.formatting.yamlfmt.with({
					cmd = "/run/current-system/sw/bin/yamlfmt",
				}),
				null_ls.builtins.formatting.stylua.with({
					cmd = "/run/current-system/sw/bin/stylua",
				}),
				null_ls.builtins.formatting.alejandra.with({
					cmd = "/run/current-system/sw/bin/alejandra",
				}),
			},
		})
		vim.keymap.set("n", "<leader>lf", function()
			vim.lsp.buf.format({
				async = true,
				filter = function(client)
					return client.name == "null-ls" or client.name == "none-ls"
				end,
			})
		end, { desc = "LSP: Format buffer" })
	end,
}
