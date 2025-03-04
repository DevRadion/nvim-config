return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		config = function()
			if vim.lsp.inlay_hint then
				Snacks.toggle.inlay_hints():map("<leader>uh")
			end

			-- lazygit
			if vim.fn.executable("lazygit") == 1 then
				vim.keymap.set("n", "<leader>gg", function()
					Snacks.lazygit()
				end, { desc = "Lazygit (Root Dir)" })
				vim.keymap.set("n", "<leader>gG", function()
					Snacks.lazygit()
				end, { desc = "Lazygit (cwd)" })
				vim.keymap.set("n", "<leader>gf", function()
					Snacks.picker.git_log_file()
				end, { desc = "Git Current File History" })
				vim.keymap.set("n", "<leader>gl", function()
					Snacks.picker.git_log({ cwd = LazyVim.root.git() })
				end, { desc = "Git Log" })
				vim.keymap.set("n", "<leader>gL", function()
					Snacks.picker.git_log()
				end, { desc = "Git Log (cwd)" })
			end
		end,
	},
}
