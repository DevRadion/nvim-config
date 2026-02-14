return {
	"ydkulks/cursor-dark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cursor-dark").setup({
			style = "dark",
			-- For a transparent background
			-- transparent = true,
		})
		require("theme.cursor_zed").apply()
	end,
}
