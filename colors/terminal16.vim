" 16 colors scheme that uses your terminal colors

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="terminal16"


" TESTING

hi Black ctermfg=white ctermbg=black cterm=none
call matchadd("Black", "black")

hi DarkGrey ctermfg=white ctermbg=darkgrey cterm=none
call matchadd("DarkGrey", "darkgrey")

hi Blue ctermfg=black ctermbg=blue cterm=none
call matchadd("Blue", "blue")

hi Green ctermfg=black ctermbg=green cterm=none
call matchadd("Green", "green")

hi Cyan ctermfg=black ctermbg=cyan cterm=none
call matchadd("Cyan", "cyan")

hi Red ctermfg=black ctermbg=red cterm=none
call matchadd("Red", "red")

hi Magenta ctermfg=black ctermbg=magenta cterm=none
call matchadd("Magenta", "magenta")

hi Yellow ctermfg=black ctermbg=yellow cterm=none
call matchadd("Yellow", "yellow")

hi White ctermfg=black ctermbg=white cterm=none
call matchadd("White", "white")

" reload colorscheme every time it's edited
augroup terminal16 
  autocmd!
  autocmd BufWritePost <buffer> source %
augroup END


" EDITOR SETTINGS

hi Normal         ctermfg=none    ctermbg=none   cterm=none
hi Cursor         ctermfg=none    ctermbg=none   cterm=none
hi CursorLine     ctermfg=none    ctermbg=none   cterm=none
hi LineNr         ctermfg=black   ctermbg=none   cterm=none
hi CursorLineNR   ctermfg=none    ctermbg=none   cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=black    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=none    ctermbg=black    cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
hi VertSplit       ctermfg=black    ctermbg=none    cterm=none
hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
hi TabLine         ctermfg=darkgrey    ctermbg=black    cterm=none
hi TabLineFill     ctermfg=darkgrey    ctermbg=black    cterm=none
hi TabLineSel      ctermfg=darkgrey    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=none    ctermbg=none    cterm=none
hi Search          ctermfg=none    ctermbg=none    cterm=underline
hi IncSearch       ctermfg=none    ctermbg=none    cterm=underline

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=none    ctermbg=black    cterm=none
hi StatusLineNC    ctermfg=darkgrey    ctermbg=black    cterm=none
hi WildMenu        ctermfg=black    ctermbg=white    cterm=none
hi Question        ctermfg=none    ctermbg=none    cterm=none
hi Title           ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=black    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=blue    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=none    ctermbg=none    cterm=none
hi Visual          ctermfg=none    ctermbg=black    cterm=none
hi NonText         ctermfg=black    ctermbg=none    cterm=none

hi Todo            ctermfg=none    ctermbg=none    cterm=none
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=none    ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=none    ctermbg=none    cterm=none
hi WarningMsg      ctermfg=none    ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=none    ctermbg=none    cterm=none
hi String          ctermfg=none    ctermbg=none    cterm=none
hi StringDelimiter ctermfg=none    ctermbg=none    cterm=none
hi Character       ctermfg=none    ctermbg=none    cterm=none
hi Number          ctermfg=none    ctermbg=none    cterm=none
hi Boolean         ctermfg=none    ctermbg=none    cterm=none
hi Float           ctermfg=none    ctermbg=none    cterm=none

hi Identifier      ctermfg=none    ctermbg=none    cterm=none
hi Function        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=none    ctermbg=none    cterm=none
hi Conditional     ctermfg=none    ctermbg=none    cterm=none
hi Repeat          ctermfg=none    ctermbg=none    cterm=none
hi Label           ctermfg=none    ctermbg=none    cterm=none
hi Operator        ctermfg=none    ctermbg=none    cterm=none
hi Keyword         ctermfg=none    ctermbg=none    cterm=none
hi Exception       ctermfg=none    ctermbg=none    cterm=none
hi Comment         ctermfg=none    ctermbg=none    cterm=none

hi Special         ctermfg=none    ctermbg=none    cterm=none
hi SpecialChar     ctermfg=none    ctermbg=none    cterm=none
hi Tag             ctermfg=none    ctermbg=none    cterm=none
hi Delimiter       ctermfg=none    ctermbg=none    cterm=none
hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=none    ctermbg=none    cterm=none
hi Include         ctermfg=none    ctermbg=none    cterm=none
hi Define          ctermfg=none    ctermbg=none    cterm=none
hi Macro           ctermfg=none    ctermbg=none    cterm=none
hi PreCondit       ctermfg=none    ctermbg=none    cterm=none

hi Type            ctermfg=none    ctermbg=none    cterm=none
hi StorageClass    ctermfg=none    ctermbg=none    cterm=none
hi Structure       ctermfg=none    ctermbg=none    cterm=none
hi Typedef         ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=none    ctermbg=none    cterm=none
hi DiffChange      ctermfg=none    ctermbg=none    cterm=none
hi DiffDelete      ctermfg=none    ctermbg=none    cterm=none
hi DiffText        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=none    ctermbg=none    cterm=none
hi PmenuSel        ctermfg=none    ctermbg=none    cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=none    ctermbg=none    cterm=none
hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
hi SpellRare       ctermfg=none    ctermbg=none    cterm=none
