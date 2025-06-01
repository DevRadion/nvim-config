-- return {
-- 	"nyoom-engineering/oxocarbon.nvim",
-- 	config = function()
-- 		vim.opt.background = "dark"
-- 		vim.cmd("colorscheme oxocarbon")
-- 	end,
-- }

-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.opt.background = "dark"
-- 		vim.cmd("colorscheme catppuccin-mocha")
-- 	end,
-- }

-- return {
-- 	"vague2k/vague.nvim",
-- 	opts = {
-- 		style = {
-- 			functions = "bold",
-- 		},
-- 	},
-- 	config = function()
-- 		vim.cmd("colorscheme vague")
-- 	end,
-- }
--
-- return {
-- 	"dgox16/oldworld.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("oldworld").setup({
-- 			integrations = {
-- 				neo_tree = true,
-- 			},
-- 		})
-- 		vim.cmd("colorscheme oldworld")
-- 	end,
-- }
--
return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		vim.opt.background = "dark"
		vim.cmd("colorscheme gruvbox")
	end,
}
