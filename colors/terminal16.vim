" 16 colors scheme that uses your terminal colors

set background=dark

highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name='terminal16'

" TESTING

function! InsertMissingGroups()
  while search('hl-', 'W')
    normal f-lye
    if !search(@", '')
      normal 'e
      normal ohi " ctermbg=none ctermfg=none cterm=none
    endif
    normal 
  endwhile
endfunction

function! DocumentGroup()
  " call search('^hi [A-Z]\w\+', 'W') " search for the next group
  normal 0wye " copy group name
  let group_name=@"
  normal  " switch to other pane

  " go to help article
  execute 'help hl-'.group_name

  normal j0v/hl-k$y " copy documentation
  normal  " switch back
  normal O" " " paste documentation as comment above

  " cleanup:

  " delete group name
  call search(group_name, 'b')
  normal dw

  retab

  " delete trailing newlines
  normal vap:g/^"$/d
  " delete doubled space
  normal gv:s/\s\{2,}/ /eg
endfunction

function! DocumentCodeGroup()
  normal "cyewY/hi cO" "j0w
endfunction

function! ClearColorHighlighting()
  " hi clear Black
  " hi clear DarkGrey
  " hi clear Blue
  " hi clear Green
  " hi clear Cyan
  " hi clear Red
  " hi clear Magenta
  " hi clear Yellow
  " hi clear White
  call clearmatches()
endfunction

function! SetupColorHighlighting() 
  " hi Black ctermfg=white ctermbg=black cterm=none
  " hi DarkGrey ctermfg=white ctermbg=darkgrey cterm=none
  " hi Blue ctermfg=black ctermbg=blue cterm=none
  " hi Green ctermfg=black ctermbg=green cterm=none
  " hi Cyan ctermfg=black ctermbg=cyan cterm=none
  " hi Red ctermfg=black ctermbg=red cterm=none
  " hi Magenta ctermfg=black ctermbg=magenta cterm=none
  " hi Yellow ctermfg=black ctermbg=yellow cterm=none
  " hi White ctermfg=black ctermbg=white cterm=none

  " call matchadd('Black', 'black')
  " call matchadd('DarkGrey', 'darkgrey')
  " call matchadd('Blue', 'blue')
  " call matchadd('Green', 'green')
  " call matchadd('Cyan', 'cyan')
  " call matchadd('Red', 'red')
  " call matchadd('Magenta', 'magenta')
  " call matchadd('Yellow', 'yellow')
  " call matchadd('White', 'white') 
  call clearmatches()
  mark ` " save cursor position
  normal gg
  while search('hi [A-Z]\w\+', 'W')
    normal w"hye " copy group name to register 'h'
    call matchadd(@h, '^" ' . @h) " add match
  endwhile
  normal `` " return to cursor
endfunction

augroup terminal16 
  autocmd!

  " reload colorscheme every time it's edited
  autocmd BufWritePost colors/terminal16.vim source %

  " highlight colors
  " autocmd BufWinLeave <buffer> call ClearColorHighlighting()
  " autocmd BufWinEnter,BufWritePost <buffer> call SetupColorHighlighting()
augroup END


" EDITOR SETTINGS

" normal text
hi Normal ctermfg=none ctermbg=none cterm=none

" the character under cursor
hi Cursor ctermfg=none ctermbg=none cterm=none

" the screen line that the cursor is in when 'cursorline' is set
hi CursorLine ctermfg=none ctermbg=none cterm=none

" Line number for ":number" and ":#" commands, and when 'number' or
" 'relativenumber' option is set.
hi LineNr ctermfg=black ctermbg=none cterm=none

" Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
hi CursorLineNr ctermfg=none ctermbg=none cterm=none

" CursorColumn the screen column that the cursor is in when 'cursorcolumn' is
" set
hi CursorColumn ctermfg=none ctermbg=none cterm=none

" 'foldcolumn'
hi FoldColumn ctermfg=black ctermbg=none cterm=none

" column where signs are displayed
hi SignColumn ctermfg=none ctermbg=none cterm=none

" line used for closed folds
hi Folded ctermfg=darkgrey ctermbg=none cterm=none

" the column separating vertically split windows
hi VertSplit ctermfg=black ctermbg=none cterm=none

" used for the columns set with 'colorcolumn'
hi ColorColumn ctermfg=none ctermbg=none cterm=none

" tab pages line, not active tab page label
hi TabLine ctermfg=white ctermbg=black cterm=none

" tab pages line, where there are no labels
hi TabLineFill ctermfg=darkgrey ctermbg=black cterm=none

" tab pages line, active tab page label
hi TabLineSel ctermfg=darkgrey ctermbg=none cterm=none

" directory names (and other special names in listings)
hi Directory ctermfg=none ctermbg=none cterm=none

" Last search pattern highlighting (see 'hlsearch').  Also used for similar
" items that need to stand out.
hi Search ctermfg=none ctermbg=none cterm=underline

" 'incsearch' highlighting; also used for the text replaced with ":s///c"
hi IncSearch ctermfg=none ctermbg=none cterm=underline

" status line of current window
hi StatusLine ctermfg=none ctermbg=black cterm=none

" status lines of not-current windows
" Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line
" of the current window.
hi StatusLineNC ctermfg=darkgrey ctermbg=black cterm=none

" current match in 'wildmenu' completion
hi WildMenu ctermfg=black ctermbg=white cterm=none

" hit-enter prompt and yes/no questions
hi Question ctermfg=none ctermbg=none cterm=none

" titles for output from ":set all", ":autocmd" etc.
hi Title ctermfg=none ctermbg=none cterm=none

" 'showmode' message (e.g., "-- INSERT --")
hi ModeMsg ctermfg=black ctermbg=none cterm=none

" more-prompt
hi MoreMsg ctermfg=blue ctermbg=none cterm=none

" The character under the cursor or just before it, if it is a paired bracket,
" and its match.
hi MatchParen ctermfg=black ctermbg=magenta cterm=none

" Visual mode selection
hi Visual ctermfg=none ctermbg=black cterm=none

" '@' at the end of the window, characters from 'showbreak' and other characters
" that do not really exist in the text (e.g., ">" displayed when a double-wide
" character doesn't 
hi NonText ctermfg=black ctermbg=none cterm=none

" error messages on the command line
hi ErrorMsg ctermfg=black ctermbg=red cterm=none

" warning messages
hi WarningMsg ctermfg=black ctermbg=yellow cterm=none

" Unprintable characters: text displayed differently from what
hi SpecialKey ctermfg=cyan ctermbg=none cterm=none

" diff mode: Added line
hi DiffAdd ctermfg=green ctermbg=none cterm=none
hi! link diffAdded DiffAdd

" diff mode: Changed line
hi DiffChange ctermfg=none ctermbg=none cterm=none

" diff mode: Deleted line
hi DiffDelete ctermfg=red ctermbg=none cterm=none
hi! link diffRemoved DiffDelete

" diff mode: Changed text within a changed line
hi DiffText ctermfg=none ctermbg=black cterm=none

" Popup menu: normal item.
hi Pmenu ctermfg=none ctermbg=none cterm=none

" Popup menu: selected item.
hi PmenuSel ctermfg=none ctermbg=none cterm=none

" Popup menu: scrollbar.
hi PmenuSbar ctermfg=none ctermbg=none cterm=none

" Popup menu: Thumb of the scrollbar.
hi PmenuThumb ctermfg=none ctermbg=none cterm=none

" Word that is not recognized by the spellchecker.
" Combined with the highlighting used otherwise.
hi SpellBad ctermfg=none ctermbg=none cterm=none

" Word that should start with a capital.
" Combined with the highlighting used otherwise.
hi SpellCap ctermfg=none ctermbg=none cterm=none

" Word that is recognized by the spellchecker as one that is
" used in another region.
" Combined with the highlighting used otherwise.
hi SpellLocal ctermfg=none ctermbg=none cterm=none

" Word that is recognized by the spellchecker as one that is
" hardly ever used.
" Combined with the highlighting used otherwise.
hi SpellRare ctermfg=none ctermbg=none cterm=none

" "nbsp", "space", "tab" and "trail" in 'listchars'
hi Whitespace ctermbg=none ctermfg=none cterm=none

" Current quickfix item in the quickfix window. Combined with 
" hl-CursorLine when the cursor is there.
hi QuickFixLine ctermbg=none ctermfg=none cterm=none

" :substitute replacement text highlighting
hi Substitute ctermbg=none ctermfg=none cterm=none

" cursor in an unfocused terminal
hi TermCursorNC ctermbg=none ctermfg=none cterm=none

" cursor in a focused terminal
hi TermCursor ctermbg=none ctermfg=none cterm=none

" filler lines (~) after the end of the buffer.
hi! link EndOfBuffer NonText

" CursorIM like Cursor, but used when in IME mode 
hi CursorIM ctermbg=none ctermfg=none cterm=none

" placeholder characters substituted for concealed
" text (see 'conceallevel')
hi Conceal ctermbg=none ctermfg=none cterm=none


hi StringDelimiter ctermfg=none ctermbg=none cterm=none

" CODE

" any comment
hi Comment ctermfg=darkgrey ctermbg=none cterm=none


" any constant
hi Constant ctermfg=cyan ctermbg=none cterm=none

" a string constant: "this is a string"
hi String ctermfg=green ctermbg=none cterm=none

" a character constant: 'c', '\n'
hi Character ctermfg=cyan ctermbg=none cterm=none

" a number constant: 234, 0xff
hi Number ctermfg=cyan ctermbg=none cterm=none

" a boolean constant: TRUE, false
hi Boolean ctermfg=cyan ctermbg=none cterm=none

" a floating point constant: 2.3e10
hi Float ctermfg=cyan ctermbg=none cterm=none

" any variable name
hi Identifier ctermfg=green ctermbg=none cterm=none

" function name (also: methods for classes)
hi Function ctermfg=red ctermbg=none cterm=none

" any statement
hi Statement ctermfg=blue ctermbg=none cterm=none

" if, then, else, endif, switch, etc.
hi Conditional ctermfg=blue ctermbg=none cterm=none

" for, do, while, etc.
hi Repeat ctermfg=blue ctermbg=none cterm=none

" case, default, etc.
hi Label ctermfg=blue ctermbg=none cterm=none

" "sizeof", "+", "*", etc.
hi Operator ctermfg=blue ctermbg=none cterm=none

" any other keyword
hi Keyword ctermfg=yellow ctermbg=none cterm=none

" try, catch, throw
hi Exception ctermfg=blue ctermbg=none cterm=none

" generic Preprocessor
hi PreProc ctermfg=red ctermbg=none cterm=none

" preprocessor #include
hi Include ctermfg=red ctermbg=none cterm=none

" preprocessor #define
hi Define ctermfg=red ctermbg=none cterm=none

" same as Define
hi Macro ctermfg=red ctermbg=none cterm=none

" preprocessor #if, #else, #endif, etc.
hi PreCondit ctermfg=red ctermbg=none cterm=none

" int, long, char, etc.
hi Type ctermfg=yellow ctermbg=none cterm=none

" static, register, volatile, etc.
hi StorageClass ctermfg=yellow ctermbg=none cterm=none

" struct, union, enum, etc.
hi Structure ctermfg=yellow ctermbg=none cterm=none

" A typedef
hi Typedef ctermfg=yellow ctermbg=none cterm=none

" any special symbol
hi Special ctermfg=yellow ctermbg=none cterm=none

" special character in a constant
hi SpecialChar ctermfg=yellow ctermbg=none cterm=none

" you can use CTRL-] on this
hi Tag ctermfg=yellow ctermbg=none cterm=underline

" character that needs attention
hi Delimiter ctermfg=yellow ctermbg=none cterm=none

" special things inside a comment
hi SpecialComment ctermfg=yellow ctermbg=none cterm=none

" debugging statements
hi Debug ctermfg=magenta ctermbg=none cterm=none

" text that stands out, HTML links
hi Underlined ctermfg=blue ctermbg=none cterm=underline

" left blank, hidden  |hl-Ignore|
hi Ignore ctermfg=black ctermbg=none cterm=none

" any erroneous construct
hi Error ctermfg=red ctermbg=none cterm=none

" anything that needs extra attention; mostly the
hi Todo ctermfg=black ctermbg=yellow cterm=none

