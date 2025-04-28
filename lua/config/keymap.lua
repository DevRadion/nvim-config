local map = function(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("keep", opts, { silent = true })
	vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Neotree" })
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to Right Window", remap = true })
vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "LazyGit" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

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
