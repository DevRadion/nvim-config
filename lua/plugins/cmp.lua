---@diagnostic disable: undefined-field
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Sources
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"ray-x/cmp-treesitter",
		"L3MON4D3/LuaSnip",
		"lukas-reineke/cmp-under-comparator",

		-- UI / formatting
		"onsails/lspkind.nvim",
		"js-everts/cmp-tailwind-colors",
		"windwp/nvim-autopairs",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local cmp_tailwind = require("cmp-tailwind-colors")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Map source to label
		local source_mapping = {
			nvim_lsp = "[LSP]",
			luasnip = "[SNIP]",
			buffer = "[BUF]",
			path = "[PATH]",
			nvim_lua = "[LUA]",
			treesitter = "[TREE]",
			["vim-dadbod-completion"] = "[DB]",
		}

		-- Enable auto-pairs
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({
			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					require("cmp-under-comparator").under,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			custom_highlights = function(C)
				return {
					CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
					CmpItemKindKeyword = { fg = C.base, bg = C.red },
					CmpItemKindText = { fg = C.base, bg = C.teal },
					CmpItemKindMethod = { fg = C.base, bg = C.blue },
					CmpItemKindConstructor = { fg = C.base, bg = C.blue },
					CmpItemKindFunction = { fg = C.base, bg = C.blue },
					CmpItemKindFolder = { fg = C.base, bg = C.blue },
					CmpItemKindModule = { fg = C.base, bg = C.blue },
					CmpItemKindConstant = { fg = C.base, bg = C.peach },
					CmpItemKindField = { fg = C.base, bg = C.green },
					CmpItemKindProperty = { fg = C.base, bg = C.green },
					CmpItemKindEnum = { fg = C.base, bg = C.green },
					CmpItemKindUnit = { fg = C.base, bg = C.green },
					CmpItemKindClass = { fg = C.base, bg = C.yellow },
					CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
					CmpItemKindFile = { fg = C.base, bg = C.blue },
					CmpItemKindInterface = { fg = C.base, bg = C.yellow },
					CmpItemKindColor = { fg = C.base, bg = C.red },
					CmpItemKindReference = { fg = C.base, bg = C.red },
					CmpItemKindEnumMember = { fg = C.base, bg = C.red },
					CmpItemKindStruct = { fg = C.base, bg = C.blue },
					CmpItemKindValue = { fg = C.base, bg = C.peach },
					CmpItemKindEvent = { fg = C.base, bg = C.blue },
					CmpItemKindOperator = { fg = C.base, bg = C.blue },
					CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
					CmpItemKindCopilot = { fg = C.base, bg = C.teal },
				}
			end,
			experimental = {
				ghost_text = true,
			},
			enabled = function()
				return vim.api.nvim_get_option_value("buftype", { buf = 0 }) ~= "prompt"
			end,
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
				["<C-l>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
			}),
			sources = {
				{ name = "nvim_lsp_signature_help", group_index = 1 },
				{ name = "luasnip", max_item_count = 5, group_index = 1 },
				{ name = "nvim_lsp", max_item_count = 20, group_index = 1 },
				{ name = "nvim_lua", group_index = 1 },
				{ name = "treesitter", group_index = 4 },
				{ name = "vim-dadbod-completion", group_index = 1 },
				{ name = "path", group_index = 2 },
				{ name = "buffer", keyword_length = 2, max_item_count = 5, group_index = 2 },
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 60,
					ellipsis_char = "...",
					before = function(entry, item)
						cmp_tailwind.format(entry, item)
						item.menu = source_mapping[entry.source.name]
						return item
					end,
				}),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})

		-- Optional: Auto SQL completion
		local group = vim.api.nvim_create_augroup("sql_cmp", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "sql", "mysql", "plsql" },
			callback = function()
				cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
			end,
			group = group,
		})
	end,
}
