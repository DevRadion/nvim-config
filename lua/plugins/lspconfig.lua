return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"zls",
				"rust_analyzer",
				"clangd",
				"gopls",
			},
			automatic_enable = false,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				"ruff",
				"biome",
				"rustfmt",
				"clang-format",
				"goimports",
				"gofumpt",
				"golangci-lint",
			},
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local on_attach = function(client, bufnr)
			if client.supports_method("textDocument/inlayHint")
				and vim.api.nvim_buf_is_valid(bufnr)
				and vim.lsp.buf_is_attached(bufnr, client.id)
			then
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end

			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
			end

			map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
			map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
			map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
			map("n", "gr", vim.lsp.buf.references, "References")
			map("n", "K", vim.lsp.buf.hover, "Hover")
			map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
			map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
			map("n", "<leader>d", vim.diagnostic.open_float, "Line Diagnostics")
			map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
			map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
			map("n", "<leader>rs", "<cmd>LspRestart<cr>", "Restart LSP")
		end

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						completion = { callSnippet = "Replace" },
						workspace = { checkThirdParty = false },
					},
				},
			},
			ts_ls = {
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literals",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayVariableTypeHintsWhenTypeMatchesName = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
						suggest = {
							completeFunctionCalls = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "literals",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayVariableTypeHintsWhenTypeMatchesName = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
						suggest = {
							completeFunctionCalls = true,
						},
					},
				},
			},
			html = {},
			cssls = {},
			tailwindcss = {
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								{ "tw`([^`]*)", "tw`([^`]*)" },
								{ "tw=\"([^\"]*)", "tw=\"([^\"]*)" },
								{ "tw={'([^'}]*)", "tw={'([^'}]*)" },
								{ "tw\\.\\w+`([^`]*)", "tw\\.\\w+`([^`]*)" },
								{ "classNames\\(([^)]*)\\)", "'([^']*)'" },
								{ "classNames\\(([^)]*)\\)", "\"([^\"]*)\"" },
								{ "clsx\\(([^)]*)\\)", "'([^']*)'" },
								{ "clsx\\(([^)]*)\\)", "\"([^\"]*)\"" },
								{ "cva\\(([^)]*)\\)", "'([^']*)'" },
								{ "cva\\(([^)]*)\\)", "\"([^\"]*)\"" },
							},
						},
					},
				},
			},
			svelte = {},
			graphql = {},
			emmet_ls = {
				filetypes = {
					"html",
					"css",
					"scss",
					"sass",
					"less",
					"javascriptreact",
					"typescriptreact",
				},
			},
			prismals = {},
			pyright = {},
			zls = {},
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = true,
						check = {
							command = "clippy",
						},
					},
				},
			},
			clangd = {
				cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
			},
			gopls = {
				settings = {
					gopls = {
						gofumpt = true,
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
					},
				},
			},
		}

		for server_name, server_opts in pairs(servers) do
			vim.lsp.config(server_name, vim.tbl_deep_extend("force", {
				capabilities = capabilities,
				on_attach = on_attach,
			}, server_opts))
			vim.lsp.enable(server_name)
		end
	end,
}
