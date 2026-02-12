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
		"nvim-telescope/telescope-file-browser.nvim",
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
			file_browser = {
				grouped = true,
				hidden = true,
				hijack_netrw = true,
				respect_gitignore = true,
				collapse_dirs = true,
				fuzzy_finder = true,
				depth = 1,
				auto_depth = true,
				mappings = {
					i = {
						["<bs>"] = function()
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<bs>", true, false, true), "tn", false)
						end,
						["<BS>"] = function()
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<bs>", true, false, true), "tn", false)
						end,
						["<Del>"] = function()
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Del>", true, false, true), "tn", false)
						end,
						["<Delete>"] = function()
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Del>", true, false, true), "tn", false)
						end,
						["<kDel>"] = function()
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Del>", true, false, true), "tn", false)
						end,
						["<C-h>"] = function()
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<bs>", true, false, true), "tn", false)
						end,
					},
					n = {
						["<bs>"] = false,
						["<BS>"] = false,
						["<Del>"] = false,
						["<Delete>"] = false,
						["<kDel>"] = false,
						["h"] = false,
					},
				},
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "file_browser")
	end,
}
