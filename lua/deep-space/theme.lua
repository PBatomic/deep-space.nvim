local M = {}

local function set_hl(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

-- Convenience: link one group to another
local function link(from, to)
	vim.api.nvim_set_hl(0, from, { link = to, default = false })
end

function M.apply(p)
	-- Basics
	set_hl("Normal", { fg = p.fg, bg = p.bg })
	set_hl("NormalFloat", { fg = p.fg, bg = p.bg2 })
	set_hl("NormalNC", { fg = p.fg, bg = p.bg })
	set_hl("EndOfBuffer", { fg = p.fg, bg = p.bg })
	set_hl("FloatBorder", { fg = p.bg4, bg = p.bg2 })
	set_hl("WinSeparator", { fg = p.bg4, bg = p.bg })
	set_hl("CursorLine", { bg = p.bg2 })
	set_hl("CursorColumn", { bg = p.bg2 })
	set_hl("CursorLineNr", { fg = p.fg, bg = p.bg2, bold = true })
	set_hl("LineNr", { fg = p.ln, bg = p.bg, bold = true })
	set_hl("CursorLineNr", { fg = p.keyword, bg = p.bg, bold = true })
	set_hl("SignColumn", { fg = p.fg3, bg = p.bg })
	set_hl("Visual", { bg = p.bg3 })
	set_hl("Search", { fg = p.bg, bg = p.keyword, bold = true })
	set_hl("IncSearch", { fg = p.bg, bg = p.const, bold = true })
	set_hl("MatchParen", { fg = p.const, bg = p.bg2, bold = true })
	set_hl("Pmenu", { fg = p.fg, bg = p.bg2 })
	set_hl("PmenuSel", { fg = p.bg, bg = p.fg4, bold = true })
	set_hl("PmenuSbar", { bg = p.bg3 })
	set_hl("PmenuThumb", { bg = p.fg4 })
	set_hl("StatusLine", { fg = p.fg, bg = p.bg2 })
	set_hl("StatusLineNC", { fg = p.fg3, bg = p.bg2 })
	set_hl("TabLine", { fg = p.fg3, bg = p.bg2 })
	set_hl("TabLineSel", { fg = p.bg, bg = p.fg3, bold = true })
	set_hl("TabLineFill", { fg = p.fg3, bg = p.bg2 })
	set_hl("VertSplit", { fg = p.bg4 })
	set_hl("ColorColumn", { bg = p.bg2 })
	set_hl("Whitespace", { fg = p.bg4 })
	set_hl("IndentBlanklineChar", { fg = p.bg4 })
	set_hl("IndentBlanklineContextChar", { fg = p.fg }) -- For context line
	set_hl("IndentBlanklineSpaceChar", { fg = p.bg4 }) -- For space char
	set_hl("IndentBlanklineSpaceCharBlankline", { fg = p.bg4 }) -- For blank lines
	set_hl("SnacksPickerDir", { fg = p.fg })
	set_hl("SnacksPickerDirectory", { fg = p.fg2 })

	-- Syntax (legacy Vim groups)
	set_hl("Comment", { fg = p.comment, italic = true })
	set_hl("Constant", { fg = p.const, bold = true })
	set_hl("String", { fg = p.str })
	set_hl("Character", { fg = p.str })
	set_hl("Number", { fg = p.const })
	set_hl("Boolean", { fg = p.const })
	set_hl("Float", { fg = p.const })
	set_hl("Identifier", { fg = p.var })
	set_hl("Function", { fg = p.func })
	set_hl("Statement", { fg = p.keyword })
	set_hl("Conditional", { fg = p.keyword })
	set_hl("Repeat", { fg = p.keyword })
	set_hl("Label", { fg = p.keyword })
	set_hl("Operator", { fg = p.fg })
	set_hl("Keyword", { fg = p.keyword, italic = true })
	set_hl("Exception", { fg = p.keyword })
	set_hl("PreProc", { fg = p.builtin })
	set_hl("Include", { fg = p.keyword })
	set_hl("Define", { fg = p.builtin })
	set_hl("Macro", { fg = p.builtin })
	set_hl("PreCondit", { fg = p.builtin })
	set_hl("Type", { fg = p.type })
	set_hl("StorageClass", { fg = p.type })
	set_hl("Structure", { fg = p.type })
	set_hl("Typedef", { fg = p.type })
	set_hl("Special", { fg = p.special })
	set_hl("SpecialComment", { fg = p.fg3, italic = true })
	set_hl("Tag", { fg = p.special })
	set_hl("Delimiter", { fg = p.fg })
	set_hl("SpecialChar", { fg = p.const })
	set_hl("Debug", { fg = p.warning2 })
	set_hl("Underlined", { underline = true })
	set_hl("Ignore", { fg = p.bg4 })
	set_hl("Error", { fg = p.bg, bg = p.warning, bold = true })
	set_hl("Todo", { fg = p.bg, bg = p.keyword, bold = true })

	-- Diagnostics (LSP)
	set_hl("DiagnosticError", { fg = p.warning })
	set_hl("DiagnosticWarn", { fg = p.warning2 })
	set_hl("DiagnosticInfo", { fg = p.fg2 })
	set_hl("DiagnosticHint", { fg = p.fg3 })
	set_hl("DiagnosticVirtualTextError", { fg = p.warning, bg = p.bg2 })
	set_hl("DiagnosticVirtualTextWarn", { fg = p.warning2, bg = p.bg2 })
	set_hl("DiagnosticVirtualTextInfo", { fg = p.fg2, bg = p.bg2 })
	set_hl("DiagnosticVirtualTextHint", { fg = p.fg3, bg = p.bg2 })

	set_hl("DiagnosticUnderlineError", { sp = p.warning, undercurl = true })
	set_hl("DiagnosticUnderlineWarn", { sp = p.warning2, undercurl = true })
	set_hl("DiagnosticUnderlineInfo", { sp = p.fg2, undercurl = true })
	set_hl("DiagnosticUnderlineHint", { sp = p.fg3, undercurl = true })

	set_hl("LspReferenceText", { bg = p.bg2 })
	set_hl("LspReferenceRead", { bg = p.bg2 })
	set_hl("LspReferenceWrite", { bg = p.bg2 })

	-- Tree‑sitter (@ capture groups)
	set_hl("@comment", { link = "Comment", italic = true })
	set_hl("@string", { link = "String" })
	set_hl("@string.escape", { fg = p.const, bold = true })
	set_hl("@string.documentation", { fg = p.docstring, italic = true })
	set_hl("@character", { link = "Character" })
	set_hl("@number", { link = "Number" })
	set_hl("@boolean", { link = "Boolean" })
	set_hl("@float", { link = "Float" })
	set_hl("@constant", { link = "Constant" })
	set_hl("@constant.builtin", { fg = p.const, italic = true })
	set_hl("@variable", { fg = p.var })
	set_hl("@variable.parameter", { fg = p.var })
	set_hl("@variable.builtin", { fg = p.builtin, italic = true })
	set_hl("@variable.member", { fg = p.var })
	set_hl("@parameter", { fg = p.fg2 })
	set_hl("@function", { link = "Function" })
	set_hl("@function.call", { link = "Function" })
	set_hl("@function.builtin", { fg = p.func, italic = true })
	set_hl("@function.method.call", { fg = p.func })
	set_hl("@method", { link = "Function" })
	set_hl("@method.call", { fg = p.func })
	set_hl("@field", { fg = p.fg2 })
	set_hl("@property", { fg = p.fg2 })
	set_hl("@constructor", { fg = p.func })
	set_hl("@keyword", { link = "Keyword" })
	set_hl("@keyword.function", { fg = p.keyword, italic = true })
	set_hl("@keyword.operator", { fg = p.keyword })
	set_hl("@keyword.return", { fg = p.keyword, italic = true })
	set_hl("@keyword.conditional", { fg = p.keyword })
	set_hl("@operator", { link = "Operator" })
	set_hl("@type", { link = "Type" })
	set_hl("@type.builtin", { fg = p.btype, italic = true })
	set_hl("@tag", { link = "Tag" })
	set_hl("@tag.attribute", { fg = p.type })
	set_hl("@tag.delimiter.templ", { link = "Tag" })
	set_hl("@punctuation", { fg = p.fg })
	set_hl("@punctuation.bracket", { fg = p.fg })
	set_hl("@punctuation.delimiter", { fg = p.fg })
	set_hl("@punctuation.special", { fg = p.const })

	-- Templ specific stuff
	set_hl("@module.templ", { fg = p.keyword })
	set_hl("@module", { fg = p.keyword })

	-- LSP semantic tokens (links keep it future‑proof)
	link("@lsp.type.class", "Type")
	link("@lsp.type.enum", "Type")
	link("@lsp.type.enumMember", "Constant")
	link("@lsp.type.function", "Function")
	link("@lsp.type.method", "Function")
	link("@lsp.type.interface", "Type")
	link("@lsp.type.macro", "Macro")
	link("@lsp.type.namespace", "Type")
	link("@lsp.type.parameter", "@parameter")
	link("@lsp.type.property", "@property")
	link("@lsp.type.struct", "Type")
	link("@lsp.type.type", "Type")
	link("@lsp.type.typeParameter", "Type")
	link("@lsp.type.variable", "Identifier")

	-- Diffs & Git
	set_hl("DiffAdd", { fg = p.builtin, bg = p.bg2 })
	set_hl("DiffChange", { fg = p.special2, bg = p.bg2 })
	set_hl("DiffDelete", { fg = p.warning, bg = p.bg2 })
	set_hl("DiffText", { fg = p.const, bg = p.bg2, bold = true })

	-- Telescope (optional but common)
	local tb = p.bg2
	set_hl("TelescopeNormal", { fg = p.fg, bg = tb })
	set_hl("TelescopeBorder", { fg = p.bg4, bg = tb })
	set_hl("TelescopePromptNormal", { fg = p.fg, bg = tb })
	set_hl("TelescopePromptBorder", { fg = p.bg4, bg = tb })
	set_hl("TelescopeSelection", { fg = p.fg, bg = p.bg3, bold = true })

	-- Neo-tree
	set_hl("NeoTreeTitleBar", { fg = p.special, bg = p.bg })
	set_hl("NeoTreeFloatTitle", { fg = p.special, bg = p.bg })
	set_hl("NeoTreeBufferNumber", { fg = p.special, bg = p.bg })
	set_hl("NeoTreeNormal", { fg = p.fg, bg = p.bg })
	set_hl("NeoTreeEndOfBuffer", { fg = p.bg2, bg = p.bg })
	set_hl("NeoTreeRootName", { fg = p.keyword, bold = true })
	set_hl("NeoTreeDirectoryName", { fg = p.keyword, bold = true })
	set_hl("NeoTreeDirectoryIcon", { fg = p.func })
	set_hl("NeoTreeIndentMarker", { fg = p.bg4 })
	set_hl("NeoTreeFileName", { fg = p.fg })
	set_hl("NeoTreeFileNameOpened", { fg = p.fg2, bold = true })
	set_hl("NeoTreeFileIcon", { fg = p.fg3 })
	set_hl("NeoTreeSymbolicLinkTarget", { fg = p.builtin, italic = true })
	set_hl("NeoTreeGitAdded", { fg = p.git })
	set_hl("NeoTreeGitDeleted", { fg = p.warning })
	set_hl("NeoTreeGitModified", { fg = p.git })
	set_hl("NeoTreeGitUntracked", { fg = p.comment })

	-- Snacks dashboard
	set_hl("DashboardHeader", { fg = p.keyword, bold = true })
	set_hl("DashboardCenter", { fg = p.fg })

	-- Snacks picker
	set_hl("SnacksPicker", { fg = p.fg, bg = p.bg })
	set_hl("SnacksPickerNormal", { fg = p.fg, bg = p.bg })
	set_hl("SnacksPickerBorder", { fg = p.func, bg = p.bg })

	-- Terminal colors
	vim.g.terminal_color_0 = p.bg4
	vim.g.terminal_color_1 = p.warning
	vim.g.terminal_color_2 = p.builtin
	vim.g.terminal_color_3 = p.str
	vim.g.terminal_color_4 = p.keyword
	vim.g.terminal_color_5 = p.const
	vim.g.terminal_color_6 = p.fg3
	vim.g.terminal_color_7 = p.fg
	vim.g.terminal_color_8 = p.bg3
	vim.g.terminal_color_9 = p.warning2
	vim.g.terminal_color_10 = p.builtin
	vim.g.terminal_color_11 = p.str
	vim.g.terminal_color_12 = p.keyword
	vim.g.terminal_color_13 = p.const
	vim.g.terminal_color_14 = p.fg2
	vim.g.terminal_color_15 = p.fg
end

return M
