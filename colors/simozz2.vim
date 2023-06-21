" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:   Simon
" Last Change:  2018 16 10

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "simozz2"
let colors_name = "simozz2"
hi Normal         guifg=white  guibg=#0a0a0a
hi Scrollbar      guifg=black guibg=cyan
hi Menu           guifg=black guibg=cyan
hi SpecialKey     term=bold  cterm=bold  ctermfg=darkred  guifg=#cc0000
hi NonText        term=bold  cterm=bold  ctermfg=darkred  gui=bold  guifg=#cc0000
hi Directory      term=bold  cterm=bold  ctermfg=brown  guifg=Yellow
hi ErrorMsg       term=standout  cterm=bold  ctermfg=grey  ctermbg=red  guifg=White  guibg=Red
hi Search         term=reverse  ctermfg=white  ctermbg=red  guifg=white  guibg=Green
hi MoreMsg        term=bold  cterm=bold  ctermfg=darkgreen  gui=bold  guifg=SeaGreen
hi ModeMsg        term=bold  cterm=bold  gui=bold  guifg=White  guibg=Blue
hi LineNr         term=underline  cterm=bold  ctermfg=darkcyan  guifg=Yellow
hi Question       term=standout  cterm=bold  ctermfg=darkgreen  gui=bold  guifg=Green
hi StatusLine     term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi StatusLineNC   term=reverse  ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Title          term=bold  cterm=bold  ctermfg=darkmagenta  gui=bold  guifg=Magenta
hi Visual         guifg=black guibg=#fff177 
hi WarningMsg     term=standout  cterm=bold  ctermfg=black ctermbg=Yellow guifg=black guibg=Yellow
hi Cursor         guifg=#f7aa1b  guibg=#f7aa1b cterm=bold guifg=#000000
hi Comment        term=bold  cterm=bold ctermfg=cyan  guifg=Yellow
hi Constant       term=underline  cterm=bold ctermfg=magenta  guifg=#ed7aee
hi Special        term=bold  cterm=bold ctermfg=red  guifg=#f7aa1b
hi Identifier     term=underline   ctermfg=brown  guifg=#40ffff
hi Statement      term=bold  cterm=bold ctermfg=yellow  gui=bold  guifg=#5555FE
hi PreProc        term=underline  ctermfg=darkmagenta   guifg=#E179FF
hi Type           term=underline  cterm=bold ctermfg=lightgreen  gui=bold  guifg=#A1A1FF
hi Error          term=reverse  ctermfg=darkcyan  ctermbg=black  guifg=#ffffff  guibg=#ff0000
hi Todo           term=standout  ctermfg=black  ctermbg=darkcyan  guifg=Blue  guibg=Yellow
hi CursorLine     term=underline  guibg=#2f2f2f cterm=underline ctermfg=black
hi CursorColumn   term=underline  guibg=#000000 cterm=underline
hi CursorLineNR   ctermfg=red guibg=#000000 guifg=#00ff00
hi MatchParen     term=reverse  ctermfg=blue guibg=Blue
hi TabLine        term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineFill    term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineSel     term=reverse  ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Underlined     term=underline cterm=bold,underline ctermfg=lightblue guifg=lightblue gui=bold,underline
hi Ignore         ctermfg=black ctermbg=black guifg=black guibg=black
hi StatusLine     ctermfg=15 ctermbg=239 cterm=bold guifg=#3F64CE guibg=#D7D8DA gui=bold
hi StatusLineNC   ctermfg=15 ctermbg=239 cterm=bold guifg=#fff8b0 guibg=#0a0a0a gui=bold
hi StatusLineR	  ctermfg=15 ctermbg=239 cterm=bold guifg=#ff0000 guibg=#D7D8DA gui=bold
hi link IncSearch       Visual
hi link String		Special
hi link Character	Special
hi link Number          Constant
hi link Boolean         Special
hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
