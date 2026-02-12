return {
	"nvim-telescope/telescope.nvim",
	version = false,
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			file_ignore_patterns = {
				"^.git/",
				"^node_modules/",
				"^dist/",
				"^build/",
				"^.next/",
				"^target/",
			},
			layout_config = {
				prompt_position = "top",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		pcall(telescope.load_extension, "fzf")
	end,
}
