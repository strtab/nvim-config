local g = {
	bg = nil,
	bg_alt = "#080808",
	bg_alt2 = "#202020",
	fg = "#a59a84",

	dim1 = "#1c1c1c",
	dim2 = "#303030",

	black = "#1a1b19",
	red = "#af4b00",
	green = "#919922",
	yellow = "#ca9f1d",
	blue = "#46867e",
	mag = "#b8616a",
	cyan = "#6c9d66",
	br_green = "#AFBC33",
	br_black = "#8f8473",
	orange = "#e16600",
	br_yellow = "#ecc330",
	br_blue = "#85a593",
	br_mag = "#d88681",
	br_white = "#d4be98",

	git_add = "#87af00",
	git_mod = "#ffd75f",
	git_del = "#d70000",
}

local t = {
	bg = nil,
	bg_alt = 232,
	fg = 7,

	dim1 = 234,
	dim2 = 236,

	black = 0,
	red = 1,
	green = 2,
	yellow = 3,
	blue = 4,
	mag = 5,
	cyan = 6,
	br_black = 8,
	orange = 9,
	br_green = 10,
	br_yellow = 11,
	br_blue = 12,
	br_mag = 13,
	br_white = 15,

	git_add = 106,
	git_mod = 221,
	git_del = 160,
}

local hl = function(name, val)
	vim.api.nvim_set_hl(0, name, val)
end

