local M = {}

local c = {
	bg = "#1A1A1A",
	surface = "#141414",
	line = "#292929",
	border = "#2A2A2A",
	text = "#D8DEE9",
	text_soft = "#D6D6DD",
	text_muted = "#CCCCCC",
	text_disabled = "#505050",
	comment = "#6D6D6D",
	white = "#FFFFFF",
	blue = "#81A1C1",
	cyan = "#88C0D0",
	teal = "#83D6C5",
	green = "#A3BE8C",
	yellow = "#EBCB8B",
	orange = "#EFB080",
	purple = "#AAA0FA",
	pink = "#E394DC",
	red = "#BF616A",
}

local function set(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

function M.apply()
	-- Core UI
	set("Normal", { fg = c.text, bg = c.bg })
	set("NormalNC", { fg = c.text, bg = c.bg })
	set("NormalFloat", { fg = c.text, bg = c.surface })
	set("FloatBorder", { fg = c.border, bg = c.surface })
	set("SignColumn", { fg = c.text_disabled, bg = c.bg })
	set("LineNr", { fg = c.text_disabled, bg = c.bg })
	set("CursorLineNr", { fg = c.white, bg = c.line, bold = true })
	set("CursorLine", { bg = c.line })
	set("ColorColumn", { bg = c.line })
	set("WinSeparator", { fg = c.border, bg = c.bg })
	set("Visual", { bg = "#303030" })
	set("Search", { bg = "#38474C", fg = c.white })
	set("CurSearch", { bg = c.cyan, fg = c.bg })
	set("Pmenu", { fg = c.text, bg = c.surface })
	set("PmenuSel", { fg = c.white, bg = "#404040" })
	set("StatusLine", { fg = c.text, bg = c.surface })
	set("StatusLineNC", { fg = c.text_muted, bg = c.surface })
	set("TabLine", { fg = c.text_muted, bg = c.surface })
	set("TabLineSel", { fg = c.white, bg = c.bg })
	set("TabLineFill", { bg = c.surface })
	set("DiagnosticError", { fg = c.red })
	set("DiagnosticWarn", { fg = c.yellow })
	set("DiagnosticInfo", { fg = c.cyan })
	set("DiagnosticHint", { fg = c.cyan })
	set("DiffAdd", { bg = "#233024" })
	set("DiffChange", { bg = "#3A3424" })
	set("DiffDelete", { bg = "#3A2427" })
	set("DiffText", { bg = "#38474C" })
	set("GitSignsAdd", { fg = c.green, bg = c.bg })
	set("GitSignsChange", { fg = c.yellow, bg = c.bg })
	set("GitSignsDelete", { fg = c.red, bg = c.bg })

	-- Vim syntax groups
	set("Comment", { fg = c.comment, italic = true })
	set("Constant", { fg = c.text_muted })
	set("String", { fg = c.pink })
	set("Character", { fg = c.pink })
	set("Number", { fg = c.yellow })
	set("Boolean", { fg = c.text_muted })
	set("Float", { fg = c.yellow })
	set("Identifier", { fg = c.text_soft })
	set("Function", { fg = c.orange })
	set("Statement", { fg = c.teal })
	set("Conditional", { fg = c.teal })
	set("Repeat", { fg = c.teal })
	set("Label", { fg = c.text_soft })
	set("Operator", { fg = c.teal })
	set("Keyword", { fg = c.teal })
	set("Exception", { fg = c.teal })
	set("PreProc", { fg = "#A8CC7C" })
	set("Type", { fg = "#87C3FF" })
	set("Special", { fg = c.text_soft })
	set("Delimiter", { fg = c.text_soft })
	set("Title", { fg = c.text_soft, bold = true })
	set("Todo", { fg = c.yellow, bg = c.bg, bold = true })

	-- Treesitter / LSP aligned groups
	set("@comment", { link = "Comment" })
	set("@keyword", { link = "Keyword" })
	set("@operator", { link = "Operator" })
	set("@function", { link = "Function" })
	set("@function.method", { fg = c.orange })
	set("@constructor", { fg = c.orange })
	set("@attribute", { fg = c.purple, italic = true })
	set("@property", { fg = "#81D2CE" })
	set("@variable", { fg = c.text_soft })
	set("@variable.member", { fg = c.text_soft })
	set("@variable.parameter", { fg = "#F8C762", italic = true })
	set("@constant", { fg = c.text_muted })
	set("@number", { link = "Number" })
	set("@boolean", { link = "Boolean" })
	set("@string", { link = "String" })
	set("@string.escape", { fg = c.text_soft })
	set("@string.regex", { fg = "#F8C762" })
	set("@punctuation", { fg = c.text_soft })
	set("@punctuation.delimiter", { fg = c.text_soft })
	set("@punctuation.bracket", { fg = "#FFD602" })
	set("@type", { fg = "#87C3FF" })
	set("@type.builtin", { fg = "#81D2CE" })
	set("@tag", { fg = "#FAD075" })

	-- Terminal ANSI palette from cursor.json
	vim.g.terminal_color_0 = c.border
	vim.g.terminal_color_1 = c.red
	vim.g.terminal_color_2 = c.green
	vim.g.terminal_color_3 = c.yellow
	vim.g.terminal_color_4 = c.blue
	vim.g.terminal_color_5 = "#B48EAD"
	vim.g.terminal_color_6 = c.cyan
	vim.g.terminal_color_7 = c.text
	vim.g.terminal_color_8 = c.text_disabled
	vim.g.terminal_color_9 = c.red
	vim.g.terminal_color_10 = c.green
	vim.g.terminal_color_11 = c.yellow
	vim.g.terminal_color_12 = c.blue
	vim.g.terminal_color_13 = "#B48EAD"
	vim.g.terminal_color_14 = c.cyan
	vim.g.terminal_color_15 = c.white

	vim.g.colors_name = "cursor-zed"
end

return M
