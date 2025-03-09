return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			lualine.setup({
				options = {
					theme = "gruvbox-material",
					component_separators = {},
					section_separators = {},
					extensions = {
						"neo-tree",
						"nvim-dap-ui",
						"trouble",
						"mason",
						"lazy",
					},
				},
			})
		end,
	},
}