hl("Normal", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("EndOfBuffer", { bg = g.bg, fg = g.br_black, ctermbg = t.bg, ctermfg = t.br_black })
hl("SignColumn", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("NonText", { bg = g.bg, fg = g.br_black, ctermbg = t.bg, ctermfg = t.br_black })
hl("MoreMsg", { fg = g.cyan, ctermfg = t.cyan })
hl("Directory", { fg = g.red, ctermfg = t.blue })

-- Line numbers
hl("LineNr", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("LineNrAbove", { bg = g.bg, fg = g.dim2, ctermbg = t.bg, ctermfg = t.dim2 })
hl("LineNrBelow", { bg = g.bg, fg = g.dim2, ctermbg = t.bg, ctermfg = t.dim2 })

-- Cursor line
hl("CursorLineNr", { bg = g.bg, fg = g.br_black, ctermbg = t.bg, ctermfg = t.br_black })
hl("CursorLine", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("CursorColumn", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })

-- Pop-up menu
hl("Pmenu", { bg = g.bg_alt, ctermbg = t.bg_alt })
hl("PmenuSel", { bg = g.bg_alt2, ctermbg = t.bg_alt + 1 })
hl("PmenuSbar", { bg = g.bg_alt, ctermbg = t.bg_alt })
hl("PmenuThumb", { bg = g.bg_alt, ctermbg = t.bg_alt })

-- Floating windows
hl("NormalFloat", { bg = g.bg_alt, fg = g.fg, ctermbg = t.bg_alt, ctermfg = t.fg })
hl("FloatBorder", { bg = g.bg_alt, fg = g.br_black, ctermbg = t.bg_alt, ctermfg = t.br_black })
hl("FloatTitle", { bg = g.bg_alt, fg = g.blue, ctermbg = t.bg_alt, ctermfg = t.blue, bold = true })

-- UI elements
hl("StatusLine", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("StatusLineNC", { bg = g.br, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("VertSplit", { bg = g.bg, fg = g.br_black, ctermbg = t.bg, ctermfg = t.br_black })

-- Tab line
hl("TabLine", { bg = g.bg, fg = g.br_black, ctermbg = t.bg, ctermfg = t.br_black })
hl("TabLineFill", { bg = g.bg, fg = g.br_mag, ctermbg = t.bg, ctermfg = t.br_mag })
hl("TabLineSel", { bg = g.bg, fg = g.br_mag, ctermbg = t.bg, ctermfg = t.br_mag })

-- Visual mode
hl("Visual", { bg = g.fg, fg = g.black, ctermbg = t.fg, ctermfg = 0 })
hl("VisualNOS", { bg = g.fg, fg = g.black, ctermbg = t.fg, ctermfg = 0 })

-- Syntax
hl("Title", { fg = g.fg, ctermfg = t.fg })
hl("String", { fg = g.green, ctermfg = t.green })
hl("Comment", { fg = g.br_black, ctermfg = t.br_black, italic = true })
hl("Operator", { fg = g.fg, ctermfg = t.fg })
hl("Special", { fg = g.br_white, ctermfg = t.br_white })
hl("Delimiter", { fg = g.orange, ctermfg = t.orange })
hl("@variable", { fg = g.br_white, ctermfg = t.br_white })
hl("Identifier", { fg = g.blue, ctermfg = t.blue })
hl("Statement", { fg = g.mag, ctermfg = t.mag })
hl("Keyword", { fg = g.mag, ctermfg = t.br_mag, bold = true })
hl("Function", { fg = g.yellow, ctermfg = t.yellow })
hl("Type", { fg = g.yellow, ctermfg = t.yellow })
hl("Number", { fg = g.fg, ctermfg = t.fg })
hl("Constant", { fg = g.blue, ctermfg = t.blue })
hl("PreProc", { fg = g.br_white, ctermfg = t.br_white })
hl("Include", { fg = g.br_white, ctermfg = t.br_white })
hl("Todo", { fg = g.br_white, ctermfg = t.br_white, bold = true })

-- Netrw
hl("NetrwDir", { fg = g.blue, ctermfg = t.blue })
hl("netrwClassify", { fg = g.blue, ctermfg = t.blue })

-- Diagnostic
hl("DiagnosticFloatingError", { fg = g.red, ctermfg = t.red })
hl("DiagnosticError", { fg = g.red, ctermfg = t.red })
hl("DiagnosticFloatingWarn", { fg = g.br_yellow, ctermfg = t.br_yellow })
hl("DiagnosticWarn", { fg = g.br_yellow, ctermfg = t.br_yellow })
hl("DiagnosticFloatingInfo", { fg = g.br_blue, ctermfg = t.br_blue })
hl("DiagnosticInfo", { fg = g.br_blue, ctermfg = t.br_blue })
hl("DiagnosticFloatingHint", { fg = g.br_black, ctermfg = t.br_black })
hl("DiagnosticHint", { fg = g.br_mag, ctermfg = t.br_mag })
hl("DiagnosticFloatingOk", { fg = g.br_green, ctermfg = t.br_green })
hl("DiagnosticOk", { fg = g.br_green, ctermfg = t.br_green })

-- Mini Icons
hl("MiniIconsAzure", { fg = g.green, ctermfg = t.green })
hl("MiniIconsBlue", { fg = g.br_blue, ctermfg = t.br_blue })
hl("MiniIconsCyan", { fg = g.cyan, ctermfg = t.cyan })
hl("MiniIconsGreen", { fg = g.br_green, ctermfg = t.br_green })
hl("MiniIconsGrey", { fg = g.br_black, ctermfg = t.br_black })
hl("MiniIconsOrange", { fg = g.orange, ctermfg = t.orange })
hl("MiniIconsPurple", { fg = g.mag, ctermfg = t.mag })
hl("MiniIconsRed", { fg = g.red, ctermfg = t.red })
hl("MiniIconsYellow", { fg = g.yellow, ctermfg = t.yellow })

-- Which-key
hl("WhichKey", { bg = g.bg, fg = g.mag, ctermbg = t.bg, ctermfg = t.mag })
hl("WhichKeyGroup", { bg = g.bg, fg = g.blue, ctermbg = t.bg, ctermfg = t.blue })
hl("WhichKeyDesc", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("WhichKeyValue", { bg = g.bg, fg = g.green, ctermbg = t.bg, ctermfg = t.green })
hl("WhichKeySeparator", { bg = g.bg, fg = g.br_black, ctermbg = t.bg, ctermfg = t.br_black })

-- Noice
hl("NoiceCmdlinePopupBorder", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("NoiceCmdlinePopupBorderSearch", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("NoiceCmdlinePopupTitleSearch", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("ErrorMsg", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })

-- Oil
hl("OilDir", { bg = g.bg, fg = g.blue, ctermbg = t.bg, ctermfg = t.blue, bold = true })
hl("OilDirHidden", { bg = g.bg, fg = g.blue, ctermbg = t.bg, ctermfg = t.blue, bold = true })
hl("OilFile", { bg = g.bg, fg = g.br_black, ctermbg = t.bg, ctermfg = t.br_black })
hl("OilDirIcon", { bg = g.bg, fg = g.blue, ctermbg = t.bg, ctermfg = t.blue })

-- Oil git status
hl("OilGitStatusIndexIgnored", { bg = g.bg, fg = g.blue, ctermbg = t.bg, ctermfg = t.blue })
hl("OilGitStatusIndexUntracked", { bg = g.bg, fg = g.blue, ctermbg = t.bg, ctermfg = t.blue })
hl("OilGitStatusIndexAdded", { bg = g.bg, fg = g.git_add, ctermbg = t.bg, ctermfg = t.git_add })
hl("OilGitStatusIndexCopied", { bg = g.bg, fg = g.git_mod, ctermbg = t.bg, ctermfg = t.git_mod })
hl("OilGitStatusIndexDeleted", { bg = g.bg, fg = g.git_del, ctermbg = t.bg, ctermfg = t.git_del })
hl("OilGitStatusIndexModified", { bg = g.bg, fg = g.git_mod, ctermbg = t.bg, ctermfg = t.git_mod })
hl("OilGitStatusIndexRenamed", { bg = g.bg, fg = g.git_mod, ctermbg = t.bg, ctermfg = t.git_mod })
hl("OilGitStatusIndexTypeChanged", { bg = g.bg, fg = g.git_mod, ctermbg = t.bg, ctermfg = t.git_mod })
hl("OilGitStatusIndexUnmerged", { bg = g.bg, fg = g.blue, ctermbg = t.bg, ctermfg = t.blue })

-- Indent blank line
hl("IblIndent", { bg = g.bg, fg = g.dim1, ctermbg = t.bg, ctermfg = t.dim1 })
hl("IblScope", { bg = g.bg, fg = g.dim1, ctermbg = t.bg, ctermfg = t.dim1 })
hl("IBLWhitespace", { bg = g.bg, fg = g.dim1, ctermbg = t.bg, ctermfg = t.dim1, bold = true })

-- Cmp
hl("CmpItemAbbrDeprecated", { bg = g.bg, fg = g.br_black, ctermbg = t.bg, ctermfg = t.br_black, strikethrough = true })
hl("CmpItemAbbrMatch", { bg = g.bg, fg = g.blue, ctermbg = t.bg, ctermfg = t.blue, bold = true })
hl("CmpItemAbbrMatchFuzzy", { bg = g.bg, fg = g.blue, ctermbg = t.bg, ctermfg = t.blue, bold = true })
hl("CmpItemKindVariable", { bg = g.bg, fg = g.br_white, ctermbg = t.bg, ctermfg = t.br_white, bold = true })
hl("CmpItemKindInterface", { bg = g.bg, fg = g.cyan, ctermbg = t.bg, ctermfg = t.cyan })
hl("CmpItemKindText", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })
hl("CmpItemKindEnum", { bg = g.bg, fg = g.orange, ctermbg = t.bg, ctermfg = t.orange })
hl("CmpItemKindFunction", { bg = g.bg, fg = g.orange, ctermbg = t.bg, ctermfg = t.orange, bold = true })
hl("CmpItemKindField", { bg = g.bg, fg = g.green, ctermbg = t.bg, ctermfg = t.green, bold = true })
hl("CmpItemKindSnippet", { bg = g.bg, fg = g.red, ctermbg = t.bg, ctermfg = t.red, bold = true })
hl("CmpItemKindMethod", { bg = g.bg, fg = g.mag, ctermbg = t.bg, ctermfg = t.mag })
hl("CmpItemKindKeyword", { bg = g.bg, fg = g.mag, ctermbg = t.bg, ctermfg = t.mag, bold = true })
hl("CmpItemKindProperty", { bg = g.bg, fg = g.yellow, ctermbg = t.bg, ctermfg = t.yellow })
hl("CmpItemKindUnit", { bg = g.bg, fg = g.yellow, ctermbg = t.bg, ctermfg = t.yellow })
hl("CmpItemMenu", { bg = g.bg, fg = g.br_black, ctermbg = t.bg, ctermfg = t.br_black })
hl("CmpItemAbbr", { bg = g.bg, fg = g.fg, ctermbg = t.bg, ctermfg = t.fg })

-- Git
hl("Added", { bg = g.bg, fg = g.git_add, ctermbg = t.bg, ctermfg = t.git_add })
hl("Changed", { bg = g.bg, fg = g.git_mod, ctermbg = t.bg, ctermfg = t.git_mod })
hl("Deleted", { bg = g.bg, fg = g.git_del, ctermbg = t.bg, ctermfg = t.git_del })

-- Nix
hl("@nix.attr.root", { fg = g.br_white, ctermfg = t.br_white })

-- Lua
hl("@constructor.lua", { fg = g.br_white, ctermfg = t.br_white })

-- Obsidian
hl("ObsidianTodo", { fg = g.br_white, ctermfg = t.br_white, bold = true })
hl("ObsidianDone", { fg = g.br_blue, ctermfg = t.br_blue })
hl("ObsidianRightArrow", { fg = g.orange, ctermfg = t.orange })
hl("ObsidianTilde", { fg = g.mag, ctermfg = t.mag })
hl("ObsidianImportant", { fg = g.red, ctermfg = t.red })
hl("ObsidianBullet", { fg = g.br_blue, ctermfg = t.br_blue })
hl("ObsidianRefText", { fg = g.br_mag, ctermfg = t.br_mag })
hl("ObsidianExtLinkIcon", { fg = g.br_mag, ctermfg = t.br_mag })
hl("ObsidianTag", { fg = g.br_blue, ctermfg = t.br_blue })
hl("ObsidianBlockID", { fg = g.br_blue, ctermfg = t.br_blue })
hl("ObsidianHighlightText", { fg = g.green, ctermfg = t.green })

-- Markdown
hl("MarkviewCode", { guibg = g.bg })
hl("MarkviewCodeInfo", { guibg = g.bg, fg = g.dim })
hl("MarkviewInlineCode", { bg = g.bg2, fg = g.fg })
hl("MarkviewHeading1", { fg = "#d4b896", bold = true })
hl("MarkviewHeading2", { fg = "#a59a84", bold = true })
hl("MarkviewHeading3", { fg = "#7a7060" })
hl("MarkviewTableBorder", { fg = g.dim })
hl("MarkviewTableHeader", { fg = g.fg, bold = true })
hl("MarkviewTableRow", { fg = g.fg })
hl("MarkviewTableAlignLeft", { fg = g.dim })
hl("MarkviewTableAlignRight", { fg = g.dim })
hl("MarkviewTableAlignCenter", { fg = g.dim })
hl("MarkviewBlockQuoteBorder", { fg = g.dim })
hl("MarkviewBlockQuoteNote", { fg = "#7a9ec2" })
hl("MarkviewBlockQuoteWarn", { fg = "#c2a97a" })
hl("MarkviewBlockQuoteOk", { fg = "#7ac27a" })
hl("MarkviewBlockQuoteSpecial", { fg = "#a97ac2" })
hl("MarkviewGradient5", { fg = g.dim })
hl("MarkviewCheckboxChecked", { fg = "#7ac27a" })
hl("MarkviewCheckboxUnchecked", { fg = g.dim })
