-- return {
-- 	"nyoom-engineering/oxocarbon.nvim",
-- 	config = function()
-- 		vim.opt.background = "dark"
-- 		vim.cmd("colorscheme oxocarbon")
-- 	end,
-- }
--
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
return {
	"dgox16/oldworld.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme oldworld")
	end,
}
