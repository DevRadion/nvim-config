---@diagnostic disable: undefined-field
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"lukas-reineke/cmp-under-comparator",
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
		"windwp/nvim-autopairs",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local compare = require("cmp.config.compare")
		local under_comparator = require("cmp-under-comparator")
		local cmp_util = require("util.cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local tailwindcss_colorizer_cmp = require("tailwindcss-colorizer-cmp")
		local lspkind_formatter = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 60,
			ellipsis_char = "...",
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lsp_signature_help = "[SIG]",
				luasnip = "[SNIP]",
				path = "[PATH]",
				buffer = "[BUF]",
			},
		})

		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({
			performance = {
				debounce = 60,
				throttle = 30,
				fetching_timeout = 400,
				max_view_entries = 60,
			},
			experimental = {
				ghost_text = true,
			},
			preselect = cmp.PreselectMode.None,
			enabled = cmp_util.is_enabled,
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			matching = {
				disallow_prefix_unmatching = true,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 20, priority = 1000, keyword_length = 2 },
				{ name = "luasnip", max_item_count = 8, priority = 750 },
				{ name = "path", priority = 500 },
				{ name = "nvim_lsp_signature_help", priority = 450 },
			}, {
				{
					name = "buffer",
					keyword_length = 4,
					max_item_count = 6,
					priority = 250,
					option = {
						get_bufnrs = function()
							return vim.tbl_map(function(buf)
								return buf.bufnr
							end, vim.fn.getbufinfo({ buflisted = 1 }))
						end,
					},
				},
			}),
			sorting = {
				priority_weight = 2,
				comparators = {
					compare.offset,
					compare.exact,
					under_comparator.under,
					compare.score,
					compare.recently_used,
					compare.locality,
					compare.kind,
					compare.sort_text,
					compare.length,
					compare.order,
				},
			},
			formatting = {
				format = function(entry, vim_item)
					vim_item = lspkind_formatter(entry, vim_item)
					return tailwindcss_colorizer_cmp.formatter(entry, vim_item)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
	end,
}
