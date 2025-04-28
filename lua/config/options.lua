vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.showmode = false
vim.opt.showcmd = true

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
vim.opt.wrap = false
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

vim.opt.list = false
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
vim.o.completeopt = "menu,noinsert,popup,fuzzy"

vim.opt.scrolloff = 10
vim.lsp.inlay_hint.enable(true, nil)
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = { current_line = true },
})
