return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				"gruvbox",
				"gruvbox-material",
				"oxocarbon",
				"catppuccin",
				"vague",
				"oldworld",
				-- rose-pine
				"rose-pine-main",
				"rose-pine-moon",
				"rose-pine-dawn",
				-- Github
				"github_dark",
				"github_dark_default",
				"github_dark_dimmed",
				"github_light",
			},
		})
	end,
}
