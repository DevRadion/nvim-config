return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		vim.cmd.colorscheme("onedark_dark")
	end,
}

-- {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		---@diagnostic disable-next-line: missing-fields
-- 		require("gruvbox").setup({
-- 			styles = {
-- 				terminal_colors = true,
-- 				undercurl = true,
-- 				underline = true,
-- 				bold = true,
-- 				italic = {
-- 					strings = true,
-- 					emphasis = true,
-- 					comments = true,
-- 					operators = false,
-- 					folds = true,
-- 				},
-- 				strikethrough = true,
-- 				invert_selection = false,
-- 				invert_signs = false,
-- 				invert_tabline = false,
-- 				invert_intend_guides = false,
-- 				inverse = true, -- invert background for search, diffs, statuslines and errors
-- 				contrast = "soft", -- can be "hard", "soft" or empty string
-- 				palette_overrides = {},
-- 				overrides = {},
-- 				dim_inactive = true,
-- 				transparent_mode = true,
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("gruvbox")
-- 	end,
-- },
-- })
