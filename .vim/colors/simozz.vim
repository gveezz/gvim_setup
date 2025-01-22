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

let g:colors_name = "simozz"
let colors_name = "simozz"

let g:simozz_bgcolor = '#222222'

hi Normal                 guifg=white guibg=#222222 ctermbg=black ctermfg=white
hi Scrollbar              guifg=black guibg=cyan
hi Menu                   guifg=black guibg=cyan
hi SpecialKey             term=bold cterm=bold  ctermfg=LightGrey  guifg=#888888 gui=bold
hi NonText                term=bold cterm=bold  ctermfg=LightGrey  gui=bold guifg=#222222 " guifg=#cc0000
hi Directory              term=bold cterm=bold  ctermfg=Yellow  guifg=Yellow "gui=bold
hi HiddenDirectory        term=bold cterm=bold  ctermfg=Yellow  guifg=#B0B0FF "gui=bold
hi LinkPath               term=bold cterm=bold  ctermfg=Yellow  guifg=#00FF00 "gui=bold
hi LinkId                 term=bold cterm=bold  ctermfg=Yellow  guifg=#ffb922 "gui=bold
hi ErrorMsg               term=standout  cterm=bold  ctermfg=grey  ctermbg=red  guifg=#000000  guibg=Yellow gui=bold
hi IncSearch              term=reverse  ctermfg=white  ctermbg=Green  guifg=Green  guibg=white
hi Search                 guibg=white guifg=#000000 guibg=#00ff00 gui=bold
hi MoreMsg                term=bold  cterm=bold  ctermfg=darkgreen  gui=bold  guifg=SeaGreen
hi ModeMsg                term=bold  cterm=bold  gui=bold  guifg=White  guibg=Blue
hi LineNr                 term=underline  cterm=bold  ctermfg=Green  guifg=Yellow
hi Question               term=standout  cterm=bold  ctermfg=yellow  gui=bold  guifg=Green
hi Title                  term=bold  cterm=bold  ctermfg=LightGrey  gui=bold  guifg=Magenta
hi Visual                 guibg=#467BFF guifg=#000000 gui=bold cterm=bold  ctermfg=white ctermbg=LightBlue
hi HighCW                 guibg=#c0c0c0 guifg=#000000 gui=bold cterm=bold  ctermfg=white ctermbg=LightBlue
hi WarningMsg             term=standout  cterm=bold  ctermfg=black ctermbg=Yellow guifg=black guibg=Yellow

hi Cursor                 guibg=#0000ff guifg=#000000 cterm=bold
hi nCursor                guibg=#007cff guifg=#000000 cterm=bold
" hi cCursor              guibg=#b8b8b8 guifg=#000000 cterm=bold
hi cCursor                guibg=#00ff00 cterm=bold
hi iCursor                guibg=#467BFF guifg=#000000 cterm=bold 
hi vCursor                guibg=#ab46ff guifg=#000000 cterm=bold

hi MsgArea                term=bold,reverse cterm=bold guibg=#222222 gui=bold ctermbg=black ctermfg=lightgray

hi Comment                term=bold  cterm=bold ctermfg=yellow guifg=Yellow gui=bold
hi Constant               term=underline  cterm=bold ctermfg=magenta guifg=#ED762E gui=bold
hi Special                term=bold  cterm=bold ctermfg=LightYellow guifg=#f7aa1b gui=bold
hi Identifier             term=underline   ctermfg=brown  guifg=#40ffff
hi Statement              term=bold  cterm=bold ctermfg=yellow  gui=bold  guifg=#B0B0FF
hi PreProc                term=underline  ctermfg=darkmagenta   guifg=#E179FF gui=bold
hi Type                   term=underline  cterm=bold ctermfg=lightgreen  gui=bold  guifg=#B0B0FF gui=bold
hi Error                  term=reverse  ctermfg=darkcyan  ctermbg=black  guifg=#ffffff  guibg=#ff0000
hi Todo                   term=standout  ctermfg=black  ctermbg=darkcyan  guifg=Blue  guibg=Yellow
hi CursorLine             term=underline  guibg=#555555 gui=bold cterm=bold ctermfg=white ctermbg=black
hi CursorLineI            term=underline  guibg=#555555 gui=bold cterm=bold ctermfg=white ctermbg=black
hi CursorLineN            term=underline  guibg=#0000FF gui=bold cterm=bold ctermfg=white ctermbg=black
hi CursorColumn           term=underline  guibg=#AAAAAA gui=bold cterm=bold ctermfg=white ctermbg=black
hi CursorLineNR           ctermfg=red guibg=#222222 guifg=#00ff00
hi MatchParen             term=reverse  ctermfg=blue guibg=Blue
hi TabLine                term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineFill            term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineSel             term=reverse  ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Underlined             term=underline cterm=bold,underline ctermfg=lightblue guifg=lightblue guibg=#222222 gui=bold,underline
hi Ignore                 ctermfg=black ctermbg=black guifg=black guibg=black
hi StatusLine             ctermfg=15  guifg=#F3C81B guibg=#4900B8 gui=bold ctermbg=239 cterm=bold
hi StatusLineNC           ctermfg=249 guifg=#000000 guibg=#AAAAAA gui=bold ctermbg=239 cterm=bold

hi StatusLineM            ctermfg=15  guifg=#9700ff guibg=yellow gui=bold ctermbg=239 cterm=bold
hi StatusLineG            ctermfg=15  guifg=#00ff00 guibg=#222222 gui=bold ctermbg=239 cterm=bold 
hi StatusLineR            ctermfg=15  guifg=#ff0000 guibg=#222222 gui=bold ctermbg=239 cterm=bold 
hi StatusLineY            ctermfg=15  guifg=#ffff00 guibg=#222222 gui=bold ctermbg=239 cterm=bold 
hi StatusLineLB           ctermfg=15  guifg=#6b9bf3 guibg=#222222 gui=bold ctermbg=239 cterm=bold 
hi StatusLineO            ctermfg=15  guifg=#ffa239 guibg=#222222 gui=bold ctermbg=239 cterm=bold 
hi StatusLineO2           ctermfg=15  guifg=#ec4f01 guibg=#222222 gui=bold ctermbg=239 cterm=bold 
hi StatusLineP            ctermfg=15  guifg=#eb58ff guibg=#222222 gui=bold ctermbg=239 cterm=bold
hi Pmenu                  ctermbg=15  guifg=#AAAAAA guibg=#323232 gui=bold
hi PmenuSel               ctermbg=15  guifg=#000000 gui=bold
hi PmenuMatchSel          ctermbg=15  guifg=#000000 guibg=#00ff00 gui=bold
hi ColorColumn            ctermbg=15  guibg=#6F6F6F
hi Folded                 guibg=#222222 guifg=#aaaaaa gui=bold ctermbg=239 cterm=bold ctermfg=15
hi FoldColumn             guibg=#222222 guifg=#aaaaaa gui=bold ctermbg=239 cterm=bold ctermfg=15
hi link String            Special
hi link Character         Special
hi link Number            PreProc
hi link Boolean           Special
hi link Float             Number
hi link Function          Identifier
hi link Conditional       Statement
hi link Repeat            Statement
hi link Label             Statement
hi link Operator          Statement
hi link Keyword           Statement
hi link Exception         Statement
hi link Include           PreProc
hi link Define            PreProc 
hi link Macro             PreProc
hi link PreCondit         PreProc
hi link StorageClass      Type
hi link Structure         Type
hi link Typedef           Type
hi link Tag               Special
hi link SpecialChar       Special
hi link Delimiter         Special
hi link SpecialComment    Special
hi link Debug             Special
