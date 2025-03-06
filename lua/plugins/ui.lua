return {
	{ "echasnovski/mini.nvim", version = false },
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			notify.setup({
				background_colour = "#000000",
			})
			vim.notify = notify
		end,
	},
}
