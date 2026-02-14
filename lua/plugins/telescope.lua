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
		"nvim-telescope/telescope-ui-select.nvim",
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
			["ui-select"] = {},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		local themes = require("telescope.themes")
		opts.extensions["ui-select"] = themes.get_dropdown({
			layout_strategy = "cursor",
		})
		telescope.setup(opts)
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")
	end,
}
