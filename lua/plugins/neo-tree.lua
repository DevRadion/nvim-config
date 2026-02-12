return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		commands = {
			fast_find = function(state)
				local cwd = state and state.path or vim.uv.cwd()
				local builtin = require("telescope.builtin")
				local has_fd = vim.fn.executable("fd") == 1
				builtin.find_files({
					cwd = cwd,
					hidden = true,
					no_ignore = false,
					no_ignore_parent = false,
					follow = false,
					find_command = has_fd and { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" }
						or { "rg", "--files", "--hidden", "--glob", "!.git" },
				})
			end,
		},
		window = {
			position = "float",
			mappings = {
				["l"] = "open",
				["/"] = "fast_find",
			},
		},
		filesystem = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = true,
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
			},
		},
	},
}
