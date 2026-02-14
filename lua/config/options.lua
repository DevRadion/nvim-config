vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.title = true
vim.opt.cmdheight = 1

vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.spell = true

vim.opt.mouse = "a"

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.list = false

vim.opt.confirm = true
vim.opt.wrap = true
vim.opt.smoothscroll = true

vim.g.autoformat = true
vim.opt.autowrite = true
vim.opt.conceallevel = 2

vim.opt.termguicolors = true

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.wildmode = "longest:full,full"

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

vim.opt.inccommand = "split"

vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.o.completeopt = "menu,noinsert,popup,fuzzy"

vim.opt.scrolloff = 6
local sign_icon = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
local use_virtual_lines = vim.g.virtual_lines == true
vim.diagnostic.config({
	severity_sort = true,
	virtual_lines = use_virtual_lines,
	virtual_text = use_virtual_lines and false or {
		spacing = 2,
		source = "if_many",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = sign_icon.Error,
			[vim.diagnostic.severity.WARN] = sign_icon.Warn,
			[vim.diagnostic.severity.INFO] = sign_icon.Info,
			[vim.diagnostic.severity.HINT] = sign_icon.Hint,
		},
	},
	float = {
		border = "rounded",
		format = function(d)
			local code = d.code
			if not code and d.user_data and d.user_data.lsp then
				code = d.user_data.lsp.code
			end
			return ("%s (%s) [%s]"):format(d.message, d.source or "LSP", code or "no-code")
		end,
	},
	underline = true,
	jump = {
		float = true,
	},
})
