return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = {
		debugger = {
			enabled = false,
		},
		widget_guides = {
			enabled = true,
		},
	},
}
