return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	lazy = false, -- This plugin is already lazy
	config = function()
		vim.g.rustaceanvim = {
			tools = {},

			server = {
				default_settings = {
					["rust-analyzer"] = {
						checkOnSave = true,
						diagnostics = {
							styleLints = {
								enable = true,
							},
						},
						cargo = {
							features = "all",
						},
					},
				},
			},
			dap = {},
		}
	end,
}
