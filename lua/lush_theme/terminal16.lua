---@diagnostic disable: undefined-global
local lush = require('lush')
local hsl = lush.hsl

-- Kitty configuration:
-- foreground hsl('#D6D6D6')
-- background hsl('#262626')
-- selection_foreground hsl('#D6D6D6')
-- selection_background hsl('#646464')
--
-- color0 hsl('#646464')
-- color8 hsl('#979797')
-- color1 hsl('#F58E8E')
-- color9 hsl('#F58E8E')
-- color2  hsl('#A8D2AA')
-- color10 hsl('#A8D2AA')
-- color3  hsl('#FCD27E')
-- color11 hsl('#FCD27E')
-- color4  hsl('#7AAAD3')
-- color12 hsl('#7AAAD3')
-- color5  hsl('#D6ADD5')
-- color13 hsl('#D6ADD5')
-- color6  hsl('#79D4D5')
-- color14 hsl('#79D4D5')
-- color7  hsl('#D6D6D6')
-- color15 hsl('#D6D6D6')

local background = hsl('#262626') -- can be nil
local red = hsl('#F58E8E')
local green = hsl('#A8D2AA')
local yellow = hsl('#FCD27E')
local blue = hsl('#7AAAD3')
local magenta = hsl('#D6ADD5')
local cyan = hsl('#79D4D5')
local foreground = hsl('#D6D6D6') -- can be nil

local darkgrey = hsl('#646464')
local lightgrey = hsl('#979797')

--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    Normal         { fg = foreground, bg = background }, -- Normal text
    NonText        { fg = darkgrey }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Visual         { bg = darkgrey.darken(40) }, -- Visual mode selection
    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    Conceal        { NonText }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         { }, -- Character under the cursor
    CurSearch      { gui = "underline" }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { Normal }, -- Directory names (and other special names in listings)
    Added          { fg = green },
    Changed        { Normal },
    Removed        { fg = red },
    DiffAdd        { Added }, -- Diff mode: Added line |diff.txt|
    DiffChange     { Changed }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { Removed }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { bg = darkgrey }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg       { fg = red }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    Folded         { fg = darkgrey }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    SignColumn     { NonText }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr         { NonText }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     { bg = Visual.bg, fg = yellow, gui = "bold" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        { fg = green }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { Normal }, -- |more-prompt|
    NormalFloat    { Normal }, -- Normal text in floating windows.
    WinSeparator   { fg = darkgrey }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    FloatBorder    { WinSeparator }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    Pmenu          { bg = darkgrey, fg = Normal.fg }, -- Popup menu: Normal item.
    PmenuSel       { fg = darkgrey, bg = yellow }, -- Popup menu: Selected item.
    PmenuExtra     { bg = Pmenu.bg, fg = lightgrey }, -- Popup menu: Normal item "extra text"
    PmenuExtraSel  { bg = PmenuSel.bg, fg = PmenuExtra.fg }, -- Popup menu: Selected item "extra text"
    PmenuKind      { PmenuExtra }, -- Popup menu: Normal item "kind"
    PmenuKindSel   { PmenuExtraSel }, -- Popup menu: Selected item "kind"
    PmenuSbar      { Pmenu }, -- Popup menu: Scrollbar.
    PmenuThumb     { Pmenu }, -- Popup menu: Thumb of the scrollbar.
    Question       { fg = cyan }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine   { fg = yellow }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { CurSearch }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     { NonText }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       { sp = red, gui = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       { sp = yellow, gui = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     { sp = green, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      { sp = cyan, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { fg = foreground, bg = darkgrey.darken(25) }, -- Status line of current window
    StatusLineNC   { fg = lightgrey, bg = StatusLine.bg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        { StatusLineNC }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    TabLineSel     { Normal }, -- Tab pages line, active tab page label
    Title          { fg = foreground, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { fg = yellow }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = lightgrey }, -- Any comment

    Constant       { Normal }, -- (*) Any constant
    String         { fg = green }, --   A string constant: "this is a string"
    Character      { fg = cyan }, --   A character constant: 'c', '\n'
    Number         { Normal }, --   A number constant: 234, 0xff
    Boolean        { Normal }, --   A boolean constant: TRUE, false
    Float          { Normal }, --   A floating point constant: 2.3e10

    Identifier     { Normal }, -- (*) Any variable name
    Function       { Normal }, --   Function name (also: methods for classes)

    Statement      { gui = "bold", fg = Normal.fg  }, -- (*) Any statement
    -- Conditional    { Statement }, --   if, then, else, endif, switch, etc.
    -- Repeat         { Statement }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator       { Statement }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { Statement }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { Normal }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { Statement }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter      { fg = yellow }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { NonText }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { bg = red, fg = background }, -- Any erroneous construct
    Todo           { bg = yellow, fg = background }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { ErrorMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { WarningMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = cyan } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = blue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { fg = green } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { NonText } , -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { NonText } , -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { NonText } , -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint  { NonText } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticVirtualTextOk    { NonText } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { sp = DiagnosticError.fg, gui = "undercurl" } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { sp = DiagnosticWarn.fg, gui = "undercurl" } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { sp = DiagnosticInfo.fg, gui = "undercurl" } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { sp = DiagnosticHint.fg, gui = "undercurl" } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk      { sp = DiagnosticOk.fg, gui = "undercurl" } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Git
    diffLine { Delimiter },

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    -- Dev Icon adjustments
    DevIconRakefile { fg = red },
    DevIconRake { fg = red },
    DevIconRb { fg = red },
    DevIconErb { fg = red },
    DevIconGemspec { fg = red },
    DevIconGemfile { fg = red },
    DevIconConfigRu { fg = red },
    DevIconBrewfile { fg = red },
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
