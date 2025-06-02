if exists('b:current_syntax')
  finish
endif

syn match vimfmDirectory '^.\+/$'
syn match vimfmHidden '^\..\+$'
syn match vimfmHiddenWithIcon '^.\..\+$'
syn match vimfmSelected '^*.\+$'
syn match vimfmNoItems '^(no items)$'
exec "syn match vimfmLink \'^.*\\ze\\s".g:vimfm_linkid_str."'"
exec "syn match vimfmLinkId '".g:vimfm_linkid_str."'"
syn match vimfmLinkPathDir '\zs\/.*\/$'

hi Directory              term=bold cterm=bold  ctermfg=Yellow  guifg=Yellow "gui=bold
hi HiddenDirectory        term=bold cterm=bold  ctermfg=Yellow  guifg=#B0B0FF "gui=bold
hi LinkPath               term=bold cterm=bold  ctermfg=Yellow  guifg=#22ffff "gui=bold
hi LinkId                 term=bold cterm=bold  ctermfg=Yellow  guifg=#ffb922 "gui=bold

hi! def link vimfmDirectory Directory
hi! def link vimfmHidden HiddenDirectory
hi! def link vimfmHiddenWithIcon HiddenDirectory
hi! def link vimfmNoItems Comment
hi! def link vimfmSelected Special
hi! def link vimfmLink LinkPath
hi! def link vimfmLinkId LinkId
hi! def link vimfmLinkPathDir Directory

let b:current_syntax = 'vimfm'
