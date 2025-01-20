if exists('b:current_syntax')
  finish
endif

syn match vimfmDirectory '^.\+/$'
syn match vimfmHidden '^\..\+$'
syn match vimfmHiddenWithIcon '^.\..\+$'
syn match vimfmSelected '^*.\+$'
syn match vimfmNoItems '^(no items)$'

hi! def link vimfmDirectory Directory
hi! def link vimfmHidden Comment
hi! def link vimfmHiddenWithIcon Comment
hi! def link vimfmNoItems Comment
hi! def link vimfmSelected Special

let b:current_syntax = 'vimfm'
