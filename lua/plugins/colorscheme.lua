return {
	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"vague2k/vague.nvim",
		opts = {
			style = {
				functions = "bold",
			},
		},
	},
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oldworld").setup({
				integrations = {
					neo_tree = true,
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		"sainnhe/gruvbox-material",
		priority = 1000,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "projekt0n/github-nvim-theme", name = "github-theme" },
}
