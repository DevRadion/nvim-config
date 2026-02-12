return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local cursorline_bg = "#0d0f11"

		require("onedarkpro").setup({
			highlights = {
				CursorLine = { bg = cursorline_bg },
				CursorLineNr = { bg = cursorline_bg, extend = true },
			},
		})

		vim.cmd("colorscheme onedark_dark")
	end,
}
