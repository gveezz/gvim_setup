if exists('b:current_syntax')
  finish
endif

syn match vimfmDirectory '^.\+/$'
syn match vimfmHidden '^\..\+$'
syn match vimfmHiddenWithIcon '^.\..\+$'
syn match vimfmSelected '^*.\+$'
syn match vimfmNoItems '^(no items)$'
syn match vimfmLink '^.*\ze\s\/@'
syn match vimfmLinkId '\/@/'

hi! def link vimfmDirectory Directory
hi! def link vimfmHidden HiddenDirectory
hi! def link vimfmHiddenWithIcon HiddenDirectory
hi! def link vimfmNoItems Comment
hi! def link vimfmSelected Special
hi! def link vimfmLink LinkPath
hi! def link vimfmLinkId LinkId

let b:current_syntax = 'vimfm'
