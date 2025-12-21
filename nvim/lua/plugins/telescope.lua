return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Buffers" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope: Recent files" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help" })
	end,
}
