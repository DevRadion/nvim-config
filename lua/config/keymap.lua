local map = function(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("keep", opts or {}, { silent = true })
	vim.keymap.set(mode, lhs, rhs, opts)
end

local cwd = function()
	return (vim.uv or vim.loop).cwd()
end

local project_root = function()
	local name = vim.api.nvim_buf_get_name(0)
	local start = name ~= "" and vim.fs.dirname(name) or cwd()
	return vim.fs.root(start, { ".git" }) or cwd()
end

local current_file_dir = function()
	local dir = vim.fn.expand("%:p:h")
	if dir == "" or vim.fn.isdirectory(dir) == 0 then
		return cwd()
	end
	return dir
end

local is_git_repo = function(dir)
	return vim.fn.system({ "git", "-C", dir, "rev-parse", "--is-inside-work-tree" }):match("true") ~= nil
end

local file_find_command = function()
	if vim.fn.executable("fd") == 1 then
		return { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" }
	end
	return { "rg", "--files", "--hidden", "--glob", "!.git" }
end

map("n", "<leader>e", function()
	require("telescope").extensions.file_browser.file_browser({
		path = project_root(),
		cwd = project_root(),
		select_buffer = true,
		hidden = true,
	})
end, { desc = "Telescope File Explorer (Project)" })
map("n", "<leader>E", function()
	require("telescope").extensions.file_browser.file_browser({
		path = current_file_dir(),
		cwd = project_root(),
		select_buffer = true,
		hidden = true,
	})
end, { desc = "Telescope File Explorer (Current Dir)" })
map("n", "<leader>ff", function()
	local root = project_root()
	local builtin = require("telescope.builtin")
	if is_git_repo(root) then
		builtin.git_files({
			cwd = root,
			show_untracked = true,
		})
	else
		builtin.find_files({
			cwd = root,
			hidden = true,
			no_ignore = false,
			no_ignore_parent = false,
			follow = false,
			find_command = file_find_command(),
		})
	end
end, { desc = "Find Files" })
map("n", "<leader>fg", function()
	require("telescope.builtin").live_grep({
		cwd = project_root(),
	})
end, { desc = "Live Grep" })
map("n", "<leader>fG", function()
	require("telescope.builtin").live_grep({
		search_dirs = { current_file_dir() },
	})
end, { desc = "Grep In Current File Dir" })
map("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Buffers" })
map("n", "<leader>fr", function()
	require("telescope.builtin").resume()
end, { desc = "Resume Picker" })
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
