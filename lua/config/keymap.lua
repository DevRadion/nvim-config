local map = function(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("keep", opts, { silent = true })
	vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Neotree" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }

		-- Jumps to the declaration of the symbol under the cursor.
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		-- Jumps to the definition of the symbol under the cursor.
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		-- Displays hover information about the symbol under the cursor in a floating
		-- window. Calling the function twice will jump into the floating window.
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		-- Lists all the implementations for the symbol under the cursor in the quickfix window.
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		-- Displays signature information about the symbol under the cursor in a floating window.
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

		-- Renames all references to the symbol under the cursor.
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		-- Selects a code action available at the current cursor position.
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		-- Lists all the references to the symbol under the cursor in the quickfix window.
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		-- Formats a buffer using the attached (and optionally filtered) language server clients.
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = ev.buf })
		end)
	end,
})
