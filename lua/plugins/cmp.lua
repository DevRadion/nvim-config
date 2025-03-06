local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

local config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	luasnip.config.setup({})

	cmp.setup({
		performance = {
			max_view_entries = 20,
			debounce = 10,
			throttle = 0,
		},
		view = {
			entries = {
				name = "custom",
				selection_order = "near_cursor",
				follow_cursor = true,
			},
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		completion = { completeopt = "menu,menuone,noinsert" },
		formatting = {
			format = function(_, vim_item)
				vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
				return vim_item
			end,
		},
		mapping = cmp.mapping.preset.insert({
			-- Select the [n]ext item
			["<C-n>"] = cmp.mapping.select_next_item(),
			-- Select the [p]revious item
			["<C-p>"] = cmp.mapping.select_prev_item(),

			-- Scroll the documentation window [b]ack / [f]orward
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),

			-- Accept ([y]es) the completion.
			--  This will auto-import if your LSP supports it.
			--  This will expand snippets if the LSP sent a snippet.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			-- Manually trigger a completion from nvim-cmp.
			--  Generally you don't need this, because nvim-cmp will display
			--  completions whenever it has completion options available.
			["<C-Space>"] = cmp.mapping.complete({}),

			-- Think of <c-l> as moving to the right of your snippet expansion.
			--  So if you have a snippet that's like:
			--  function $name($args)
			--    $body
			--  end
			--
			-- <c-l> will move you to the right of each of the expansion locations.
			-- <c-h> is similar, except moving you backwards.
			["<C-l>"] = cmp.mapping(function()
				if luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				end
			end, { "i", "s" }),
			["<C-h>"] = cmp.mapping(function()
				if luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { "i", "s" }),
		}),
		sources = {
			{
				name = "lazydev",
				-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
				group_index = 0,
			},
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "crates" },
			{ name = "nvim_lsp_signature_help" },
		},
	})
end

return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = config,
	},
	{
		"hrsh7th/cmp-cmdline",
		config = function()
			local cmp = require("cmp")
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
				}),
			})
		end,
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
		},
		event = "CmdlineEnter",
	},
}
